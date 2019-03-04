import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'test',
      home: TestCupertinoButton(),
    );
  }
}

//按钮组件
class TestCupertinoButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text('CupertinoButton组件示例'),),
      body: Center(
        child: CupertinoButton(
          child: Text(//按钮label
            'CupertinoButton',
          ),
          color: Colors.blue,//按钮颜色
          onPressed: (){},//按下事件回调
        ),
      ),
    );
  }
}



//加载组件
class TestCupertinoActivityIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CupertinoActivityIndicator示例'),
      ),
      body: Center(
        child: CupertinoActivityIndicator(
          radius: 30.0,//值越大加载的图形越大
        ),
      ),
    );
  }
}

