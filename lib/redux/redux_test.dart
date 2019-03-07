import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';


///state中所有的属性都应该是只读的

//创建state
@immutable
class CountState {
  int _count;
  get count => _count;

  CountState(this._count);

  CountState.initState(){_count = 0;}
}

//创建Action
enum Action {
  increment
}

//创建reducer
CountState reducer(CountState state,action) {
  //匹配action
  if(action == Action.increment){
    return CountState(state.count + 1);
  }
  return state;
}

//创建store 用Redux管理全局的状态的话，需要将store储存在应用的入口才行
void main(){
  final store = Store<CountState>(reducer,initialState: CountState.initState());
  runApp(MyApp(store));
}

//将store放入顶层
class MyApp extends StatelessWidget {
  final Store<CountState> store;

  MyApp(this.store);

  @override
  Widget build(BuildContext context) {
    return StoreProvider<CountState>(
      store: store,
      child: MaterialApp(
        title: 'Redux Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: TopScreen(),
      ),
    );
  }
}

//在子页面获取store中的state
class TopScreen extends StatefulWidget {
  @override
  _TopScreenState createState() => _TopScreenState();
}

class _TopScreenState extends State<TopScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Top Screen'),
      ),
      body: Center(
        child: StoreConnector<CountState,int>(
          builder: (context,count){
            return Text(count.toString(),style: Theme.of(context).textTheme.display1,);
          },
          converter: (store) => store.state.count,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
            return UnderScreen();
          }));
        },
        child: Icon(Icons.forward),
      ),
    );
  }
}

class UnderScreen extends StatefulWidget {
  @override
  _UnderScreenState createState() => _UnderScreenState();
}

class _UnderScreenState extends State<UnderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Under Screen'),
      ),
      body: Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              'You have pushed the button this many times:',
            ),
            StoreConnector<CountState,int>(
              converter: (store) => store.state.count,
              builder: (context, count) {
                return Text(
                  count.toString(),
                  style: Theme.of(context).textTheme.display1,
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: StoreConnector<CountState,VoidCallback>(

        converter: (store) {
          return () => store.dispatch(Action.increment);
        },
        builder: (context, callback) {
          return FloatingActionButton(
            onPressed: callback,
            child: Icon(Icons.add),
          );
        },
      ),
    );
  }
}