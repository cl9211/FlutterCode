import 'package:flutter/material.dart';

class Page1 extends StatelessWidget {
  final String text;

  const Page1({Key key, @required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("提示"),
      ),
      body: Padding(
        padding: EdgeInsets.all(18.0),
        child: Column(
          children: <Widget>[
            Text(text),
            RaisedButton(
              onPressed: () {
                Navigator.pop(context, "我是返回值");
              },
              child: Text("返回"),
            )
          ],
        ),
      ),
    );
  }
}
