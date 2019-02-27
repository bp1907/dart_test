import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: '常用组件',
      //使用generate方法产生500条数据
      home: TestGridViewWidget(),
//      TestMultiListViewWidget(items: List<String>.generate(500, (i) => 'Item $i'),),
    );
  }
}

//表单列表
//to login.dart

//网格列表组件
class TestGridViewWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    final title = "网格列表";

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      //使用GridView.count构建网格
      body: GridView.count(
        primary: false,
        //四周增加一定的空隙
        padding: const EdgeInsets.all(20.0),
        crossAxisSpacing: 30.0,
        crossAxisCount: 3,//一行上放三列数据
        //数据项
        children: <Widget>[
          const Text('第一行第一列'),
          const Text('第一行第二列'),
          const Text('第一行第三列'),
          const Text('第二行第一列'),
          const Text('第二行第二列'),
          const Text('第二行第三列'),
          const Text('第三行第一列'),
          const Text('第三行第二列'),
          const Text('第三行第三列'),
          const Text('第一行第一列'),
          const Text('第一行第二列'),
          const Text('第一行第三列'),
          const Text('第二行第一列'),
          const Text('第二行第二列'),
        ],
      ),
    );
  }
}

//长列表组件
/*class TestMultiListViewWidget extends StatelessWidget{
  final List<String> items;
  TestMultiListViewWidget({Key key,@required this.items}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    final title = "长列表";

    return Scaffold(
      appBar: new AppBar(
        title: new Text(title),
      ),
      //使用ListView.builder来构造列表项
      body: ListView.builder(
        itemBuilder: (context,index){
          return ListTile(
            leading: Icon(Icons.phone),
            title: Text('${items[index]}'),
            onTap: () => debugPrint('$index'),
          );
        },
        itemCount: items.length,//列表长度
      ),
    );
  }
}*/


//水平列表组件
/*class TestHListViewWidget extends StatelessWidget{

  final title = '水平列表组件';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 20.0),
        height: 200.0,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            Container(
              width: 160.0,
              color: Colors.lightBlue,
            ),
            Container(
              width: 160.0,
              color: Colors.amber,
            ),
            Container(
              width: 160.0,
              color: Colors.green,
              child: Column(
                children: <Widget>[
                  Text(
                    '水平',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 36.0,
                    ),
                  ),
                  Text(
                    '列表',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 36.0,
                    ),
                  ),
                  Icon(Icons.list),
                ],
              ),
            ),
            Container(
              width: 160.0,
              color: Colors.deepPurpleAccent,
            ),
            Container(
              width: 160.0,
              color: Colors.black,
            ),
            Container(
              width: 160.0,
              color: Colors.pinkAccent,
            ),
          ],
        ),
      ),
    );
  }
}*/

//基础列表组件ListView
/*class TestListViewWidget extends StatelessWidget{

  final title = '基础列表组件';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView(
        //添加静态数据
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.alarm),//添加图标
            title: Text('Alarm'),//添加文本
          ),
          ListTile(
            leading: Icon(Icons.phone),
            title: Text('Phone'),
          ),
          ListTile(
            leading: Icon(Icons.airplay),
            title: Text('Airplay'),),
          ListTile(
            leading: Icon(Icons.airplay),
            title: Text('Airplay'),
          ),
          ListTile(
            leading: Icon(Icons.airplay),
            title: Text('Airplay'),
          ),
          ListTile(
            leading: Icon(Icons.airplay),
            title: Text('Airplay'),
          ),
          ListTile(
            leading: Icon(Icons.alarm),
            title: Text('Alarm'),
          ),
          ListTile(
            leading: Icon(Icons.alarm),
            title: Text('Alarm'),
          ),
          ListTile(
            leading: Icon(Icons.alarm),
            title: Text('Alarm'),
          ),
          ListTile(
            leading: Icon(Icons.alarm),
            title: Text('Alarm'),
          ),
          ListTile(
            leading: Icon(Icons.alarm),
            title: Text('Alarm'),
          ),
        ],
      ),
    );
  }
}*/

//凸起按钮组件
class TestRaisedButton extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: new AppBar(
        title: new Text('RaisedButton组件示例'),
      ),
      body: Center(
        child: RaisedButton(
          onPressed:(){},
          child: Text('RaisedButton'),
        ),
      ),
    );
  }
}

//图标按钮组件
/*class TestIconButtonWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: new AppBar(
        title: new Text('图标按钮组件'),
      ),
      body: Center(
        child: IconButton(
          icon: Icon(
            Icons.volume_up,
            size: 96.0,
          ),
          iconSize: 96.0,
          tooltip: '按下操作',
          onPressed: () => debugPrint('按下操作'),
        ),
      ),
    );
  }
}*/

//图标组件
/*class TestIconWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('图标组件'),
      ),
      body: Icon(
        Icons.phone,
        color: Colors.green[500],
        size: 40.0,
      ),
    );
  }
}*/

//文本组件
/*class TestTextWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('文本组件'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
//        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            '红色+黑色删除线+25号',
            style: TextStyle(
              color: const Color(0xffff0000),
              decoration: TextDecoration.lineThrough,
              decorationColor: const Color(0xff000000),
              fontSize: 25.0,
            ),
//            textAlign: TextAlign.center,
          ),
          Text(
            '橙色+下划线+24号',
            style: TextStyle(
              color: const Color(0xffff9900),
              decoration: TextDecoration.underline,
              fontSize: 24.0,
            ),
          ),
          Text(
            '虚线上划线+23号+倾斜',
            style: TextStyle(
              decoration: TextDecoration.overline,
              decorationStyle: TextDecorationStyle.dashed,
              fontSize: 23.0,
              fontStyle: FontStyle.italic,
            ),
          ),
          Text(
            '24号+加粗',
            style: TextStyle(
              fontSize: 24,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
              letterSpacing: 10.0,
            ),
          ),
        ],
      ),
    );
  }
}*/

//图片组件
/*class TestImageWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      //添加网络图片
      child: Image.network(
        'http://p5.so.qhimgs1.com/bdr/326__/t013355d0e85239266b.jpg',
        //填充模式
        fit: BoxFit.contain,
        width: 300.0,
        height: 300.0,
      ),
    );
  }
}*/

//container容器组件
/*class TestContainerWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('常用组件'),
      ),
      body: Center(
        child: Container(
          width: 200.0,
          height: 200.0,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colors.grey, //边框颜色
              width: 8.0,//边框粗细
            ),
            borderRadius: const BorderRadius.all(const Radius.circular(20.0)),
          ),
          child: Text(
            'flutter',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 28.0,
              color: Colors.orange,
            ),
          ),
        ),
      ),
    );
  }
}*/