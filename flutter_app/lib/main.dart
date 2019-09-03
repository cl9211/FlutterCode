import 'package:flutter/material.dart';
import 'package:flutter_app/flutter_layout_page.dart';
import 'package:flutter_app/plugin_use.dart';
import 'package:flutter_app/stateful_group_page.dart';

import 'less_group_page.dart';

void main() => runApp(DynamicTheme());

class DynamicTheme extends StatefulWidget {
  DynamicTheme({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _DynamicThemeState createState() => _DynamicThemeState();
}

class _DynamicThemeState extends State<DynamicTheme> {
  Brightness _brightness = Brightness.light;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter App",
      theme: ThemeData(brightness: _brightness, primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: Text("如何使用并创建Flutter路由与导航"),
        ),
        body: Column(
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                setState(() {
                  if (_brightness == Brightness.light) {
                    _brightness = Brightness.dark;
                  } else {
                    _brightness = Brightness.light;
                  }
                });
              },
              child: Text("切换主题abc"),
            ),
            RouteNavigator()
          ],
        ),
      ),
      routes: <String, WidgetBuilder>{
        "plugin": (BuildContext context) => PluginUse(),
        "stateless": (BuildContext context) => LessGroupPage(),
        "stateful": (BuildContext context) => StatefulGroupPage(),
        "flutter_layout": (BuildContext context) => FlutterLayoutPage()
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
            title: Text("${byName ? "" : "不"}通过路由跳转"),
            value: byName,
            onChanged: (value) {
              setState(() {
                byName = value;
              });
            },
          ),
          _item("如何使用Flutter包和插件", PluginUse(), "plugin"),
          _item("StatelessWidget与基础组件", LessGroupPage(), "stateless"),
          _item("StatefulWidget使用", StatefulGroupPage(), "stateful"),
          _item("如何进行Flutter布局开发", FlutterLayoutPage(), "flutter_layout"),
        ],
      ),
    );
  }

  _item(String title, page, String routeName) {
    return Container(
      child: RaisedButton(
        onPressed: () {
          if (byName) {
            Navigator.pushNamed(context, routeName);
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
