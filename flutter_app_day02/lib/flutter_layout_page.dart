import 'package:flutter/material.dart';
import 'package:flutter_color_plugin/flutter_color_plugin.dart';

class FlutterLayoutPage extends StatefulWidget {
  @override
  _FlutterLayoutPageState createState() => _FlutterLayoutPageState();
}

class _FlutterLayoutPageState extends State<FlutterLayoutPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = TextStyle(fontSize: 20);
    return MaterialApp(
      title: 'StatefulWidget与基础组件',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
          appBar: AppBar(
            title: Text("StatefulWidget与基础组件"),
            leading: GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back),
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            items: [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                    color: Colors.grey,
                  ),
                  activeIcon: Icon(
                    Icons.home,
                    color: Colors.blue,
                  ),
                  title: Text("首页")),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.list,
                    color: Colors.grey,
                  ),
                  activeIcon: Icon(
                    Icons.list,
                    color: Colors.blue,
                  ),
                  title: Text("列表"))
            ],
          ),
          floatingActionButton: FloatingActionButton(
            child: Text("点我"),
            onPressed: null,
          ),
          body: _currentIndex == 0
              ? RefreshIndicator(
                  child: ListView(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(color: Colors.white),
                        alignment: Alignment.center,
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                ClipOval(
                                  child: SizedBox(
                                    height: 100,
                                    width: 100,
                                    child: Image.network(
                                        "http://www.devio.org/img/avatar.png"),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(10),
                                  child: ClipRRect(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    child: Opacity(
                                      opacity: 0.6,
                                      child: Image.network(
                                        "http://www.devio.org/img/avatar.png",
                                        width: 100,
                                        height: 100,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Image.network(
                              "http://www.devio.org/img/avatar.png",
                              width: 100,
                              height: 100,
                            ),
                            TextField(
                              decoration: InputDecoration(
                                  contentPadding:
                                      EdgeInsets.fromLTRB(5, 0, 0, 0),
                                  hintText: "请输入",
                                  hintStyle: TextStyle(fontSize: 15)),
                            ),
                            Container(
                              height: 100,
                              margin: EdgeInsets.all(10),
                              child: PhysicalModel(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(6),
                                clipBehavior: Clip.antiAlias,
                                child: PageView(
                                  children: <Widget>[
                                    _item("page1", Colors.deepPurple),
                                    _item("page2", Colors.green),
                                    _item("page3", Colors.red)
                                  ],
                                ),
                              ),
                            ),
                            Column(
                              children: <Widget>[
                                FractionallySizedBox(
                                  widthFactor: 1,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.greenAccent),
                                    child: Text("宽度撑满"),
                                  ),
                                )
                              ],
                            ),
                            Stack(
                              children: <Widget>[
                                Image.network(
                                  "http://www.devio.org/img/avatar.png",
                                  width: 100,
                                  height: 100,
                                ),
                                Positioned(
                                    left: 0,
                                    bottom: 0,
                                    child: Image.network(
                                      "http://www.devio.org/img/avatar.png",
                                      width: 36,
                                      height: 36,
                                    ))
                              ],
                            ),
                            Wrap(
                              spacing: 8,
                              runSpacing: 6,
                              children: <Widget>[
                                _chip("Flutter"),
                                _chip("进阶"),
                                _chip("实践"),
                                _chip("携程"),
                                _chip("App"),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  onRefresh: _handleRefresh,
                )
              : Column(
                  children: <Widget>[
                    Text("列表"),
                   Expanded(child:  Container(
                     decoration: BoxDecoration(color: Colors.red),
                     child: Text("拉伸填满高度"),
                   ),)
                  ],
                )),
    );
  }

  Future<Null> _handleRefresh() async {
    await Future.delayed(Duration(milliseconds: 200));
  }

  _item(String title, Color color) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(color: color),
      child: Text(
        title,
        style: TextStyle(fontSize: 22, color: Colors.white),
      ),
    );
  }

  _chip(String label) {
    return Chip(
        label: Text(label),
        avatar: CircleAvatar(
          backgroundColor: Colors.blue.shade900,
          child: Text(
            label.substring(0, 1),
            style: TextStyle(fontSize: 10),
          ),
        ));
  }
}
