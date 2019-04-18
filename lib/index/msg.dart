import 'package:flutter/material.dart';
Column getColumn(BuildContext context,int _selectedIndex)
{
  if(_selectedIndex == 3) {
    return new Column(
        children: <Widget>[
          RaisedButton(

            onPressed: () {
              Navigator.pushNamed(context, '/login');
            },
            child: Text(
              '点击登录',
              style: TextStyle(fontSize: 28.0),
            ),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/register');
            },
            child: Text(
              '点击注册',

              style: TextStyle(fontSize: 28.0),
            ),
          ),
        ]
    );
  }
  else
  {
    return new Column(
        children: <Widget>[
          RaisedButton(

            onPressed: () {
              Navigator.pushNamed(context, '/login');
            },
            child: Text(
              '点击登录',
              style: TextStyle(fontSize: 28.0),
            ),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/register');
            },
            child: Text(
              '点击注册',

              style: TextStyle(fontSize: 28.0),
            ),
          ),
        ]
    );
  }
}

AppBar getAppBar(BuildContext context,int _selectedIndex)
{
if(_selectedIndex == 0)
  {
    return AppBar(
      title: Text('信息'),
      actions: <Widget>[

        IconButton(
          icon: Icon(Icons.center_focus_weak),
          tooltip: "扫一扫",
          onPressed: ()
          {

          },
        ),
        IconButton(
          icon: Icon(Icons.add),
          tooltip: '发起群聊',
          onPressed: ()
          {

          },
        ),
      ],
    );
  }
if(_selectedIndex == 1)
{
  return AppBar(
    title: Text('通讯录'),
    actions: <Widget>[

      IconButton(
        icon: Icon(Icons.add),
        tooltip: "添加",
        onPressed: ()
        {

        },
      ),
    ],
  );
}
if(_selectedIndex == 2)
{
  return AppBar(
    title: Text('校园'),
    actions: <Widget>[

      IconButton(
        icon: Icon(Icons.settings),
        tooltip: "设置大学",
        onPressed: ()
        {

        },
      ),
    ],
  );
}
if(_selectedIndex == 3)
{
  return AppBar(

    title: Text('个人信息'),
    actions: <Widget>[

      IconButton(
        icon: Icon(Icons.settings),
        tooltip: "博主/账号",
        onPressed: ()
        {

          showMenu(

              context: context,
              position: RelativeRect.fromLTRB(500, 56, 10, 0),
              items: <PopupMenuEntry>[

                new PopupMenuItem(
                    child: new FlatButton(onPressed: (){
                    },
                        child: new Text("注册博主"))
                ),
                new PopupMenuItem(
                    child: new FlatButton(onPressed: (){
                    },
                        child: new Text("发表博文"))
                ),
                new PopupMenuItem(
                    child: new FlatButton(onPressed: (){

        },
                    child: new Text("编辑资料"))
                ),
                new PopupMenuItem(
                  child: new FlatButton(onPressed: (){
                  },
                    child: new Text("申请博主大类"),
                  ),
                ),
                new PopupMenuItem(
                    child: new FlatButton(onPressed: (){

        },             child: new Text("切换账号")
                    )
                ),

              ]);
        },

      ),
    ],
  );
}
}


