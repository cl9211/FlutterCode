import 'package:flutter/material.dart';

class FontsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Custom Fonts',
      theme: ThemeData(fontFamily: 'NotoSansTC'),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Custom Fonts'),
        ),
        body: Center(
          child: Text(
            'Mansalva-Regular',
            style: TextStyle(fontFamily: 'Mansalva-Regular'),
          ),
        ),
      ),
    );
  }
}
