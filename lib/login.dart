import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:campus_wall/info.dart';
import 'dart:async';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  //全局Key用来获取Form表单组件
  GlobalKey<FormState> loginKey = new GlobalKey<FormState>();

  String phone;
  //密码
  String password;

  void login() {
    //读取当前的Form状态
    var loginForm = loginKey.currentState;

    //验证Form表单
    if (loginForm.validate()) {
      loginForm.save();

        const url = 'http://49.140.1.201/Login.php';
        http.post(url,body: { 'pwd': password, 'phone':phone}).then((response){
          if(response.body.contains('3'))
          {
            showAlertDialog(context,"数据库连接失败");
          }
          if(response.body.contains('0'))
          {
            showAlertDialog(context, "手机号或者密码错误");
          }
          if(response.body.contains('1'))
          {
            showAlertDialog(context,"登录成功");
          }

        });


    }
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: '登录页面',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('登录页面'),
        ),
        body: new Column(
          children: <Widget>[
            new Container(
              padding: const EdgeInsets.all(16.0),
              child: new Form(
                key: loginKey,
                child: new Column(
                  children: <Widget>[

                    new TextFormField(
                      decoration: new InputDecoration(
                        labelText: '请输入手机号码',
                      ),
                      //验证表单方法
                      validator: (value) {
                        for(String chars in value.split(''))
                        {
                          Set<String> num = {'0','1','2','3','5','4','6','7','8','9'};
                          if(!num.contains(chars))
                          {
                            return "手机号码只能为数字";
                          }
                        }
                        return value.length != 11 ? "手机号码不为11位" : null;
                      },
                      onSaved: (value) {
                       phone = value;
                      },
                    ),
                    new TextFormField(
                      decoration: new InputDecoration(
                        labelText: '请输入密码',
                      ),
                      obscureText: true,
                      //验证表单方法
                      validator: (value) {
                        return value.length < 6 ? "密码长度不够6位" : null;
                      },
                      onSaved: (value) {
                        password = value;
                      },
                    ),
                  ],
                ),
              ),
            ),
            new SizedBox(
              width: 340.0,
              height: 42.0,
              child: new RaisedButton(
                onPressed: login,
                child: new Text(
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
    );
  }
}

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => new _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  //全局Key用来获取Form表单组件
  GlobalKey<FormState> registerKey = new GlobalKey<FormState>();

  //用户名
  String userName;

  String phone;
  //密码
  String password;

  String code;

  String code1;
  void register() {
    //读取当前的Form状态
    var registerForm = registerKey.currentState;

    //验证Form表单
    if (registerForm.validate()) {
      registerForm.save();
      if(code != code1)
        {
          showAlertDialog(context,"验证码错误");
          return;
        }
      const url = 'http://49.140.1.201/Register.php';
      http.post(url,body: {'name': userName, 'pwd': password, 'phone':phone}).then((response){
        if(response.body.contains('3'))
        {
          showAlertDialog(context,"数据库连接失败");
        }
        if(response.body.contains('0'))
        {
          showAlertDialog(context, "该手机号码已经被使用");
        }
        if(response.body.contains('1'))
          {
            showAlertDialog(context,"注册成功,请前往登录");
          }

      });

    }
  }

  String info = "获取验证码";
  void second()
  {
    int time = 60;
    
    new Timer.periodic(const Duration(seconds: 1), (timer)
    {
      setState(() {
        time--;
      });
      if(time == 0)
        {
          info = "获取验证码";
          timer.cancel();
          return;
        }
        else
          {
            info = time.toString() + "s可重获取";
          }
    });
  }
  
  
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: '注册页面',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('注册页面'),
        ),
        body: new Column(
          children: <Widget>[
            new Container(
              padding: const EdgeInsets.all(16.0),
              child: new Form(
                key: registerKey,
                child: new Column(
                  children: <Widget>[
                    new TextFormField(

                      decoration: new InputDecoration(
                        labelText: '请输入手机号码',
                      ),
                      //验证表单方法
                      validator: (value) {
                        phone = value;
                        for(String chars in value.split(''))
                        {
                          Set<String> num = {'0','1','2','3','5','4','6','7','8','9'};
                          if(!num.contains(chars))
                          {
                            return "手机号码只能为数字";
                          }
                        }
                        return value.length != 11 ? "手机号码不为11位" : null;
                      },


                      onSaved: (value) {
                        phone = value;
                      },

                    ),

                    

                    new TextFormField(

                      decoration: new InputDecoration(
                        labelText: '请输入用户名',
                      ),
                      onSaved: (value) {
                        userName = value;
                      },
                      validator: (value) {
                        return value.length < 3 ? "用户名长度不够3位" : null;
                      },
                      onFieldSubmitted: (value){

                      },
                    ),
                    new TextFormField(
                      decoration: new InputDecoration(
                        labelText: '请输入密码',
                      ),
                      obscureText: true,
                      //验证表单方法
                      validator: (value) {
                        password = value;
                        return value.length < 6 ? "密码长度不够6位" : null;
                      },
                      onSaved: (value) {
                        password = value;
                      },
                    ),
                    new TextFormField(
                      decoration: new InputDecoration(
                        labelText: '请确认密码',
                      ),
                      obscureText: true,
                      //验证表单方法
                      validator: (value) {
                        return value != password? "密码与前面的不符" : null;
                      },
                    ),
                    new Row(
                        children: <Widget>[
                          new Expanded(
                            child:
                            new TextFormField(

                              decoration: new InputDecoration(
                                labelText: '请输入验证码',
                              ),
                              //验证表单方法
                              validator: (value) {
                                for(String chars in value.split(''))
                                {
                                  Set<String> num = {'0','1','2','3','5','4','6','7','8','9'};
                                  if(!num.contains(chars))
                                  {
                                    return "验证码只能为数字";
                                  }
                                }
                                return value.length != 4 ? "验证码不为4位" : null;
                              },
                              onSaved: (value) {
                                code1 = value;
                              },

                            ),

                          ),
                          new SizedBox(
                            height: 50.0,
                            width: 120.0,
                            child: new RaisedButton(onPressed: (){
                              register();
                              if(phone == null||phone.length!=11) {
                                showAlertDialog(context,"请先填写11位手机号码");
                                return;
                              }
                              http.post(

                                  'http://49.140.1.201/sendmsg.php',

                                  body: {"phone": phone}).then((response){
                                code = response.body;
                                print(code);
                              });
                              second();

                            },

                              child: Text(info),
                            ),

                          ),
                        ]
                    ),
                  ],
                ),
              ),
            ),
            new SizedBox(
              width: 340.0,
              height: 42.0,
              child: new RaisedButton(
                onPressed: register,
                child: new Text(
                  '注册',
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
