import 'package:flutter/material.dart';
import 'package:flutter_demo/across_screens.dart';
import 'package:flutter_demo/fonts_demo.dart';
import 'package:flutter_demo/home_page.dart';
import 'package:flutter_demo/navigation_basics.dart';
import 'package:flutter_demo/tab_demo.dart';
import 'package:flutter_demo/theme.dart';

import 'dismissing_items.dart';
import 'fade_in_images.dart';
import 'fetch_data_example.dart';
import 'floating_app_bar.dart';
import 'focus_demo.dart';
import 'form_demo.dart';
import 'inkwell_demo.dart';
import 'input_demo.dart';
import 'list_demo.dart';
import 'multiple_type_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter layout demo',
      home: Scaffold(appBar: AppBar(), body: RouteNavigator()),
    );
  }
}

class RouteNavigator extends StatefulWidget {
  @override
  _RouteNavigatorState createState() => _RouteNavigatorState();
}

class _RouteNavigatorState extends State<RouteNavigator> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[
          _item('HomePage', MyHomePage(), 'homePage'),
          _item('FontPage', FontsPage(), 'fontPage'),
          _item('TabsPage', TabsPage(), 'tabsPage'),
          _item('ThemePage', ThemePage(), 'themePage'),
          _item('FormPage', FormPage(), 'formPage'),
          _item('FocusApp', FocusApp(), 'focusApp'),
          _item('InputApp', InputApp(), 'inputApp'),
          _item('InkwellDemo', InkwellDemo(), 'inkwellDemo'),
          _item('DismissingItems', DismissingItems(), 'dismissingItems'),
          _item('FadeInImages', FadeInImages(), 'fadeInImages'),
          _item('ListDemo', ListDemo(), 'listDemo'),
          _item(
              'MultipleTypeList',
              MultipleTypeList(
                items: List<ListItem>.generate(
                    1000,
                    (index) => index % 6 == 0
                        ? HeadingItem('Heading $index')
                        : MessageItem('Sender $index', 'Body $index')),
              ),
              'multipleTypeList'),
          _item('FloatingAppBar', FloatingAppBar(), 'floatingAppBar'),
          _item('AcrossScreens', MainScreen(), 'acrossScreens'),
          _item('NaviagtionBasics', FirstRoute(), 'naviagtionBasics'),
          _item(
              'Fetch Data Example',
              FetchData(
                post: fetchPost(),
              ),
              ''),
        ],
      ),
    );
  }

  Widget _item(String title, page, String routeName) {
    return RaisedButton(
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => page));
      },
      child: Text(title),
    );
  }
}
