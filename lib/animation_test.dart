import 'package:flutter/material.dart';

void main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '动画示例',
      home: TestOpacity(),
    );
  }
}

class TestOpacity extends StatefulWidget {
  @override
  _TestOpacityState createState() => _TestOpacityState();
}

class _TestOpacityState extends State<TestOpacity> {
  
  bool _visible = true;
  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text('渐变动画'),
      ),
      body: Center(
        child: AnimatedOpacity(
          opacity: _visible?1.0:0.0,
          duration: Duration(milliseconds: 2000),
          child: Container(
            width: 200.0,
            height: 200.0,
            color: Colors.deepPurple ,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
            _visible = !_visible;
          });
        },
        child: Icon(Icons.flip),
      ),
    );
  }
}
