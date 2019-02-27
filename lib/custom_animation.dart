import 'package:flutter/material.dart';
import 'dart:math' as math;

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'custom animation',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Custom Animation'),
        ),
        body: AnimationDemoView(),
      ),
    );
  }
}

class AnimationDemoView extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return AnimationDemoState();
  }
}

class AnimationDemoState extends State<AnimationDemoView> with SingleTickerProviderStateMixin{

  static const padding = 16.0;
  
  AnimationController controller;
  Animation<double> left;
  Animation<Color> color;
  Animation<Size> size;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future(_initState);
  }

  void _initState(){
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 2000)
    );

    final mediaQueryData = MediaQuery.of(context);
    final displayWidth = mediaQueryData.size.width;
    print('width = $displayWidth');

    left = Tween(begin: padding,end: displayWidth - padding).animate(controller)
    ..addListener((){
      // 调用 setState 触发他重新 build 一个 Widget。在 build 方法里，我们根据
      // Animatable<T> 的当前值来创建 Widget，达到动画的效果（类似 Android 的属性动画）。
      setState(() {

      });
    })
    ..addStatusListener((status){
      //这里控制动画重复执行
      //一次动画完成
      if(status == AnimationStatus.completed){
        //动画反执行一遍
        controller.reverse();
      }else if(status == AnimationStatus.dismissed){
        //动画正着执行
        controller.forward();
      }
    });

    color = ColorTween(begin: Colors.red,end: Colors.blue).animate(controller);
    size = SizeTween(begin: Size(15.0, 15.0),end: Size(45.0, 45.0)).animate(controller);
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    final unit = 20.0;
    final marginLeft = left == null ? padding : left.value;

    final unitizedLeft = (marginLeft - padding) / unit;
    final unitizedTop = math.sin(unitizedLeft);

    final marginTop = (unitizedTop + 1) * unit + padding;

    final color = this.color == null ? Colors.red : this.color.value;

    final size = this.size == null ? 15.0 : this.size.value;

    return Container(
      //根据动画进度设置圆点位置
      margin: EdgeInsets.only(left: marginLeft,top: marginTop),
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15),
        ),
        width: size,
        height: size,
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }
}