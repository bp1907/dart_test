import 'package:flutter/material.dart';
import 'dart:io';

void main() {
  runApp(SampleApp());
}

class SampleApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sample App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Center(
        child: SampleAppPage(),
      ),
    );
  }
}

class SampleAppPage extends StatefulWidget {
  SampleAppPage({Key key}) : super(key: key);

  @override
  _SampleAppPageState createState() => _SampleAppPageState();
}

class _SampleAppPageState extends State<SampleAppPage> {
  // Default value for toggle
  bool toggle = true;
  void _toggle() {
    setState(() {
      toggle = !toggle;
    });
  }

  _getToggleChild() {
    if (toggle) {
      return Text('Toggle One');
    } else {
      return MaterialButton(onPressed: () {}, child: Text('Toggle Two'));
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("Sample App"),
      ),
      body: Center(
        child: _getToggleChild(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _toggle,
        tooltip: 'Update Text',
        child: Icon(Icons.update),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
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

/*
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
    // 在放置完子控件后，屏幕上可能还会有一些剩余的空间（free space），min 表示尽量少占用
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
}*/
