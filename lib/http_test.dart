import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'demo',
      home: TestHttp(),
    );
  }
}

class TestHttp extends StatefulWidget {
  @override
  _TestHttpState createState() => _TestHttpState();
}

class _TestHttpState extends State<TestHttp> {
  
  String showResult = '';
  
  Future<CommonModel> fetchPost() async {
    final response = await http.get('http://www.devio.org/io/flutter_app/json/test_common_model.json');
    Utf8Decoder utf8decoder = Utf8Decoder();//fix z中文乱码
    final result = json.decode(utf8decoder.convert(response.bodyBytes));
//    final result = json.decode(response.body);
    return CommonModel.fromJson(result);
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('异步编程'),
      ),
      body: FutureBuilder<CommonModel>(
        future: fetchPost(),
        builder: (BuildContext context, AsyncSnapshot<CommonModel> snapshot) {
          switch(snapshot.connectionState) {
            case ConnectionState.none:
              return Text('输入一个url');
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator(semanticsLabel: '加载中...',),);
            case ConnectionState.active:
              return Text('');
            case ConnectionState.done:
              if(snapshot.hasError) {
                return Text('${snapshot.error}',style: TextStyle(color: Colors.red),);
              }else {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('icon : ${snapshot.data.icon}'),
                    Text('statusBarColor : ${snapshot.data.statusBarColor}'),
                    Text('title : ${snapshot.data.title}'),
                  ],
                );
              }
          }
        },
      ),/*Column(
        children: <Widget>[
          InkWell(
            child: Text('点我',style: TextStyle(fontSize: 32.0),),
            onTap: () {
              fetchPost().then((CommonModel value){
                setState(() {
                  showResult = '请求结果:\n hideAppBar : ${value.hideAppBar}\n icon : ${value.icon}';
                });
              });
            },
          ),
          Text(showResult),
        ],
      )*/
    );
  }
}

class CommonModel {
  final String icon;
  final String title;
  final String url;
  final String statusBarColor;
  final bool hideAppBar;

  CommonModel({this.icon,this.title,this.url,this.statusBarColor,this.hideAppBar});


  //参数是final类型用factory下面这种方式
  factory CommonModel.fromJson(Map<String,dynamic> json) {
    return CommonModel(
      icon: json['icon'],
      title: json['title'],
      statusBarColor: json['statusBarColor'],
      url: json['url'],
      hideAppBar: json['hideAppBar'],
    );
  }
}


//class MyApp extends StatelessWidget{
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    return MaterialApp(
//      title: 'http请求',
//      home: Scaffold(
//        appBar: AppBar(
//          title: Text('http请求'),
//        ),
//        body: Center(
//          child: RaisedButton(
//            onPressed: (){
//              var url = 'http://httpbin.org/';
//              http.get(url).then((response){
//                print('状态：${response.statusCode}');
//                print('正文：${response.body}');
//              });
//            },
//            child: Text('http请求'),
//          ),
//        ),
//      ),
//    );
//  }
//}

//class MyApp extends StatelessWidget{
//
//  void getWeatherData() async {
//    try{
//      HttpClient httpClient = new HttpClient();
//      HttpClientRequest request = await httpClient.getUrl(
//          Uri.parse("http://t.weather.sojson.com/api/weather/city/101030100"));
//      HttpClientResponse response = await request.close();
//      var result = await response.transform(utf8.decoder).join();
//      print(result);
//      httpClient.close();
//    }catch(e){
//      print('请求失败：$e');
//    }finally{
//
//    }
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    return MaterialApp(
//      title: 'HttpClient请求',
//      home: Scaffold(
//        appBar: AppBar(
//          title: Text('HttpClient请求'),
//        ),
//        body: Center(
//          child: RaisedButton(
//            onPressed: getWeatherData,
//            child: Text('获取天气数据'),
//          ),
//        ),
//      ),
//    );
//  }
//}