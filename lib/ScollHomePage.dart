import 'package:flutter/material.dart';
import 'package:flutter_2020/ScrollSinglePage.dart';

class ScrollPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('ScrollPage'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          RaisedButton(
            child: Text("跳转Scroll1"),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return ScrollSingle();
              }));
            },
          ),
        ],
      ),
    );
  }
}