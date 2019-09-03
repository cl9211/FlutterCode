import 'package:flutter/material.dart';

class StatefulGroupPage extends StatefulWidget {
  @override
  _StatefulGroupPageState createState() => _StatefulGroupPageState();
}

class _StatefulGroupPageState extends State<StatefulGroupPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "StatefulWidget使用",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Scaffold(
          body: _currentIndex == 0
              ? RefreshIndicator(
                  onRefresh: _handleRefresh,
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
                                  icon: Icon(Icons.info),
                                  contentPadding:
                                      EdgeInsets.fromLTRB(5, 0, 0, 0),
                                  hintStyle: TextStyle(color: Colors.amber),
                                  hintText: "请输入"),
                            ),
                            Container(
                                margin: EdgeInsets.all(20),
                                height: 100,
                                child: PageView(
                                  children: <Widget>[
                                    _item("page1", Colors.red),
                                    _item("page2", Colors.green),
                                    _item("page3", Colors.blue),
                                  ],
                                ))
                          ],
                        ),
                      )
                    ],
                  ),
                )
              : Text("列表"),
          appBar: AppBar(
            title: Text("StatefulWidget使用"),
            leading: GestureDetector(
              onTap: () {
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
                    title: Text('首页')),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.list,
                      color: Colors.grey,
                    ),
                    activeIcon: Icon(
                      Icons.list,
                      color: Colors.blue,
                    ),
                    title: Text('列表'))
              ]),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.black,
            foregroundColor: Colors.deepPurple,
            child: Text("点我"),
          ),
        ),
      ),
    );
  }

  Future<Null> _handleRefresh() async {
    await Future.delayed(Duration(milliseconds: 200));
    return null;
  }

  _item(String pageName, Color color) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(color: color),
      child: Text(
        pageName,
        style: TextStyle(fontSize: 30),
      ),
    );
  }
}
