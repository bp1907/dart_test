import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart' as path_provider;

void main(){
  runApp(SampleApp());
}

class SampleApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      /*initialRoute: '/',
      routes: {
        '/':(context) => HomeScreen(),
        '/about':(context) => AboutScreen(),
      },*/
      title: '111',
      home: _MessageListScreen(),/*Scaffold(
        appBar: AppBar(
          title: Text('111'),
        ),
        body: Center(
          child: GestureDetector(
            child: Text('手势'),
            onTap: () => debugPrint('123'),
            onTapDown: (TapDownDetails details) {
              debugPrint('456');
            },
            onTapCancel: () => debugPrint('cancle'),
          ),
        ),
      ),*/
    );
  }
}

class Message{
  final String msg;
  final int timestamp;

  Message(this.msg,this.timestamp);

  Message.create(String msg): msg=msg,timestamp=DateTime.now().millisecondsSinceEpoch;

  Map<String,dynamic> toJson()=> {
    'msg':'$msg',
    'timestamp':timestamp
  };

  Message.fromJson(Map<String,dynamic> json):msg = json['msg'],timestamp = json['timestamp'];

  @override
  String toString() {
    // TODO: implement toString
    return 'Message{msg : $msg, timestamp: $timestamp}';
  }
}

class _MessageList extends StatefulWidget{

  _MessageList({Key key}): super(key:key);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MessageListState();
  }
}

HttpEchoServer _server;
HttpEchoClient _client;

class _MessageListState extends State<_MessageList>{
  
  final List<Message> message = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    const port = 6000;
    _server = HttpEchoServer(port);
    _server.start().then((_){
      _client = HttpEchoClient(port);
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder(
        itemBuilder: (context,index){
          final msg = message[index];
          final subtitle = DateTime.fromMicrosecondsSinceEpoch(msg.timestamp).toLocal().toIso8601String();
          return ListTile(
            title: Text(msg.msg),
            subtitle: Text(subtitle),
          );
        },
      itemCount: message.length,
    );
  }

  void addMessage(Message msg){
    setState(() {
      message.add(msg);
    });
  }
}


class AddMessageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add message'),
      ),
      body: _MessageForm(),
    );
  }
}

class _MessageForm extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MessageFormState();
  }
}

class _MessageFormState extends State<_MessageForm>{

  final editController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    editController.dispose();//释放资源
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Row(
        children: <Widget>[
          Expanded(
              child: Container(
                margin: EdgeInsets.only(right: 8.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Input message',
                    contentPadding: EdgeInsets.all(0.0)
                  ),
                  style: TextStyle(
                    fontSize: 22.0,
                    color: Colors.black54
                  ),
                  controller: editController,
                  autofocus: true,
                ),
              ),
          ),
          InkWell(
            onTap: () {
              debugPrint('send : ${editController.text}');
              final msg = Message(editController.text, DateTime.now().millisecondsSinceEpoch);
              Navigator.pop(context,msg);
            },
            onDoubleTap: () => debugPrint('double tapped'),
            onLongPress: () => debugPrint('long pressed'),
            child: Hero(
              tag: 'hero',
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 16.0),
                decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Text('send'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _MessageListScreen extends StatelessWidget{
  final messageListKey = GlobalKey<_MessageListState>(debugLabel: 'messageListKey');

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Echo Client'),
      ),
      body: _MessageList(key:messageListKey),
      floatingActionButton: FloatingActionButton(
        onPressed: () async{
          final result = await Navigator.push(context, MaterialPageRoute(builder: (_) => AddMessageScreen()));

          if(_client == null)return;
          
          var message = await _client.send(result);
          if(message != null){
            messageListKey.currentState.addMessage(message);
          }else{
            print('fail to send $result');
          }
//          print('result: $result');
//          if(result is Message){
//            messageListKey.currentState.addMessage(result);
//          }
        },
        child: Hero(
            tag: 'hero',
            child: Container(
              child: Icon(Icons.add),
            ),
        ),
        tooltip: 'Add message',
      ),
    );
  }
}

class HttpEchoClient{
  final int port;
  final String host;

  HttpEchoClient(this.port):host = 'http://localhost:$port';

  Future<Message> send(String msg) async{
    final response = await http.post(host + '/echo',body: msg);
    if(response.statusCode == 200){
      Map<String,dynamic> msgJson = json.decode(response.body);
      var message = Message.fromJson(msgJson);
      return message;
    }else{
      return null;
    }
  }
}

class HttpEchoServer {

  String historyFilepath;

  static const GET = 'GET';
  static const POST = 'POST';

  List<Message> messages = [];

  final int port;
  HttpServer httpServer;
  // 在 Dart 里面，函数也是 first class object，所以我们可以直接把
  // 函数放到 Map 里面
  Map<String, void Function(HttpRequest)> routes;

  HttpEchoServer(this.port) {
    _initRoutes();
  }

  _unsupportedMethod(HttpRequest request) {
    request.response.statusCode = HttpStatus.methodNotAllowed;
    request.response.close();
  }

  void _initRoutes() {
    routes = {
      // 我们只支持 path 为 '/history' 和 '/echo' 的请求。
      // history 用于获取历史记录；
      // echo 则提供 echo 服务。
      '/history': _history,
      '/echo': _echo,
    };
  }

  // 返回一个 Future，这样客户端就能够在 start 完成后做一些事
  Future start() async {

    historyFilepath = await _historyPath();

    await _loadMessages();
    // 1. 创建一个 HttpServer
    httpServer = await HttpServer.bind(InternetAddress.loopbackIPv4, port);
    // 2. 开始监听客户请求
    return httpServer.listen((request) {
      final path = request.uri.path;
      final handler = routes[path];
      if (handler != null) {
        handler(request);
      } else {
        // 给客户返回一个 404
        request.response.statusCode = HttpStatus.notFound;
        request.response.close();
      }
    });
  }

  Future _loadMessages() async {
    try {
      var file = File(historyFilepath);
      var exists = await file.exists();
      if (!exists) return;

      var content = await file.readAsString();
      var list = json.decode(content);
      for (var msg in list) {
        var message = Message.fromJson(msg);
        messages.add(message);
      }
    } catch (e) {
      print('_loadMessages: $e');
    }
  }

  Future<String> _historyPath() async {
    // 获取应用私有的文件目录
    final directory = await path_provider.getApplicationDocumentsDirectory();
    return directory.path + '/messages.json';
  }

  void _history(HttpRequest request) {
    // ...
    if (request.method != GET) {
      _unsupportedMethod(request);
      return;
    }

    String historyData = json.encode(messages);
    request.response.write(historyData);
    request.response.close();
  }

  void _echo(HttpRequest request) async {
    _storeMessages();
    // ...
    if (request.method != POST) {
      _unsupportedMethod(request);
      return;
    }

    // 获取从客户端 POST 请求的 body，更多的知识，参考
    // https://www.dartlang.org/tutorials/dart-vm/httpserver
    String body = await request.transform(utf8.decoder).join();
    if (body != null) {
      var message = Message.create(body);
      messages.add(message);
      request.response.statusCode = HttpStatus.ok;
      // json 是 convert 包里的对象，encode 方法还有第二个参数 toEncodable。当遇到对象不是
      // Dart 的内置对象时，如果提供这个参数，就会调用它对对象进行序列化；这里我们没有提供，
      // 所以 encode 方法会调用对象的 toJson 方法，这个方法在前面我们已经定义了
      var data = json.encode(message);
      // 把响应写回给客户端
      request.response.write(data);
    } else {
      request.response.statusCode = HttpStatus.badRequest;
    }
    request.response.close();
  }

  Future<bool> _storeMessages() async {
    try {
      // json.encode 支持 List、Map
      final data = json.encode(messages);
      // File 是 dart:io 里的类
      final file = File(historyFilepath);
      final exists = await file.exists();
      if (!exists) {
        await file.create();
      }
      file.writeAsString(data);
      return true;
      // 虽然文件操作方法都是异步的，我们仍然可以通过这种方式 catch 到
      // 他们抛出的异常
    } catch (e) {
      print('_storeMessages: $e');
      return false;
    }
  }

  void close() async {
    var server = httpServer;
    httpServer = null;
    await server?.close();
  }
}

/*
class FirstScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _FirstScreenState();
  }
}

class _FirstScreenState extends State<FirstScreen>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('routeA'),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () async{
            var msg = await Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => SecondScreen())
            );
            debugPrint('msg = $msg');
          },
          child: Text('First Screen'),
        ),
      ),
    );
  }
}

class SecondScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SecondScreenState();
  }
}

class _SecondScreenState extends State<SecondScreen>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('routeB'),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () => Navigator.pop(context,'second message'),
          child: Text('Second Screen'),
        ),
      ),
    );
  }
}*/
