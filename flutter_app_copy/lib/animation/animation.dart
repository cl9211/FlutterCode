import 'package:flutter/material.dart';

void main() => runApp(LogoApp());

class LogoApp extends StatefulWidget {
  @override
  _LogoAppState createState() => _LogoAppState();
}

class _LogoAppState extends State<LogoApp> with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;
  AnimationStatus animationStatus;
  double animationValue;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    animation = Tween<double>(begin: 0, end: 300).animate(controller)
      ..addListener(() {
        setState(() {
//          animationValue = animation.value;
        });
      })
      ..addStatusListener((AnimationStatus status) {
        setState(() {
          if (status == AnimationStatus.completed) {
            controller.reverse();
          } else if (status == AnimationStatus.dismissed) {
            controller.forward();
          }
        });
      })
      ..addStatusListener((AnimationStatus status) {
        print('$status');
      });

    controller.forward();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primarySwatch: Colors.blue),
        home: Scaffold(
          appBar: AppBar(
            title: Text("Animation"),
          ),
          body: Container(
            margin: EdgeInsets.only(top: 10),
            child: Column(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    controller.reset();
                    controller.forward();
                  },
                  child: RaisedButton(
                    child: Text('Start', style: TextStyle(fontSize: 15)),
                  ),
                ),
                Text('State:' + animationStatus.toString(),
                    style: TextStyle(fontSize: 15)),
                Text('Value:' + animationValue.toString(),
                    style: TextStyle(fontSize: 15)),
                Container(
                  height: animation.value,
                  width: animation.value,
                  child: FlutterLogo(),
                ),
              ],
            ),
          ),
        ));
  }
}
