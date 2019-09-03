import 'package:flutter/material.dart';

class GesturePage extends StatefulWidget {
  @override
  _GesturePageState createState() => _GesturePageState();
}

class _GesturePageState extends State<GesturePage> {
  String printString = "";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "如何检测用户手势以及处理点击事件",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: Text("如何检测用户手势以及处理点击事件"),
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back),
          ),
        ),
        body: FractionallySizedBox(
          widthFactor: 1,
          child: Stack(
            children: <Widget>[
              GestureDetector(
                onTap: () => "",
              )
            ],
          ),
        ),
      ),
    );
  }
}
