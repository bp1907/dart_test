import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '使用第三方包',
      home: Scaffold(
        appBar: AppBar(
          title: Text('使用第三方包'),
        ),
        body: Center(
          child: RaisedButton(
            onPressed: (){
                //指定url并发起请求
                const url = 'https://www.baidu.com';
                launch(url);
              },
            child: Text('百度一下'),
          ),
        ),
      ),
    );
  }
}
