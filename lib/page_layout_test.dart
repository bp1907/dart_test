import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    Widget container = Container(
      decoration: BoxDecoration(
        color: Colors.grey,
      ),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              //使用Expanded防止内容溢出
              Expanded(
                child: Container(
                  width: 150.0,
                  height: 150.0,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blueGrey,width: 5.0),
                    borderRadius: BorderRadius.all(const Radius.circular(8.0)),
                  ),
                  margin: EdgeInsets.all(4.0),
                  child: Image.asset('images/lake.jpg'),
                ),
              ),
              Expanded(
                child: new Container(
                  width: 150.0,
                  height: 150.0,
                  decoration: new BoxDecoration(
                    border: new Border.all(width: 10.0, color: Colors.blueGrey),
                    borderRadius:
                    const BorderRadius.all(const Radius.circular(8.0)),
                  ),
                  margin: const EdgeInsets.all(4.0),
                  child: new Image.asset('images/icon.png'),
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  width: 150.0,
                  height: 150.0,
                  decoration: new BoxDecoration(
                    border: new Border.all(width: 10.0, color: Colors.blueGrey),
                    borderRadius:
                    const BorderRadius.all(const Radius.circular(8.0)),
                  ),
                  margin: const EdgeInsets.all(4.0),
                  child: new Image.asset('images/logo.png'),
                ),
              ),
              Expanded(
                child: new Container(
                  width: 150.0,
                  height: 150.0,
                  decoration: new BoxDecoration(
                    border: new Border.all(width: 10.0, color: Colors.blueGrey),
                    borderRadius:
                    const BorderRadius.all(const Radius.circular(8.0)),
                  ),
                  margin: const EdgeInsets.all (4.0),
                  child: new Image.asset ('images/icon.png'),
                ),
              ),
            ],
          ),
        ],
      ),
    );

    return MaterialApp(
      title: 'test',
      home: Scaffold(
        appBar: new AppBar(
          title: new Text('Container布局容器示例'),
        ),
        body: TestTransform()/*Center(
          child: container,
        )*/,
      ),
    );
  }
}

//Container
//Center
//Padding
//Align  alignment: FractionalOffset(1.0,0.0),
//Row
//Column
//FittedBox缩放布局
class TestFittedBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      width: 250.0,
      height: 250.0,
      child: FittedBox(
        fit: BoxFit.contain,
        alignment: Alignment.topLeft,
        child: Container(
          color: Colors.deepOrange,
          child: Text('缩放布局'),
        ),
      ),
    );
  }
}

//Stack/Alignment
//Stack/Positioned定位组件
//IndexedStack

//OverflowBox
class TestOverflowBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      width: 200.0,
      height: 200.0,
      padding: const EdgeInsets.all(5.0),
      child: OverflowBox(
        alignment: Alignment.topLeft,
        maxWidth: 300.0,
        maxHeight: 500.0,
        child: Container(
          color: Colors.blueGrey,
          width: 400.0,
          height: 400.0,
        ),
      ),
    );
  }
}

//SizedBox设置具体尺寸
//ConstrainedBox限制最大最小宽高布局
class TestConstrainedBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        minWidth: 200.0,
        minHeight: 200.0,
        maxWidth: 280.0,
        maxHeight: 280.0,
      ), child: new Container(
      width: 50.0,
      height: 50.0,
      color: Colors.green,
    ),
    );
  }
}

//LimitedBox限制最大宽高布局
//AspectRatio调整宽高比
class TestAspectRatio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      width: 200.0,
      height: 200.0,
      child: AspectRatio(
        aspectRatio: 1.5,
        child: Container(
          color: Colors.green,
          height: 1000.0,
        ),
      ),
    );
  }
}

//FractionallySizedBox百分比布局

//ListView
//GridView
//Table
class TestTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Table(
        //设置表格有多少列,并且指定列宽
        columnWidths: const <int, TableColumnWidth>{
          0: FixedColumnWidth(100.0),
          1: FixedColumnWidth(40.0),
          2: FixedColumnWidth(80.0),
          3: FixedColumnWidth(80.0),
        },
        //设置表格边框样式
        border: TableBorder.all(color: Colors.black38, width: 2.0, style: BorderStyle.solid),
        children: const <TableRow>[
          TableRow(
            children: <Widget>[
              Text('姓名'),
              Text('性别'),
              Text('年龄'),
              Text('身高'),
            ],
          ),
          //添加第二行数据
          TableRow(
            children: <Widget>[
              Text('张三'),
              Text('男'),
              Text('26'),
              Text('172'),
            ],
          ),
          //添加第三行数据
          TableRow(
            children: <Widget>[
              Text('李四'),
              Text('男'),
              Text('28'),
              Text('178'),
            ],
          ),
        ],
      ),
    );
  }
}

//Transform矩阵转换
class TestTransform extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.grey,
        child: Transform(
          transform: Matrix4.rotationZ(0.5),
          child: Container(
            padding: const EdgeInsets.all(8.0),
            color: const Color(0xFFE8581C),
            child: const Text('Transform矩阵转换'),
          ),
        ),
      ),
    );
  }
}

//Baseline基准线布局
//Offstage控制是否显示组件 offstage bool控制显示隐藏
//Wrap按宽高自动换行布局