import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'route',
      home: FirstPage()/*ProductList(products: List<Product>.generate(10, (i) => Product('商品$i', '商品$i的详情页')),)*/,
    );
  }
}

//数据返回示例
class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text('第一个页面'),
      ),
      body: Center(
        child: MyButton(),
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton (
      onPressed: () {
        _toSecondPage(context);
      },
      child: Text('跳转第二个页面'),
    );
  }

  _toSecondPage(BuildContext context) async{
    final result = await Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context){
            return SecondPage();
          },
        )
    );
    Scaffold.of(context).showSnackBar(SnackBar(content: Text('$result')));
  }
}


class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('选一个返回'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(8.0),
              child: RaisedButton(onPressed: (){Navigator.pop(context,'hi google');},child: Text('hi google'),),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: RaisedButton(onPressed: (){Navigator.of(context).pop('hi flutter');},child: Text('hi flutter'),),
            ),
          ],
        ),
      ),
    );
  }
}


//数据传递示例
class Product{
  final String title;
  final String description;

  Product(this.title,this.description);
}

class ProductList extends StatelessWidget {

  final List<Product> products;

  ProductList({Key key,this.products}): super(key:key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('商品列表'),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context,index){
          return Column(
            children: <Widget>[
              ListTile(
                title: Text(products[index].title),
                onTap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context){
                          return ProductDetail(product: products[index],);
                        },
                      ));
                },
              ),
              Divider(height: 2.0,),
            ],
          );
        },
      ),
    );
  }
}

class ProductDetail extends StatelessWidget {

  final Product product;
  ProductDetail({Key key,this.product}): super(key:key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${product.title}详情'),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Text('${product.description}'),
        ),
      ),
    );
  }
}



class FirstSreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('导航页面示例'),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => DetailScreen()));
          },
          child: Text('查看商品详情页'),
        ),
      ),
    );
  }
}


class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("导航页面示例"),
      ),
      body: new Center(
        child: new RaisedButton(
          onPressed: (){
            Navigator.pop(context);
          },
          child: new Text('返回页面'),
        ),
      ),
    );
  }
}
