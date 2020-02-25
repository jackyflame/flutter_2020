import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('页面不存在'),
      ),
      body: Center(
        child: Text("页面不存在！！！"),
      ),
    );
  }
}