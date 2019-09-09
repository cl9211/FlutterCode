import 'dart:convert';
import 'dart:core';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String showResult = '';
  String countString = '';
  String localCount = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text("Http"),
      ),
      body: Column(
        children: <Widget>[
          RaisedButton(
            onPressed: _incrementCounter,
            child: Text("Increment Count"),
          ),
          RaisedButton(
            onPressed: _getCounter,
            child: Text("Get Count"),
          ),
          Text(
            countString,
            style: TextStyle(fontSize: 20),
          ),
          Text(
            localCount,
            style: TextStyle(fontSize: 20),
          )
        ],
      ),
    ));
  }

  _incrementCounter() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      countString = countString + " 1";
    });

    int counter = (preferences.get('counter') ?? 0) + 1;
    await preferences.setInt('counter', counter);
  }

  _getCounter() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      localCount = preferences.getInt('counter').toString();
    });
  }
}

class CommonModel {
  final String icon;
  final String title;
  final String url;
  final String statusBarColor;
  final bool hideAppBar;

  CommonModel(
      {this.icon, this.title, this.url, this.statusBarColor, this.hideAppBar});

  factory CommonModel.fromJson(Map<String, dynamic> json) {
    return CommonModel(
      icon: json["icon"],
      title: json["title"],
      url: json["url"],
      statusBarColor: json["statusBarColor"],
      hideAppBar: json["hideAppBar"],
    );
  }
}

class TravelTabModel {
  String url;
  List<TravelTab> tabs;

  TravelTabModel({this.url, this.tabs});

  TravelTabModel.fromJson(Map<String, dynamic> json) {
    url = json["url"];

    (json["tabs"] as List).map((i) => TravelTab.fromJson(i));
  }
}

class TravelTab {
  String labelName;
  String groupChannelCode;

  TravelTab({this.labelName, this.groupChannelCode});

  TravelTab.fromJson(Map<String, dynamic> json) {
    labelName = json["labelName"];
    groupChannelCode = json["groupChannelCode"];
  }
}
