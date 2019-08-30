import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'flutter_widget_lifecycle.dart';

void main() {
  runApp(FlutterWidgetLifecycleStateless());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Title",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomePage(),
    );
  }
}

class FlutterWidgetLifecycleStateless extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Title",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: WidgetLifecycle(),
    );
  }

}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Launch"),
        leading: GestureDetector(
          child: Icon(Icons.arrow_back),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              onPressed: _launchURL,
              child: Text('打开浏览器'),
            ),
            RaisedButton(
              onPressed: _openMap,
              child: Text("打开地图"),
            )
          ],
        ),
      ),
    );
  }
}

_launchURL() async {
  const url = 'https://flutter.dev';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_openMap() async {
  const url = "geo:52.32,4.917";
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    const url = "";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw "无法打开$url";
    }
  }
}
