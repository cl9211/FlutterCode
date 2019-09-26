import 'package:flutter/material.dart';
import 'package:flutter_demo/anim_flutter/logo_app.dart';
import 'package:flutter_demo/anim_flutter/photo_hero.dart';
import 'package:flutter_demo/context_route.dart';
import 'package:flutter_demo/counter_widget.dart';
import 'package:flutter_demo/echo_route.dart';
import 'package:flutter_demo/new_route.dart';
import 'package:flutter_demo/page1.dart';
import 'package:flutter_demo/parent_widget_c.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
//      initialRoute: "new_page",
      routes: {
        "new_page": (BuildContext context) => EchoRoute(),
        "context_route": (BuildContext context) => ContextRoute()
      },

      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(builder: (context) {
          String routeName = settings.name;
          if (routeName == "") {
            return NewRoute();
          }
          return null;
        });
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var result = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: Column(
        children: <Widget>[
          RaisedButton(
            onPressed: () async {
              result = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return Page1(
                      // 路由参数
                      text: "我是提示xxxx",
                    );
                  },
                ),
              );

              print('路由器返回值：$result');
            },
            child: Text('打开提示页'),
          ),
          Text(
            result,
            style: TextStyle(fontSize: 20, color: Colors.redAccent),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.of(context).pushNamed("new_page", arguments: "hi");
            },
            child: Text("通过名字跳转"),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.pushNamed(context, "context_route");
            },
            child: Text("context 测试"),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CounterWidget(
                            initValue: 10,
                          )));
            },
            child: Text('CounterWidget'),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ParentWidgetC()));
            },
            child: Text('TapboxA'),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => LogoApp()));
            },
            child: Text('Logo'),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HeroAnimation()));
            },
            child: Text('Hero Animation'),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => RadialExpansionDemo()));
            },
            child: Text('Radial Hero Animation'),
          )
        ],
      )),
    );
  }
}
