import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'materialapp',
      home: TestCard(),
      routes: {
        '/first': (BuildContext context) => FirstPage(),
        '/second': (BuildContext context) => SecondPage(),
      },
//      initialRoute: '/first',//初始路由页面为first页面
    );
  }
}

//Card组件
class TestCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    var card = SizedBox(
      height: 250.0,
      child: Card(
        child: Column(
          children: <Widget>[
            new ListTile(
              title: new Text(
                ' 深圳市南山区深南大道35号',style: new TextStyle(fontWeight: FontWeight.w300),
              ),
              subtitle: new Text('创想科技有限公司'),
              leading: new Icon(
                Icons.home,
                color: Colors.lightBlue,
              ),
            ),
            new Divider(),
            new ListTile(
              title: new Text(
                ' 深圳市罗湖区沿海大道32号',style: new TextStyle(fontWeight: FontWeight.w300),
              ),
              subtitle: new Text('一木培训机构'),
              leading: new Icon(
                Icons.school,
                color: Colors.lightBlue,
              ),
            ),
            new Divider(),
          ],
        ),
      ),
    );
    return Scaffold(
      appBar: new AppBar(
        title: new Text('Card布局示例'),
      ),
      body: Center(
        child: card,
      ),
    );
  }
}


//TextField组件
class TestTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();
    controller.addListener((){
      print('输入：${controller.text}');
    });

    return Scaffold(
      appBar: AppBar(
        title: Text('TextField组件示例'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: TextField(
            controller: controller,
            maxLength: 30,//最大长度, 设置此项会让TextField右下角有一个输入数量的统计字符
            maxLines: 1,
            autocorrect: true,
            autofocus: true,
            obscureText: false,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 26.0,
              color: Colors.green,
            ),
            onChanged: (text){
              print('文本内容改变时回调 $text');
            },
            onSubmitted: (text){
              print('文本内容提交时回调 $text');
            },
            enabled: true,
            decoration: InputDecoration(
              fillColor: Colors.grey.shade200,
              filled: true,
              helperText: '用户名',
              prefixIcon: Icon(Icons.person),
//              suffixText: 'admin',
            ),
          ),
        ),
      ),
    );
  }
}


//轻量提示组件,在屏幕底部显示
class TestSnackBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SnackBar组件'),
      ),
      body: Center(
        child: Text(
          'snackbar示例',
          style: TextStyle(fontSize: 28.0),
        ),
      ),
      floatingActionButton: Builder(builder: (context){
        return FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: (){
            Scaffold.of(context)
                .showSnackBar(
                SnackBar(
                  content: Text('提示SnackBar'),
                  backgroundColor: Colors.green,
                )
            );
          },
          shape: CircleBorder(),
        );
      }),
    );
  }
}


//提示对话框
class TestAlertDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: AlertDialog(
        title: const Text('提示'),
        content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('是否要删除？'),
                Text('一旦删除数据不可恢复？'),
              ],
            )
        ),
        actions: <Widget>[
          FlatButton(onPressed: (){}, child: Text('确认')),
          FlatButton(onPressed: (){}, child: Text('取消')),
        ],
      ),
    );
  }
}


//简单对话框组件
class TestSimpleDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SimpleDialog(
        title: const Text('对话框标题'),
        children: <Widget>[
          SimpleDialogOption(
            onPressed: (){},
            child: const Text('第一行信息'),
          ),
          SimpleDialogOption(
            onPressed: (){},
            child: const Text('第二行信息'),
          ),
        ],
      ),
    );
  }
}



//弹出菜单组件
enum ConferenceItem{
  AddMember,
  LockConference,
  ModifyLayout,
  TurnoffAll
}

class TestPopMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PopupMenuButton组件示例'),
      ),
      body: Center(
        child: FlatButton(
          onPressed: (){},
          child: PopupMenuButton<ConferenceItem>(
            onSelected: (ConferenceItem result){
              print(result);
            },
            itemBuilder: (context) =>
              <PopupMenuEntry<ConferenceItem>>[
                const PopupMenuItem<ConferenceItem>(//菜单项
                  value: ConferenceItem.AddMember,
                  child: Text('添加成员'),
                ),
                const PopupMenuItem<ConferenceItem>(
                  value: ConferenceItem.LockConference,
                  child: Text('锁定会议'),
                ),
                const PopupMenuItem<ConferenceItem>(
                  value: ConferenceItem.ModifyLayout,
                  child: Text('修改布局'),
                ),
                const PopupMenuItem<ConferenceItem>(
                  value: ConferenceItem.TurnoffAll,
                  child: Text('挂断所有'),
                ),
              ],
          ),
        ),
      ),
    );
  }
}


//扁平按钮组件
class TestFlatButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FlatButton扁平按钮组件示例'),
      ),
      body: Center(
        child: FlatButton(
          onPressed: () {},
          child: Text(
            'FlatButton',
            style: TextStyle(fontSize: 24.0),
          ),
        ),
      ),
    );
  }
}


//悬停按钮组件
class TestFloatingActionBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FloatingActionButton示例'),
      ),
      body: Center(
        child: Text(
          'FloatingActionButton示例',
          style: TextStyle(fontSize: 28.0),
        ),
      ),
      floatingActionButton: new Builder(builder: (BuildContext context) {
        return new FloatingActionButton(
          child: const Icon(Icons.add),
          //提示信息
          tooltip: "请点击FloatingActionButton",
          //前景色为白色
          foregroundColor: Colors.black,
          //背景色为蓝色
          backgroundColor: Colors.blue,
          //未点击阴影值
          elevation: 7.0,
          //点击阴影值
          highlightElevation: 14.0,
          onPressed: () { //点击回调事件 弹出一句提示语句
            Scaffold.of(context).showSnackBar(new SnackBar(
              content: new Text("你点击了FloatingActionButton"),
            ));
          },
          mini: false,
          //圆形边
          shape: new CircleBorder(),
          isExtended: false,
        );
      }),
      floatingActionButtonLocation:
      FloatingActionButtonLocation.centerFloat, //居中放置 位置可以设置成左中右
    );
  }
}


//drawer抽屉组件
class TestDrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Drawer抽屉组件'),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            //设置用户信息 头像、用户名、Email等
            UserAccountsDrawerHeader(
              accountName: Text('王振'),
              accountEmail: Text('1486499203@qq.com'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('images/logo.png'),
              ),
              onDetailsPressed: (){
              },
              otherAccountsPictures: <Widget>[
                Container(
                  child: Image.asset('images/lake.jpg'),
                ),
              ],
            ),
            ListTile(
              leading: CircleAvatar(child: Icon(Icons.color_lens),),
              title: Text('个性装扮'),
            ),
            ListTile(
              leading: CircleAvatar(child: Icon(Icons.photo),),
              title: Text('我的相册'),
            ),
            ListTile(
              leading: CircleAvatar(child: Icon(Icons.wifi),),
              title: Text('免流量特权'),
            ),
          ],
        ),
      ),
    );
  }
}


//水平选项卡示例
class TestTabBarNewWidget extends StatelessWidget{

   List<ItemView> items = const <ItemView>[
     const ItemView(title: '自驾', icon: Icons.directions_car),
     const ItemView(title: '自行车', icon: Icons.directions_bike),
     const ItemView(title: '轮船', icon: Icons.directions_boat),
     const ItemView(title: '公交车', icon: Icons.directions_bus),
     const ItemView(title: '火车', icon: Icons.directions_railway),
     const ItemView(title: '步行', icon: Icons.directions_walk),
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
      length: items.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text('TabBar'),
          bottom: TabBar(
            isScrollable: true,
            tabs: items.map((ItemView item){//迭代添加选项卡子项
              return Tab(text: item.title,icon: Icon(item.icon),);
            }).toList(),
          ),
        ),
        body: TabBarView(
          children: items.map((ItemView item){
            return Padding(padding: const EdgeInsets.all(16.0),child: SelectedView(item: item,),);
          }).toList(),
        ),
      ),
    );
  }
}

//视图项数据
class ItemView{
  final String title;
  final IconData icon;
  const ItemView({this.title,this.icon});
}

//被选中的视图
class SelectedView extends StatelessWidget {

  final ItemView item;

  SelectedView({Key key,this.item}) : super(key:key);

  @override
  Widget build(BuildContext context) {

    final TextStyle textStyle = Theme.of(context).textTheme.display1;
    return Card(
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,//垂直方向最小化处理
          crossAxisAlignment: CrossAxisAlignment.center,//水平方向居中对齐
          children: <Widget>[
            Icon(item.icon,size: 128.0, color: textStyle.color,),
            Text(item.title,style: textStyle,),
          ],
        ),
      ),
    );
  }
}


//水平选项卡DefaultTabController
class TestTabBarWidget extends StatelessWidget {

  final List<Tab> myTabs = <Tab>[
    Tab(text: '选项一',),
    Tab(text: '选项二',)
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: myTabs.length,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: myTabs,
          ),
        ),
        body: TabBarView(
          children: myTabs.map((Tab tab){
            return Center(child: Text(tab.text),);
        }).toList(),
        ),
      ),
    );
  }
}


//底部导航条组件
class TestButtonNavigation extends StatefulWidget {
  @override
  _TestButtonNavigationState createState() => _TestButtonNavigationState();
}

class _TestButtonNavigationState extends State<TestButtonNavigation> {

  int _selectedIndex = 1;//当前选中项索引
  final _widgetOptions = [
    Text('Index 0: 信息'),
    Text('Index 1: 通讯录'),
    Text('Index 2: 发现'),
  ];

  void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ButtonNavigationBar'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),//居中显示某一个文本
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.chat,),title: Text('信息'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contacts,),title: Text('通讯录'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle,),title: Text('发现'),
          )
        ],
        currentIndex: _selectedIndex,
        fixedColor: Colors.deepPurple,//选中项的颜色
        onTap: _onItemTapped,
      ),
    );
  }
}


//appbar组件
class TestAppBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('appbar应用'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: (){},
          ),
          IconButton(
            icon: Icon(Icons.add),
            onPressed: (){},
          ),
          PopupMenuButton(itemBuilder: (context){
            return <PopupMenuEntry>[
              PopupMenuItem(child: Icon(Icons.alarm)),
              PopupMenuItem(child: Icon(Icons.close)),
              PopupMenuItem(child: Icon(Icons.phone)),
            ];
          }),
        ],
//        bottom: TabBar(tabs: <Widget>[
//          Text('1'),
//          Text('2'),
//          Text('3'),
//        ]),
      ),
    );
  }
}


//scaffold组件
class TestScaffoldWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('scaffold组件'),
      ),
      body: Center(
        child: Text('Scaffold'),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 50.0,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        tooltip: 'add',
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

//应用组件MaterialApp
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text('MaterialApp示例'),
      ),
      body: Center(
        child: Text(
          '主页',
          style: TextStyle(fontSize: 28.0),
        ),
      ),
    );
  }
}

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text('这是第一页'),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: (){
            Navigator.pushNamed(context, '/second');
          },
          child: Text(
            '这是第一页',
            style: TextStyle(fontSize: 28.0),
          ),
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text('这是第二页'),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: (){
            Navigator.pushNamed(context, '/first');
          },
          child: Text(
            '这是第二页',
            style: TextStyle(fontSize: 28.0),
          ),
        ),
      ),
    );
  }
}


