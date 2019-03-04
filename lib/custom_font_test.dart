import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: '自定义字体',
    home: new MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('自定义字体'),
      ),
      body: Center(
        child: Text(
          '你好  flutter',
          style: TextStyle(fontFamily: 'myfont',fontSize: 36.0),
        ),
      ),
    );
  }
}
