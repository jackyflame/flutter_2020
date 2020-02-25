import 'package:flutter/material.dart';

class TabPage extends StatefulWidget {
  @override
  TabPageState createState() => new TabPageState();
}

class TabPageState extends State<TabPage> with SingleTickerProviderStateMixin {
  int _currentBNBIndex = 0;
  TabController _tabController;
  List tabsList = ["新闻", "历史", "图片"];

  @override
  void initState() {
    super.initState();
    print("initState >>>");
    _tabController = TabController(length: tabsList.length, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_tabController == null) {
      print("_tabController is null");
      _tabController = TabController(length: tabsList.length, vsync: this);
    } else {
      print("_tabController is ok");
    }
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Tab页'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {
              print("Appbar share click!");
            },
          )
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs: tabsList.map((e) => Tab(text: e)).toList(),
        ),
      ),
      drawer: new MyDrawer(),

//      bottomNavigationBar: BottomNavigationBar(
//        items: <BottomNavigationBarItem>[
//          BottomNavigationBarItem(
//              icon: Icon(Icons.account_balance), title: Text("首页")),
//          BottomNavigationBarItem(icon: Icon(Icons.comment), title: Text("消息")),
//          BottomNavigationBarItem(
//              icon: Icon(Icons.account_circle), title: Text("个人")),
//        ],
//        currentIndex: _currentBNBIndex,
//        onTap: _onBNBTap,
//      ),

      bottomNavigationBar: BottomAppBar(
        color: Colors.lightBlue,
        shape: CircularNotchedRectangle(),
        child: Row(
          children: <Widget>[
            IconButton(icon: Icon(Icons.account_balance)),
            SizedBox(),
            IconButton(icon: Icon(Icons.account_box))
          ],
          mainAxisAlignment: MainAxisAlignment.spaceAround,
        ),
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _floatTap,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      body: TabBarView(
        controller: _tabController,
        children: tabsList.map((e) {
          return Container(
            alignment: Alignment.center,
            child: Text(e),
          );
        }).toList(),
      ),
    );
  }

  void _onBNBTap(int index) {
    setState(() {
      _currentBNBIndex = index;
    });
  }

  void _floatTap() {
    print("_floatTap");
  }
}

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Drawer(
      child: MediaQuery.removePadding(
          context: context,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: ClipOval(
                          child: Image.asset(
                            "lib/imgs/icon_2.png",
                            width: 80,
                          ),
                        ),
                      ),
                      Text(
                        "测试员",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  )),
              Expanded(
                child: ListView(
                  children: <Widget>[
                    ListTile(title: Text("menu1"),leading: Icon(Icons.assignment_late),),
                    ListTile(title: Text("menu2"),leading: Icon(Icons.assignment_ind),),
                    ListTile(title: Text("menu3"),leading: Icon(Icons.assignment_returned),),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
