import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sprintf/sprintf.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _startTime = new DateTime.now().millisecondsSinceEpoch;
  int _numMilliseconds = 0;
  int _numSeconds = 0;
  int _numMinutes = 0;

  @override
  void initState() {
    super.initState();
    Timer.periodic(new Duration(milliseconds: 10), (Timer timer) {
      int timeDifference = new DateTime.now().millisecondsSinceEpoch - _startTime;
      double seconds = timeDifference / 1000;
      double minutes = seconds / 60;
      double leftoverSeconds = seconds % 60;
      double leftoverMillis = timeDifference % 1000 / 10;
      setState(() {
        _numMilliseconds = leftoverMillis.floor();
        _numSeconds = leftoverSeconds.floor();
        _numMinutes = minutes.floor();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new Center(
          child: new Text(
            sprintf("%02d:%02d:%2d", [_numMinutes, _numSeconds, _numMilliseconds]),
          ),
        )
    );
  }
}