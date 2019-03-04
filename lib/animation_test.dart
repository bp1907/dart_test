import 'package:flutter/material.dart';

void main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '动画示例',
      home: FirstPage(),
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

//Hero页面切换
class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('第一个页面'),
      ),
      body: GestureDetector(
        child: Center(
          child: Hero(
            tag: '1',
            child: Image.network('http://img1d.xgo-img.com.cn/pics/1745/1744799.jpg'),
          ),
        ),
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context){return SecondPage();}));
        },
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('第二个页面'),
      ),
      body: GestureDetector(
        child: Center(
          child: Hero(
            tag: '2',
            child: Image.network('http://img1d.xgo-img.com.cn/pics/1768/1767969.jpg'),
          ),
        ),
        onTap: (){
          Navigator.pop(context);
        },
      ),
    );
  }
}
