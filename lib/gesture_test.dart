import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'demo',
      home: TestDismissible(),
    );
  }
}

//滑动删除
class TestDismissible extends StatelessWidget {
  //构建30条列表数据
  List<String> items = List<String>.generate(30, (i) => '列表项 ${i+1}');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('滑动删除示例'),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context,index){
          //构建列表
          final item = items[index];

          //返回一个可以被删除的列表项
          return Dismissible(
            key: Key(item), 
            child: ListTile(
              title: Text('$item'),
            ),
            //被删除回调
            onDismissed: (direction){
              //移除指定索引项
              items.removeAt(index);
              Scaffold.of(context).showSnackBar(
                SnackBar(content: Text('$item 被删除了')),
              );
            },
          );
        },
      ),
    );
  }
}


class TestButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('按下处理demo'),
      ),
      body: Center(
        child: MyButton(),
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Scaffold.of(context).showSnackBar(SnackBar(content: Text('你已按下')));
      },
      child: Container(
        padding: EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: Theme.of(context).buttonColor,
//          borderRadius: BorderRadius.circular(10.0),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        child: Text('测试按钮'),
      ),
    );
  }
}
