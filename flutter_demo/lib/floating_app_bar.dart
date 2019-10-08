import 'package:flutter/material.dart';

class FloatingAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              title: Text('Floating App Bar'),
              floating: true,
              flexibleSpace: Placeholder(),
              expandedHeight: 200,
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) => ListTile(
                        title: Text('Item $index'),
                      ),
                  childCount: 1000),
            ),
          ],
        ),
      ),
    );
  }
}
