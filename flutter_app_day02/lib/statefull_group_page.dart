import 'package:flutter/material.dart';
import 'package:flutter_color_plugin/flutter_color_plugin.dart';

class StatefulGroupPage extends StatefulWidget {
  @override
  _StatefulGroupPageState createState() => _StatefulGroupPageState();
}

class _StatefulGroupPageState extends State<StatefulGroupPage> {
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
                        margin: EdgeInsets.only(top: 10),
                        decoration:
                        BoxDecoration(color: Colors.lightBlueAccent),
                        child: PageView(
                          children: <Widget>[
                            _item("page1", Colors.deepPurple),
                            _item("page2", Colors.green),
                            _item("page3", Colors.red)
                          ],
                        ),
                      )
                      /*Text(
                              "I am a text",
//                style: textStyle,
                            ),
                            Icon(
                              Icons.android,
                              size: 50,
                              color: Colors.red,
                            ),
                            CloseButton(),
                            BackButton(),
                            Chip(
                                avatar: Icon(Icons.people),
                                label: Text("StatefulWidget与基础组件")),
                            Divider(
                              height: 10,
                              indent: 20,
                              color: Colors.orange,
                            ),
                            Card(
                              color: Colors.blue,
                              elevation: 5,
                              margin: EdgeInsets.all(10),
                              child: Container(
                                padding: EdgeInsets.all(10),
                                child: Text(
                                  "I am a card",
                                  style: textStyle,
                                ),
                              ),
                            ),
                            AlertDialog(
                              title: Text("Title"),
                              content: Text("Content"),
                            )*/
                    ],
                  ),
                )
              ],
            ),
            onRefresh: _handleRefresh,
          )
              : Text("列表")),
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
}
