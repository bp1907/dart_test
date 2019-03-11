import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main(){runApp(MyApp());}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'demo',
      home: TestShare(),
    );
  }
}

class TestShare extends StatefulWidget {
  @override
  _TestShareState createState() => _TestShareState();
}

class _TestShareState extends State<TestShare> {
  
  String countString = '';
  String localCount = '';
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('计算器'),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          RaisedButton(
            child: Text('加1'),
            onPressed: _addOne,
          ),
          Text(countString),
          RaisedButton(
            child: Text('值'),
            onPressed: _resultValue,
          ),
          Text(localCount),
        ],
      ),
    );
  }

  _addOne() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      countString = countString + '1';
    });
    int counter = (preferences.getInt('counter') ?? 0) + 1;
    await preferences.setInt('counter', counter);
  }

  _resultValue() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      localCount = preferences.getInt('counter').toString();
    });
  }
}

