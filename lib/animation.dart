import 'package:flutter/material.dart';

void main(){
  runApp(LogoApp());
}

class LogoApp extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LogoAppState();
  }
}

class LogoAppState extends State<LogoApp> with SingleTickerProviderStateMixin{

  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(vsync: this,duration: const Duration(milliseconds: 2000));
    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);
    animation.addStatusListener((status) {
      if(status == AnimationStatus.completed){
        controller.reverse();
      }else if(status == AnimationStatus.dismissed){
        controller.forward();
      }
    });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AnimatedLogo(animation: animation,);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }
}

class AnimatedLogo extends AnimatedWidget{

  // The Tweens are static because they don't change.
  static final _opacityTween = Tween<double>(begin: 0.1, end: 1.0);
  static final _sizeTween = Tween<double>(begin: 0.0, end: 300.0);

  AnimatedLogo({Key key,Animation<double> animation}): super(key: key,listenable:animation);

  @override
  Widget build(BuildContext context) {

    final Animation<double> animation = listenable;

    // TODO: implement build
    return Center(
      child: Opacity(
        opacity: _opacityTween.evaluate(animation),
        child: Container(
          margin: EdgeInsets.symmetric(vertical:10.0),
          height: _sizeTween.evaluate(animation),
          width: _sizeTween.evaluate(animation),
          child: FlutterLogo(),
        ),),
    );
  }
}

/*void main(){
  runApp(_SampleApp());
}

class _SampleApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Animation',
      home: Scaffold(
        appBar: AppBar(
          title: Text('animation'),
        ),
        body: AnimWidget(),
      ),
    );
  }
}

// 动画是有状态的
class AnimWidget extends StatefulWidget {
  @override
  State createState() {
    return _AnimWidgetState();
  }
}

class _AnimWidgetState extends State<AnimWidget> with SingleTickerProviderStateMixin{
  AnimationController controller;
  CurvedAnimation curve;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(
      // 提供 vsync 最简单的方式，就是直接继承 SingleTickerProviderStateMixin
      vsync: this,
      // 动画的时长
      duration: Duration(milliseconds: 8000),
    );
    curve = CurvedAnimation(parent: controller, curve: Curves.bounceIn);
    // 调用 forward 方法开始动画
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
//    var scaled = ScaleTransition(scale: curve,child: FlutterLogo(size: 200.0,),);
//    return FadeTransition(opacity: curve,child: scaled,);
    return ScaleTransition(
      scale: curve,
      child: FlutterLogo(size: 200.0,),
    );
  }
}*/
