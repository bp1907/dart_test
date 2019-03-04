import 'package:flutter/material.dart';
import 'dart:io';

void main() {
  runApp(MyApp());
}

/*import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return MaterialApp(
      title: 'ListView Demo',
      home:ShowDialogWidget()
    );
  }
}

class ShowDialogWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _showDialogWidgetState();
  }
}

class _showDialogWidgetState extends State<ShowDialogWidget>{

  final buildings = [
    Building(BuildingType.theater, 'CineArts at the Empire', '85 W Portal Ave'),
    Building(BuildingType.theater, 'The Castro Theater', '429 Castro St'),
    Building(BuildingType.theater, 'Alamo Drafthouse Cinema', '2550 Mission St'),
    Building(BuildingType.theater, 'Roxie Theater', '3117 16th St'),
    Building(BuildingType.theater, 'United Artists Stonestown Twin', '501 Buckingham Way'),
    Building(BuildingType.theater, 'AMC Metreon 16', '135 4th St #3000'),
    Building(BuildingType.restaurant, 'K\'s Kitchen', '1923 Ocean Ave'),
    Building(BuildingType.restaurant, 'Chaiya Thai Restaurant', '72 Claremont Blvd'),
    Building(BuildingType.restaurant, 'La Ciccia', '291 30th St'),

    // double 一下
    Building(BuildingType.theater, 'CineArts at the Empire', '85 W Portal Ave'),
    Building(BuildingType.theater, 'The Castro Theater', '429 Castro St'),
    Building(BuildingType.theater, 'Alamo Drafthouse Cinema', '2550 Mission St'),
    Building(BuildingType.theater, 'Roxie Theater', '3117 16th St'),
    Building(BuildingType.theater, 'United Artists Stonestown Twin', '501 Buckingham Way'),
    Building(BuildingType.theater, 'AMC Metreon 16', '135 4th St #3000'),
    Building(BuildingType.restaurant, 'K\'s Kitchen', '1923 Ocean Ave'),
    Building(BuildingType.restaurant, 'Chaiya Thai Restaurant', '72 Claremont Blvd'),
    Building(BuildingType.restaurant, 'La Ciccia', '291 30th St'),
  ];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Building'),
      ),
      body: BuildingListView(buildings, (index){
        return showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context){
            return AlertDialog(
              title: Text('提示'),
              content: Text('item $index clicked'),
              actions: <Widget>[
                FlatButton(
                  child: Text('OK'),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            );
          },
        );
      }),
    );
  }
}


//给数据建模
enum BuildingType{
  theater,
  restaurant
}

class Building{
  final BuildingType type;
  final String title;
  final String address;

  Building(this.type,this.title,this.address);

}

//定义一个回调接口
typedef OnItemClickListener = void Function(int positon);

class ItemView extends StatelessWidget{
  
  final int position;
  final Building building;
  final OnItemClickListener listener;

  //这里的listener会从listview传过来
  ItemView(this.position,this.building,this.listener);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final icon = Icon(
      building.type == BuildingType.restaurant ? Icons.restaurant : Icons.theaters,
      color: Colors.blue[500],
    );

    final widget = Row(
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(16),
          child: icon,
        ),
        Expanded(child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              building.title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(building.address)
          ],
        )),
      ],
    );
    return InkWell(
      onTap: () => listener(position),
      child: widget,
    );
  }
}

class BuildingListView extends StatelessWidget {
  final List<Building> buildings;
  final OnItemClickListener listener;

  BuildingListView(this.buildings,this.listener);

  @override
  Widget build(BuildContext context) {
    // ListView.builder 可以按需生成子控件
    return ListView.builder(
        itemCount: buildings.length,
        itemBuilder: (context, index) {
          return new ItemView(index, buildings[index],listener);
        }
    );
  }
}*/

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {

    final titleSection = _TitleSection('Oeschinen Lake Campground', 'Kandersteg, Switzerland', 41);
    final buttonSection = Container(
      child: Row(
        //沿水平方向平均放置
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _buildButtonColumn(context, Icons.call, 'CALL'),
          _buildButtonColumn(context, Icons.near_me, 'ROUTE'),
          _buildButtonColumn(context, Icons.share, 'SHARE'),
        ],
      ),
    );
    final textSection = Container(
      padding: const EdgeInsets.all(32.0),
      child: Text('''Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps.Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. Activities enjoyed here include rowing, and riding the summer toboggan run.''',
        softWrap: true,),
    );

    return MaterialApp(
      title: 'Flutter UI basic 1',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Top Lakes'),
        ),
        body: ListView(
          children: <Widget>[
            Image.asset('images/lake.jpg',
              width: 600.0,
              height: 240.0,
              fit: BoxFit.cover,),
            titleSection,
            buttonSection,
            textSection,
          ],
        ),
      ),
    );
  }
}

class _TitleSection extends StatelessWidget {
  final String title;
  final String subtitle;
  final int starCount;

  _TitleSection(this.title, this.subtitle, this.starCount);

  @override
  Widget build(BuildContext context) {
    // 为了给 title section 加上 padding，这里我们给内容套一个 Container
    return Container(
      // 设置上下左右的 padding 都是 32。类似的还有 EdgeInsets.only/symmetric 等
      padding: EdgeInsets.all(32.0),
      child: Row(
        children: <Widget>[
          // 这里为了让标题占满屏幕宽度的剩余空间，用 Expanded 把标题包了起来
          Expanded(
            // 再次提醒读者，Expanded 只能包含一个子元素，使用的参数名是 child。接下来，
            // 为了在竖直方向放两个标题，加入一个 Column。
            child: Column(
              // Column 是竖直方向的，cross 为交叉的意思，也就是说，这里设置的是水平方向
              // 的对齐。在水平方向，我们让文本对齐到 start（读者可以修改为 end 看看效果）
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // 聪明的你，这个时候肯定知道为什么突然加入一个 Container 了。
                // 跟前面一样，只是为了设置一个 padding
                Container(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    title,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  subtitle,
                  style: TextStyle(color: Colors.grey[500]),
                )
              ],
            ),
          ),

          // 这里是 Row 的第二个子元素，下面这两个就没用太多值得说的东西了。
          Icon(
            Icons.star,
            color: Colors.red[500],
          ),

          Text(starCount.toString())
        ],
      ),
    );
  }
}

Widget _buildButtonColumn(BuildContext context, IconData icon, String label) {
  final color = Theme.of(context).primaryColor;

  return Column(
    // main axis 跟我们前面提到的 cross axis 相对应，对 Column 来说，指的就是竖直方向。
    // 在放置完子控件后，屏幕上可能还会有一些剩余的空间（free space），min 表占示尽量少用
    // free space；类似于 Android 的 wrap_content。
    // 对应的，还有 MainAxisSize.max
    mainAxisSize: MainAxisSize.min,
    // 沿着 main axis 居中放置
    mainAxisAlignment: MainAxisAlignment.center,

    children: <Widget>[
      Icon(icon, color: color),
      Container(
        margin: const EdgeInsets.only(top: 8.0),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 12.0,
            fontWeight: FontWeight.w400,
            color: color,
          ),
        ),
      )
    ],
  );
}


//自定义动画
/*
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
}*/

//手势和动画
/*class SampleApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      *//*initialRoute: '/',
      routes: {
        '/':(context) => HomeScreen(),
        '/about':(context) => AboutScreen(),
      },*//*
      title: '111',
      home: _MessageListScreen(),*//*Scaffold(
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
      ),*//*
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
}*/

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


//动画
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