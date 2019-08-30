import 'package:flutter/material.dart';
import 'package:flutter_app1/flutter_layout_page.dart';
import 'package:flutter_app1/flutter_plugin.dart';
import 'package:flutter_app1/flutter_widget_lifecycle.dart';
import 'package:flutter_app1/gesture_page.dart';
import 'package:flutter_app1/less_group_page.dart';
import 'package:flutter_app1/res_page.dart';
import 'package:flutter_app1/statefull_group_page.dart';

import 'launch_page.dart';

void main() => runApp(WidgetLifecycle());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: RouteNavigator(),
        appBar: AppBar(
          title: Text("如何创建和使用Flutter的路由导航"),
        ),
      ),
      routes: <String, WidgetBuilder>{
        "less": (BuildContext context) => LessGroupPage(),
        "ful": (BuildContext context) => StatefulGroupPage(),
        "layout": (BuildContext context) => FlutterLayoutPage(),
        "plugin": (BuildContext context) => FlutterPlugin(),
        "gesture": (BuildContext context) => GesturePage()
      },
    );
  }
}

class RouteNavigator extends StatefulWidget {
  @override
  _RouteNavigatorState createState() => _RouteNavigatorState();
}

class _RouteNavigatorState extends State<RouteNavigator> {
  bool byName = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          SwitchListTile(
              title: Text("${byName ? "" : "不"}通过路由名跳转"),
              value: byName,
              onChanged: (value) {
                byName = value;
              }),
          _item("StatelessWidget与基础组件", LessGroupPage(), "less"),
          _item("StatefulWidget与基础组件", StatefulGroupPage(), "ful"),
          _item("如何使用Flutter进行布局开发", FlutterLayoutPage(), "layout"),
          _item("如何使用Flutter包和插件", FlutterPlugin(), "plugin"),
          _item("如何检测用户手势以及处理点击事件", GesturePage(), "gesture"),
        ],
      ),
    );
  }

  _item(String title, page, String routerName) {
    return Container(
      child: RaisedButton(
        onPressed: () {
          if (byName) {
            Navigator.pushNamed(context, routerName);
          } else {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => page));
          }
        },
        child: Text(title),
      ),
    );
  }
}
