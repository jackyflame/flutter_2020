import 'package:flutter/material.dart';

class StatePage extends StatefulWidget {
  @override
  StatePageState createState() => new StatePageState();
}

class StatePageState extends State<StatePage> {

  bool _active = false;

  void _handleTap(){
    setState(() {
      _active = !_active;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('StatePageState'),
      ),
      body: GestureDetector(
        onTap: _handleTap,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Center(
                child: Text(
                  _active ? 'Active' : 'Inactive',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                color: _active ? Colors.green:Colors.blue,
              ),
            ),
            MaterialButton(
              textColor: Colors.white,
              color: Colors.deepPurpleAccent,
              child: Text("子母State"),
              onPressed: (){
                Navigator.pushNamed(context, "state2_page");
              },
            )
          ],
        )
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void didUpdateWidget(StatePage oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }
}