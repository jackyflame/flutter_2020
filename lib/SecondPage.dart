import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SecondPage extends StatelessWidget {
  var param = "";

  SecondPage({Key keyChild, this.param}) : super(key: keyChild);

  @override
  Widget build(BuildContext context) {

    // 生成随机字符串
    final wordPair = new WordPair.random();

    return new Scaffold(
      appBar: new AppBar(
        title: new Text('第二个页面'),
      ),
      body: Column(
        children: <Widget>[
          Text("点击返回带参数:$param"),
          Text("随机单词:$wordPair"),
          RaisedButton(
            child: Text("返回"),
            onPressed: () {
              Navigator.pop(context, "这是SecondPage的返回值！");
            },
          ),
          RaisedButton(
            child: Text("jump404"),
            onPressed: () {
              Navigator.pushNamed(context, "test");
            },
          ),
        ],
      ),
    );
  }
}
