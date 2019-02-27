import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    final appName = '自定义主题';
    return MaterialApp(
      title: appName,
      theme: ThemeData(
        brightness: Brightness.light,//应用程序整体主题的亮度
        primaryColor: Colors.lightGreen[800],//App主要部分的背景色
        accentColor: Colors.orange,//前景色(文本、按钮等)
      ),
      home: MyHomePage(
        title: appName,
      ),
    );
  }
}

class MyHomePage extends StatelessWidget{
  final String title;

  MyHomePage({Key key,@required this.title}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Container(
          //获取主题的accentColor
          color: Theme.of(context).accentColor,
          child: Text(
            '带有背景色的文本组件',
            style: Theme.of(context).textTheme.title,
          ),
        ),
      ),
      floatingActionButton: Theme(
        //使用copyWith的方式获取accentColor
          data: Theme.of(context).copyWith(accentColor: Colors.grey),
          child: FloatingActionButton(
            onPressed: (){},
            child: Icon(Icons.computer),
          ),
      ),
    );
  }
}

