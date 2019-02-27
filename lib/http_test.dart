import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';

void main() => runApp(MyApp());

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

class MyApp extends StatelessWidget{

  void getWeatherData() async {
    try{
      HttpClient httpClient = new HttpClient();
      HttpClientRequest request = await httpClient.getUrl(
          Uri.parse("http://t.weather.sojson.com/api/weather/city/101030100"));
      HttpClientResponse response = await request.close();
      var result = await response.transform(utf8.decoder).join();
      print(result);
      httpClient.close();
    }catch(e){
      print('请求失败：$e');
    }finally{

    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'HttpClient请求',
      home: Scaffold(
        appBar: AppBar(
          title: Text('HttpClient请求'),
        ),
        body: Center(
          child: RaisedButton(
            onPressed: getWeatherData,
            child: Text('获取天气数据'),
          ),
        ),
      ),
    );
  }
}