import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class ListViewPage1 extends StatefulWidget {
  @override
  ListViewPage1State createState() => new ListViewPage1State();
}

class ListViewPage1State extends State<ListViewPage1> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('ListViewPage1'),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            child: Text("ITEM-1"),
            padding: EdgeInsets.all(15),
          ),
          Padding(
            child: Text("ITEM-2"),
            padding: EdgeInsets.all(15),
          ),
          Padding(
            child: Text("ITEM-3"),
            padding: EdgeInsets.all(15),
          ),
          Padding(
            child: Text("ITEM-4"),
            padding: EdgeInsets.all(15),
          ),
        ],
      ),
    );
  }
}

class ListViewPage2 extends StatefulWidget {
  @override
  ListViewPage2State createState() => new ListViewPage2State();
}

class ListViewPage2State extends State<ListViewPage2> {
  //下划线widget预定义以供复用。
  Widget divider1 = Divider(
    color: Colors.blue,
  );
  Widget divider2 = Divider(color: Colors.green);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('ListViewPage2'),
      ),
      body:
//      ListView.builder(
//          itemCount: 20,
//          itemExtent: 50,
//          itemBuilder: (BuildContext context, int index){
//            return ListTile(title: Text("title-$index"),subtitle: Text("subtitle-$index"),);
//          },
//      ),
        ListView.separated(
          itemCount: 20,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text("title-$index"),
              subtitle: Text("subtitle-$index"),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return index % 2 == 0 ? divider1 : divider2;
          },
        ),
    );
  }
}

class InfinityListView extends StatefulWidget {
  @override
  InfinityListViewState createState() => new InfinityListViewState();
}

class InfinityListViewState extends State<InfinityListView> {

  static const diver = Divider(color: Colors.green,);
  static const loadingTag = "##loading##"; //表尾标记
  var _words = <String>[loadingTag];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('InfinityListView'),
      ),
      body: Column(
        children: <Widget>[
          ListTile(title: Text("列表头"),),
          Expanded(
            child: ListView.separated(
              itemCount: _words.length,
              itemBuilder: (BuildContext context,int index){
                if(_words[index] == loadingTag){
                  if(_words.length < 100){
                    //加载数据
                    _loadingData();
                    //返回加载中
                    return Container(
                      padding: EdgeInsets.all(16),
                      alignment: Alignment.center,
                      //child: Text("加载中...",style: TextStyle(color: Colors.green),),
                      child: SizedBox(
                          width: 24.0,
                          height: 24.0,
                          child: CircularProgressIndicator(strokeWidth: 2.0)
                      ),
                    );
                  }else{
                    return Container(
                      padding: EdgeInsets.all(16),
                      alignment: Alignment.center,
                      child: Text("没有更多数据了",style: TextStyle(color: Colors.amber),),
                    );
                  }
                }
                //显示单词列表项
                return ListTile(title: Text(_words[index]));
              },
              separatorBuilder: (BuildContext context,int index){
                return diver;
              },
            )
          )
        ],
      ),
    );
  }

  void _loadingData(){
    Future.delayed(Duration(seconds: 3)).then(
        (e){
          _words.insertAll(_words.length - 1,
              //每次生成20个单词
              generateWordPairs().take(20).map((e) => e.asPascalCase).toList()
          );
          setState(() {
            //刷新列表
          });
        }
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadingData();
  }
}
