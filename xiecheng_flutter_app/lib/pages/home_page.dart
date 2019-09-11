import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:xiecheng_flutter_app/dao/home_dao.dart';
import 'package:xiecheng_flutter_app/model/home_model.dart';
import 'package:xiecheng_flutter_app/widget/grid_nav.dart';

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

  double appBarAlpha = 0;
  String resultString = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        MediaQuery.removePadding(
            removeTop: true,
            context: context,
            child: NotificationListener(
              onNotification: (scrollNotification) {
                if (scrollNotification is ScrollUpdateNotification &&
                    scrollNotification.depth == 0) {
                  _onScroll(scrollNotification.metrics.pixels);
                }
              },
              child: ListView(
                children: <Widget>[
                  Container(
                    height: 160,
                    child: Swiper(
                      itemCount: _imageUrls.length,
                      autoplay: true,
                      itemBuilder: (BuildContext context, int index) {
                        return Image.network(
                          _imageUrls[index],
                          fit: BoxFit.fill,
                        );
                      },
                      pagination:
                          SwiperPagination(builder: SwiperPagination.dots),
                    ),
                  ),
                  GridNav(
                    gridNavModel: null,
                    name: "xiaoming",
                  ),
                  Container(
                    height: 800,
                    child: ListTile(
                      title: Text(""),
                    ),
                  )
                ],
              ),
            )),
        Opacity(
          opacity: appBarAlpha,
          child: Container(
            height: 80,
            decoration: BoxDecoration(color: Colors.white),
            child: Center(
              child:
                  Padding(child: Text("首页"), padding: EdgeInsets.only(top: 20)),
            ),
          ),
        )
      ],
    ));
  }

  @override
  void initState() {
    super.initState();
    loadData();
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

    print("offset:$offset --- alpha:$alpha");
  }

  loadData() async {
    /*try {
      HomeModel model = await HomeDao.fetch();
      setState(() {
        resultString = json.encode(model.config);
      });
    } catch (e) {
      setState(() {
        resultString = e.toString();
      });
    }*/

    HomeModel model = await HomeDao.fetch();
    setState(() {
      resultString = json.encode(model.gridNav);
    });

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
