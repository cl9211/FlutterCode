import 'package:flutter/material.dart';

class LessGroupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "StatelessWidget与基础组件",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: Text("StatelessWidget与基础组件"),
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back),
          ),
        ),
        body: Container(
          decoration: BoxDecoration(color: Colors.white),
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              Text(
                "I am a text",
                style: TextStyle(fontSize: 20, color: Colors.red),
              ),
              Icon(
                Icons.android,
                color: Colors.green,
                size: 60,
              ),
              CloseButton(),
              BackButton(),

              Chip(
                backgroundColor: Colors.blue,
                avatar: Icon(Icons.people),
                label: Text("StatelessWidget与基组件"),
              ),
              Divider(
                height: 10,
                indent: 20,
                endIndent: 20,
                color: Colors.red,
              ),
              Card(
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "I am a card",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                color: Colors.yellow,
                elevation: 10,
                margin: EdgeInsets.all(10),
              ),
              AlertDialog(
                title: Text("title"),
                content: Text("content"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
