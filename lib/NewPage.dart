import 'package:flutter/material.dart';

class NewPage extends StatefulWidget {
  @override
  NewPageState createState() => new NewPageState();
}

class NewPageState extends State<NewPage> {

  var rstValue;

  @override
  Widget build(BuildContext context) {
    if(rstValue == null){
      rstValue = ":参数>>"+ModalRoute.of(context).settings.arguments;
    }
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("新页面1"),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(padding: EdgeInsets.all(8),child:Text("新页面$rstValue")),
          RaisedButton(
            child: Text("传参到下一个页面"),
            onPressed: () async {
              var rst = await Navigator.pushNamed(context, "second_page",arguments: "来自NewPage");
              //var rst = await Navigator.push(context, MaterialPageRoute(builder: (context){
              //  return SecondPage(param:"来自NewPage");
              //}));
              //输出`TipRoute`路由返回结果
              print("路由返回值: $rst");
              //刷新
              setState(() {
                rstValue = ":返回值>>$rst";
              });
            },
          ),
          Image.asset("lib/imgs/icon_test.png"),
          Image.asset("lib/imgs/icon_2.png"),
        ],
      ),
    );
  }

}