import 'package:flutter/material.dart';

void showAlertDialog(BuildContext context,String info) {

  showDialog(
      context: context,
      builder: (_) => new AlertDialog(
          title: new Text("提示"),
          content: new Text(info),
          actions:<Widget>[
            new FlatButton(child:new Text("OK"), onPressed: (){

              Navigator.of(context).pop();
              if(info.contains("注册成功")) {
                Navigator.pushNamed(context, '/login');
              }
              if(info.contains("登录成功")) {
                Navigator.pushNamed(context, '/home');
              }
            },)
          ]

      ));
}
