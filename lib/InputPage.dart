import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  InputPageState createState() => new InputPageState();
}

class InputPageState extends State<InputPage> {

  GlobalKey _formKey= new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('InputPageState'),
      ),
      body: Form(
        key: _formKey,
        autovalidate: true,
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                    hintText: "请输入帐号",
                    labelText: "帐号",
                    prefixIcon: Icon(Icons.account_circle)
                ),
                autofocus: true,
                maxLengthEnforced: true,
                maxLength: 30,
                validator: (value){
                  if(null == value || value.trim().length <= 0){
                    return "帐号不能为空";
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                    hintText: "请输入密码",
                    labelText: "密码",
                    prefixIcon: Icon(Icons.desktop_mac)
                ),
                maxLength: 30,
                maxLengthEnforced: true,
                obscureText: true,
                validator: (value){
                  if(null == value || value.trim().length <= 0){
                    return "密码不能为空";
                  }else if(value.trim().length <= 6){
                    return "密码长度不能低于6位";
                  }
                  return null;
                },
              ),
              Padding(
                padding: EdgeInsets.only(top: 20,bottom: 20),
                child:Row(
                  children: <Widget>[
                    Expanded(
                      child: RaisedButton(
                        color: Colors.blue,
                        textColor: Colors.white,
                        child: Text("登录",style: TextStyle(
                          fontSize: 20
                        ),),
                        onPressed: (){
                          if((_formKey.currentState as FormState).validate()){
                            //验证通过提交数据
                          }
                        },
                        padding: EdgeInsets.all(10),
                      ),
                    )
                  ],
                )
              ),
            ],
          ),
        )
      )
    );
  }
}