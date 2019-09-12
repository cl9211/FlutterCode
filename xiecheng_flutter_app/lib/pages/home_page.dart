import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:xiecheng_flutter_app/dao/home_dao.dart';
import 'package:xiecheng_flutter_app/model/common_model.dart';
import 'package:xiecheng_flutter_app/model/grid_nav_model.dart';
import 'package:xiecheng_flutter_app/model/home_model.dart';
import 'package:xiecheng_flutter_app/model/sales_box_model.dart';
import 'package:xiecheng_flutter_app/widget/grid_nav.dart';
import 'package:xiecheng_flutter_app/widget/loading_container.dart';
import 'package:xiecheng_flutter_app/widget/local_nav.dart';
import 'package:xiecheng_flutter_app/widget/sales_box.dart';
import 'package:xiecheng_flutter_app/widget/sub_nav.dart';
import 'package:xiecheng_flutter_app/widget/webview.dart';

const APPBAR_SCROLL_OFFSET = 100;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List _imageUrls = [
    "http://pages.ctrip.com/commerce/promote/20180718/yxzy/img/640sygd.jpg",
    "https://dimg04.c-ctrip.com/images/700u0r000000gxvb93E54_810_235_85.jpg",
    "https://dimg04.c-ctrip.com/images/700c10000000pdili7D8B_780_235_57.jpg"
  ];

  List<CommonModel> bannerList = [];

  double appBarAlpha = 0;
  String resultString = '';

  List<CommonModel> localNavList = [];
  GridNavModel gridNavModel;
  List<CommonModel> subNavList;
  SalesBoxModel salesBox;
  bool _loading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xfff2f2f2),
        body: LoadingContainer(
          isLoading: _loading,
          child: Stack(
            children: <Widget>[
              MediaQuery.removePadding(
                  removeTop: true,
                  context: context,
                  child: RefreshIndicator(
                    onRefresh: _handleRefresh,
                    child: NotificationListener(
                        onNotification: (scrollNotification) {
                          if (scrollNotification is ScrollUpdateNotification &&
                              scrollNotification.depth == 0) {
                            _onScroll(scrollNotification.metrics.pixels);
                          }
                        },
                        child: _listView),
                  )),
              _appBar,
            ],
          ),
        ));
  }

  Widget get _appBar {
    return Opacity(
      opacity: appBarAlpha,
      child: Container(
        height: 80,
        decoration: BoxDecoration(color: Colors.white),
        child: Center(
          child: Padding(child: Text("首页"), padding: EdgeInsets.only(top: 20)),
        ),
      ),
    );
  }

  Widget get _banner {
    return Container(
      height: 160,
      child: Swiper(
        itemCount: bannerList.length,
        autoplay: true,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => WebView(
                            url: bannerList[index].url,
                            statusBarColor: bannerList[index].statusBarColor,
                            hideAppBar: bannerList[index].hideAppBar,
                          )));
            },
            child: Image.network(
              bannerList[index].icon,
              fit: BoxFit.fill,
            ),
          );
        },
        pagination: SwiperPagination(builder: SwiperPagination.dots),
      ),
    );
  }

  Widget get _listView {
    return ListView(
      children: <Widget>[
        _banner,
        Padding(
          padding: EdgeInsets.fromLTRB(7, 4, 7, 4),
          child: LocalNav(
            localNavList: localNavList,
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(7, 0, 7, 4),
          child: GridNav(
            gridNavModel: gridNavModel,
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(7, 0, 7, 4),
          child: SubNav(
            subNavList: subNavList,
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(7, 0, 7, 4),
          child: SalesBox(
            salesBox: salesBox,
          ),
        ),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    _handleRefresh();
  }

  _onScroll(double offset) {
    double alpha = offset / APPBAR_SCROLL_OFFSET;
    if (alpha < 0) {
      alpha = 0;
    } else if (alpha > 1) {
      alpha = 1;
    }

    setState(() {
      appBarAlpha = alpha;
    });

//    print("offset:$offset --- alpha:$alpha");
  }

  Future<Null> _handleRefresh() async {
    try {
      HomeModel model = await HomeDao.fetch();
      setState(() {
        localNavList = model.localNavList;
        gridNavModel = model.gridNav;
        subNavList = model.subNavList;
        salesBox = model.salesBox;
        bannerList = model.bannerList;

        _loading = false;
      });
    } catch (e) {
      setState(() {
        print(e);
        _loading = false;
      });
    }

    return null;

/*
    HomeDao.fetch().then((result) {
      setState(() {
        resultString = json.encode(result.config);
      });
    }).catchError((e) {
      resultString = e.toString();
    });*/
  }
}
