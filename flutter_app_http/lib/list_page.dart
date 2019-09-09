import 'package:flutter/material.dart';

void main() => runApp(RefreshAndUploadList());

const CITY_NAMES = ['北京', '上海', '深圳', '苏州', '杭州', '北京', '上海', '深圳', '苏州', '杭州'];
List<String> cityNames = [
  '北京',
  '上海',
  '深圳',
  '苏州',
  '杭州',
  '北京',
  '上海',
  '深圳',
  '苏州',
  '杭州'
];

class ListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text("Basic List"),
          ),
          body: Container(
            height: 80,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: _buildList(),
            ),
          )),
    );
  }

  List<Widget> _buildList() {
    return CITY_NAMES.map((city) => _item(city)).toList();
  }

  Widget _item(String city) {
    return Container(
      width: 160,
      margin: EdgeInsets.only(right: 5),
      alignment: Alignment.center,
      decoration: BoxDecoration(color: Colors.teal),
      child: Text(
        city,
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
    );
  }
}

const CITY_NAMES2 = {
  '北京': ['东城区', '西城区', '朝阳区'],
  'shanghai': ['东城区', '西城区', '朝阳区'],
  'guangzhou': ['东城区', '西城区', '朝阳区'],
  'suzhou': ['东城区', '西城区', '朝阳区'],
};

class ExpansionList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          child: ListView(children: _buildList()),
        ),
      ),
    );
  }

  List<Widget> _buildList() {
    List<Widget> widgets = [];
    CITY_NAMES2.keys.forEach((key) {
      widgets.add(_item(key, CITY_NAMES2[key]));
    });
    return widgets;
  }

  Widget _item(String city, List<String> subCities) {
    return ExpansionTile(
      title: Text(
        city,
        style: TextStyle(color: Colors.black54, fontSize: 20),
      ),
      children: subCities.map((subCity) => _buildSub(subCity)).toList(),
    );
  }

  Widget _buildSub(String subCity) {
    return FractionallySizedBox(
      widthFactor: 1,
      child: Container(
        height: 50,
        margin: EdgeInsets.only(bottom: 5),
        decoration: BoxDecoration(color: Colors.lightBlueAccent),
        child: Text(subCity),
      ),
    );
  }
}

class GridList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: GridView.count(
          crossAxisCount: 2,
          children: _buildList(),
        ),
      ),
    );
  }

  List<Widget> _buildList() {
    return CITY_NAMES.map((city) => _item(city)).toList();
  }

  Widget _item(String city) {
    return Container(
      height: 80,
      margin: EdgeInsets.only(bottom: 5, right: 5),
      alignment: Alignment.center,
      decoration: BoxDecoration(color: Colors.teal),
      child: Text(
        city,
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
    );
  }
}

class RefreshAndUploadList extends StatefulWidget {
  @override
  _RefreshAndUploadListState createState() => _RefreshAndUploadListState();
}

class _RefreshAndUploadListState extends State<RefreshAndUploadList> {
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _loadData();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: RefreshIndicator(
          onRefresh: _handleRefresh,
          child: ListView(
            controller: _scrollController,
            children: _buildList(),
          ),
        ),
      ),
    );
  }

  Future<Null> _handleRefresh() async {
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      cityNames = cityNames.reversed.toList();
    });
  }

  List<Widget> _buildList() {
    return cityNames.map((city) => _item(city)).toList();
  }

  Widget _item(String city) {
    return Container(
      height: 80,
      margin: EdgeInsets.only(bottom: 5),
      alignment: Alignment.center,
      decoration: BoxDecoration(color: Colors.teal),
      child: Text(
        city,
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  _loadData() async {
    await Future.delayed(Duration(milliseconds: 200));
    setState(() {
      List<String> list = List<String>.from(cityNames);
      list.addAll(cityNames);
      cityNames = list;
    });
  }
}