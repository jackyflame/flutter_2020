import 'package:flutter/material.dart';

class GridViewPage extends StatefulWidget {
  @override
  GridViewPageState createState() => new GridViewPageState();
}

class GridViewPageState extends State<GridViewPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('GridViewPage'),
      ),
      body: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 1
        ),
        children: <Widget>[
          Icon(Icons.ac_unit),
          Icon(Icons.access_alarm),
          Icon(Icons.accessibility),
          Icon(Icons.accessible_forward),
          Icon(Icons.account_balance_wallet),
          Icon(Icons.add_call),
        ],
      ),
    );
  }
}

class GridViewPage2 extends StatefulWidget {
  @override
  GridViewPage2State createState() => new GridViewPage2State();
}

class GridViewPage2State extends State<GridViewPage2> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('GridViewPage2'),
      ),
      body: GridView(
        padding: EdgeInsets.all(16),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 120,
          childAspectRatio: 2
        ),
        children: <Widget>[
          Icon(Icons.ac_unit),
          Icon(Icons.access_alarm),
          Icon(Icons.accessibility),
          Icon(Icons.accessible_forward),
          Icon(Icons.account_balance_wallet),
          Icon(Icons.add_call),
        ],
      ),
    );
  }
}

class InfiniteGridView extends StatefulWidget {
  @override
  InfiniteGridViewState createState() => new InfiniteGridViewState();
}

class InfiniteGridViewState extends State<InfiniteGridView> {

  List<IconData> _icons = []; //保存Icon数据

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('InfiniteGridView'),
      ),
      body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 1,
            crossAxisCount: 4
          ),
          itemBuilder: (BuildContext context,int index){
            if(index == _icons.length - 1 && _icons.length < 100){
                _loadingData();
            }
            if(_icons.length <= index){
              return Icon(Icons.cached);
            }
            return Icon(_icons[index]);
          }
      ),
    );
  }
  @override
  void initState() {
    super.initState();
    _loadingData();
  }

  void _loadingData(){
    Future.delayed(Duration(milliseconds: 500)).then((e) {
      _icons.addAll([
        Icons.ac_unit,
        Icons.airport_shuttle,
        Icons.all_inclusive,
        Icons.beach_access, Icons.cake,
        Icons.free_breakfast
      ]);
      setState(() {});
    });
  }
}