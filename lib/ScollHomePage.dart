import 'package:flutter/material.dart';
import 'package:flutter_2020/CustomScrollViewPage.dart';
import 'package:flutter_2020/GridViewPage.dart';
import 'package:flutter_2020/ScrollListViewPage.dart';
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
          RaisedButton(
            child: Text("跳转ListViewPage1"),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return ListViewPage1();
              }));
            },
          ),
          RaisedButton(
            child: Text("跳转ListViewPage2"),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return ListViewPage2();
              }));
            },
          ),
          RaisedButton(
            child: Text("跳转InfinityListView"),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return InfinityListView();
              }));
            },
          ),
          RaisedButton(
            child: Text("跳转GridViewPage"),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return GridViewPage();
              }));
            },
          ),
          RaisedButton(
            child: Text("跳转GridViewPage2"),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return GridViewPage2();
              }));
            },
          ),
          RaisedButton(
            child: Text("跳转InfiniteGridView"),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return InfiniteGridView();
              }));
            },
          ),
          RaisedButton(
            child: Text("跳转CustomScrollViewPage"),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return CustomScrollViewPage();
              }));
            },
          ),
        ],
      ),
    );
  }
}