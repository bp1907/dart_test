import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '武当山风景区',
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.lightGreen[600], //App主要部分的背景色
        accentColor: Colors.orange[600], //前景色(文本、按钮等)
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('武当山风景区',style: TextStyle(color: Colors.white),),
          centerTitle: true,
        ),
        body: ListView(
          children: <Widget>[
            //图片地址
            _image,
            //景区地址
            _adressContainer,
            //按钮
            _buttonContainer,
            //文字介绍
            textContainer,
          ],
        ),
      ),
    );
  }

  //图片地址
 final Image _image = Image.asset(
   'images/lake.jpg',
   width: 600.0,
   height: 240.0,
   fit: BoxFit.cover,
 );
 //景区地址
 Container _adressContainer = Container(
   padding: EdgeInsets.all(32.0),
   child: Row(
     children: <Widget>[
       Expanded(
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: <Widget>[
             Container(
               padding: const EdgeInsets.only(bottom: 8.0),
               child: Text(
                 '风景区地址',
                 style: TextStyle(
                   fontWeight: FontWeight.bold,
                 ),
               ),
             ),
            Text(
              '湖北省十堰市丹江口市',
              style: TextStyle(
                color: Colors.grey[500],
              ),
            ),
           ],
         ),
       ),
       Icon(Icons.star,color: Colors.red[500],),
       Text('66',),
     ],
   ),
 );

 //按钮
  Container _buttonContainer = Container(
   child: Row(
     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
     children: <Widget>[
       _columnButton(Icons.call, '电话'),
       _columnButton(Icons.near_me, '导航'),
       _columnButton(Icons.share, '分享'),
     ],
   ),
 );

  /*//按钮组部分
  Widget buttonsContainer = Container(
    //容器横向布局
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,//水平方向均匀排列每个元素
      children: <Widget>[
        buildButtonColumn(Icons.call, '电话'),
        buildButtonColumn(Icons.near_me, '导航'),
        buildButtonColumn(Icons.share, '分享'),
      ],
    ),
  );

  //构建按钮组中单个按钮 参数为图标及文本
  static Column buildButtonColumn(IconData icon, String label) {
    return Column(
        mainAxisSize: MainAxisSize.min,//垂直方向大小最小化
        mainAxisAlignment: MainAxisAlignment.center,//垂直方向居中对齐
        children: <Widget>[
        Icon(icon, color: Colors.lightGreen[600]),//上面图标部分
    Container(
    margin: const EdgeInsets.only(top: 8.0),child: Text(//下面文本部分
      label,
      style: TextStyle(
        fontSize: 12.0,
        fontWeight: FontWeight.w400,
        color: Colors.lightGreen[600],
      ),
    ),
    )
        ],
    );
  }*/

 //文字介绍
Container textContainer = Container(
  padding: const EdgeInsets.all(32.0),
  child: Text(
    '''
      武当山, 中国道教圣地, 又名太和山、谢罗山、参上山、仙室山, 古有“太岳”“玄岳”“大岳”之称。位于湖北西北部十堰市丹江口市境内。东接闻名古城襄阳市, 西靠车城十堰市 , 南望原始森林神农架,北临高峡平湖 丹江口水库。明代, 武当山被皇帝封为“大岳”、“治世玄岳”, 被尊为“皇室家庙”。武当山以“四大名山皆拱揖, 五方仙岳共朝宗”的“五岳之冠”地位闻名于世。
      1994年12月, 武当山古建筑群入选《世界遗产名录》, 2006年被整体列为“全国重点文物保护单位”。2007年, 武当山和长城、丽江、周庄等景区一起入选“欧洲人最喜爱的中国十大景区”。2010至2013年, 武当山分别被评为国家5A级旅游区、国家森林公园、中国十大避暑名山、海峡两岸交流基地, 入选最美“国家地质公园”。 
      截至2013年, 武当山有古建筑53处, 建筑面积2.7万平方米, 建筑遗址9处, 占地面积20多万平方米, 全山保存各类文物5035件。 
      武当山是道教名山和武当武术的发源地, 被称为“亘古无双胜境, 天下第一仙山”。武当武术, 是中华武术的重要流派。元末明初, 道士张三丰集其大成, 开创武当派。
    ''',
    softWrap: true,
  ),
);

}

Column _columnButton(IconData icon, String str){
  return Column(
    children: <Widget>[
      Icon(icon,color: Colors.lightGreen[600],),
      Container(
        margin: const EdgeInsets.only(top: 8.0),
        child: Text(str,style: TextStyle(fontSize: 12.0,color: Colors.lightGreen[600],),
        ),
      ),
    ],
  );
}