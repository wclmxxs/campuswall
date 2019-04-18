import 'package:flutter/material.dart';
import './login.dart';
import './index/msg.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: new MyHomePage(),
      title: '首页',
      routes: {
        '/home' : (BuildContext context) =>MyHomePage(),
        '/login' : (BuildContext context) => LoginPage(),
        '/register' : (BuildContext context) => RegisterPage(),
      },

      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>{
  int _selectedIndex = 2;//当前选中项的索引
  /*final _widgetOptions = [
    Text('Index 0: 信息'),
    Text('Index 1: 通讯录'),
    Text('Index 2: 校园'),
    Text('Index 3: 个人'),
  ];*/

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: getAppBar(context, _selectedIndex),

      body: getColumn(context, _selectedIndex),
      //底部导航按钮 包含图标及文本
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.chat), title: Text('信息')),
          BottomNavigationBarItem(icon: Icon(Icons.contacts), title: Text('通讯录')),
          BottomNavigationBarItem(icon: Icon(Icons.navigation), title: Text('校园')),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle), title: Text('个人')),
        ],
        currentIndex: _selectedIndex,//当前选中项的索引
        fixedColor: Colors.deepPurple,//选项中项的颜色
        type: BottomNavigationBarType.fixed,
        onTap: _onItemTapped,//选择按下处理
      ),
    );
  }

  //选择按下处理 设置当前索引为index值
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}



