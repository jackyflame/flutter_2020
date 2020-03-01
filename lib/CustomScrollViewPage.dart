import 'package:flutter/material.dart';

class CustomScrollViewPage extends StatefulWidget {
  @override
  CustomScrollViewState createState() => new CustomScrollViewState();
}

class CustomScrollViewState extends State<CustomScrollViewPage> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          pinned: true,
          expandedHeight: 250,
          flexibleSpace: FlexibleSpaceBar(
            title: Text("CustomScrollViewPage"),
            background: Image.asset("./lib/imgs/title_bg.jpg",fit: BoxFit.cover,),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.all(16),
          sliver: SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 4
            ),
            delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
                //创建子widget
                return new Container(
                  alignment: Alignment.center,
                  color: Colors.cyan[100 * (index % 9)],
                  child: new Text('grid item $index',style: TextStyle(fontSize: 16)),
                );
              },
              childCount: 20,
            ),
          ),
        ),
        SliverFixedExtentList(
          itemExtent: 50,
          delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
                //创建列表项
                return new Container(
                  alignment: Alignment.center,
                  color: Colors.lightBlue[100 * (index % 9)],
                  child: new Text('list item $index',style: TextStyle(fontSize: 16),),
                );
              },
              childCount: 50 //50个列表项
          ),
        )
      ],
    );
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
}