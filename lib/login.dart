import 'package:flutter/material.dart';

void main(){
  runApp(LoginApp());
}

class LoginApp extends StatefulWidget {
  @override
  _LoginAppState createState() => _LoginAppState();
}

class _LoginAppState extends State<LoginApp> {

  //全局Key用来获取Form表单组件
  GlobalKey<FormState> loginKey = new GlobalKey<FormState>();

  //用户名
  String userName;

  //密码
  String password;

  void login(){
    //读取当前的form状态
    var loginForm = loginKey.currentState;

    //验证form表单
    if(loginForm.validate()){
      loginForm.save();
      print('userName: $userName , password: $password');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'login',
      home: Scaffold(
        appBar: AppBar(
          title: Text('login'),
        ),
        body: Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: loginKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: '请输入用户名',
                      ),
                      onSaved: (value){
                        userName = value;
                      },
                      onFieldSubmitted: (value){},
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: '请输入密码',
                      ),
                      obscureText: true,
                      //验证表单方法
                      validator: (value){
                        return value.length < 6 ? '密码长度不够6位' : null;
                      },
                      onSaved: (value){
                        password = value;
                      },
                    ),
                    SizedBox(
                      width: 340.0,
                      height: 42.0,
                      child: RaisedButton(
                        onPressed: login,
                        child: Text(
                          '登录',
                          style: TextStyle(
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


/*
class LoginApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'wm',
      home: Scaffold(
        appBar: AppBar(
          title: Text('万马集团'),
        ),
        body: Container(
          margin: EdgeInsets.only(top: 20),
          child: Column(
            children: <Widget>[
              Image.asset(
                'images/logo.png',
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
              Container(
                margin: EdgeInsets.only(top: 30,left: 10,right: 10),
                child: Stack(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: Icon(Icons.account_box,color: Colors.lightBlue,),
                    ),
                    TextField(
                      decoration: InputDecoration(
                        hintText: '请输入用户名',
                        contentPadding: EdgeInsets.all(1.0),
                      ),
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                  alignment: AlignmentDirectional.bottomStart,
                  overflow: Overflow.clip,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20,left: 10,right: 10),
                child: Stack(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: Icon(Icons.lock_open,color: Colors.lightBlue,),
                    ),
                    TextField(
                      decoration: InputDecoration(
                        hintText: '请输入密码',
                        contentPadding: EdgeInsets.all(1.0),
                      ),
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: RaisedButton(
                  onPressed: ()=>debugPrint('login'),
                  child: Container(
                    width: 250,
                    height: 40,
                    child: Center(
                      child: Text('登录'),
                    ),
                  ),
                  color: Colors.lightBlue,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}*/
