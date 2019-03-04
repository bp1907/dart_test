import 'package:flutter/material.dart';
import 'dart:ui';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'demo',
      home:TestCanvas(),
    );
  }
}
//透明度处理
class TestOpacity extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('透明度处理'),
      ),
      body: Center(
        child: Opacity(
          opacity: 0.3,
          child: Container(
            width: 250,
            height: 100.0,
            decoration: BoxDecoration(
              color: Colors.black, //背景色设置为纯黑
            ),
            child: Text(
              '透明度为0.3',
              style: TextStyle(
                color: Colors.white,
                fontSize: 28.0,
              ),
            ),
          ),
        ),

      ),
    );
  }
}

//装饰盒子
//背景图效果+边框圆角处理
class TestBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('装饰盒子之背景图示例'),
      ),
      body: Center(
        child: Container(
          width: 300.0,
          height: 300.0,
          decoration: BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
              image: AssetImage('images/logo.png'),
              fit: BoxFit.cover,
            ),
            border: Border.all(color: Colors.grey, width: 4.0),
            borderRadius: BorderRadius.circular(36.0),
          ),
        ),
      ),
    );
  }
}

//边框阴影
class TestShadow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('BoxDecoration装饰盒子-边框阴影示例'),
      ),
      body: Center(
        child: Container(
          width: 300.0,
          height: 300.0,
          decoration: BoxDecoration(
            color: Colors.white,
            //边框阴影效果
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.grey, //阴影颜色
                blurRadius: 8.0,//模糊值
                spreadRadius: 8.0,//扩展阴影半径
                offset: Offset(-1.0, 1.0),//x和y方向的偏移量
              ),
            ],
          ),
          child: Text(
            'BoxShadow阴影效果',
            style: TextStyle(
              color: Colors.black,
              fontSize: 28.0,
            ),
          ),
        ),
      ),
    );
  }
}

//渐变处理  分为环形渐变和线性渐变，本例为线性渐变
class TestGradient extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('LinearGradient线性渐变效果'),
      ),
      body: Center(
        child: DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: <Color>[
                Colors.red,
                Colors.green,
                Colors.blue,
                Colors.grey,
              ],
              begin: const FractionalOffset(0.5, 0.0),//起始偏移量
              end: const FractionalOffset(1.0, 1.0),//终止偏移量
            )
          ),
          child: Container(
            width: 280.0,
            height: 280.0,
            child: new Center(
              child: Text(
                'LinearGradient线性渐变效果',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 28.0,
                ),
              ),
          ),
        )
        ),
      ),
    );
  }
}

//旋转盒子
class TestRotatedBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RotatedBox旋转盒子示例',),
      ),
      body: Center(
        child: RotatedBox(
          quarterTurns: 3,//旋转次数，一次为90度
          child: Text(
            'RotatedBox旋转盒子',
            style: TextStyle(fontSize: 28.0),
          ),
        ),
      ),
    );
  }
}

//裁剪处理clip
//绘制直线
class TestCanvas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CustomPaint绘制直线示例',),
      ),
      body: Center(
        child: Container(
          width: 500.0,
          height: 500.0,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black,width: 3.0)
          ),
          child: CustomPaint(
            painter: LinePainter(),
            child: Center(
              child: Text(
                '绘制',
                style: const TextStyle(
                  fontSize: 38.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

//继承自CustomPainter并且实现CustomPainter里面的paint和shouldRepaint方法
class LinePainter extends CustomPainter{

  //定义画笔
  Paint _paint = Paint()
    ..color = Colors.black
    ..strokeCap = StrokeCap.square//方形点
    ..isAntiAlias = true
    ..strokeWidth = 5.0//画笔粗细
    ..style = PaintingStyle.stroke;//stroke没有填充色fill有填充色,绘制点时此值无效

  @override
  void paint(Canvas canvas, Size size) {
    //绘制直线
    canvas.drawLine(Offset(50.0, 10.0), Offset(300.0, 10.0), _paint);
    canvas.drawCircle(Offset(175.0, 100.0), 50, _paint);
    Rect rect = Rect.fromPoints(Offset(50, 200), Offset(300, 400));
    canvas.drawOval(rect, _paint);
    //中心点坐标为200,200 边长为100
    Rect rect2 = Rect.fromCircle(center: Offset(175.0, 300.0), radius: 125.0);
    //根据矩形创建一个角度为20的圆角矩形
    RRect rrect = RRect.fromRectAndRadius(rect2, Radius.circular(20.0));
    //开始绘制圆角矩形
    canvas.drawRRect(rrect, _paint);
    //绘制嵌套矩形
    //绘制多个点
    canvas.drawPoints(
        PointMode.polygon,//点，隔点连线，邻点连线
        [
          Offset(50.0, 60.0),
          Offset(40.0, 90.0),
          Offset(100.0, 100.0),
          Offset(300.0, 350.0),
          Offset(400.0, 80.0),
          Offset(200.0, 200.0)
        ],
        _paint
    );
    //绘制圆弧
    //绘制路径Path 此方法可以画任意图形
  }

  //重写是否需要重绘
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}