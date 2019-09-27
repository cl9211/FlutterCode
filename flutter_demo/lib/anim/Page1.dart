import 'package:flutter/material.dart';

main() {
  runApp(MaterialApp(
    home: Page1(),
  ));
}

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.push(context, _createRoute());
          },
          child: Text('Go!'),
        ),
      ),
    );
  }

  Route _createRoute() {
    return PageRouteBuilder(
        pageBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> secondaryAnimation) =>
            Page2(),
        transitionsBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation, Widget child) {
          var begin = Offset(0.0, 1.0);
          var end = Offset.zero;

          // 创建动画 方法一
          var curve = Curves.easeOut;
          var curveTween = CurveTween(curve: curve);

          var tween = Tween(begin: begin, end: end).chain(curveTween);
          var offsetAnimation = animation.drive(tween);

          return SlideTransition(
            position: offsetAnimation,
            child: child,
          );

          // 创建动画 方法二
          var tween2 = Tween(begin: begin, end: end);
          var curvedAnimation =
              CurvedAnimation(parent: animation, curve: curve);
          return SlideTransition(
            position: tween2.animate(curvedAnimation),
            child: child,
          );
        });
  }
}

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text('Page 2'),
      ),
    );
  }
}
