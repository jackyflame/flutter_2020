import 'package:flutter/material.dart';

class ParentPage extends StatefulWidget {
  @override
  ParentPageState createState() => new ParentPageState();
}

class ParentPageState extends State<ParentPage> {
  bool _active = false;

  void _handleTap(bool newState) {
    setState(() {
      _active = newState;
      print("_handleTap:$newState");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ParentPageState"),
      ),
      body: TapBoxC(active: _active, onChanged: _handleTap),
    );
  }
}

class TapboxB extends StatelessWidget {
  bool active = false;
  ValueChanged<bool> onChanged;

  TapboxB({Key key, this.active: false, @required this.onChanged})
      : super(key: key);

  void _handleTap() {
    onChanged(!active);
  }

  @override
  Widget build(BuildContext context) {
    print("TapboxB:$active");
    return new GestureDetector(
      onTap: _handleTap,
      child: Container(
        child: Center(
          child: Text(
            active ? "active" : "inActive",
            style: TextStyle(color: Colors.white, fontSize: 30),
          ),
        ),
        width: 200,
        height: 200,
        decoration: BoxDecoration(
          color: active ? Colors.lightBlue : Colors.deepPurpleAccent,
        ),
      ),
    );
  }
}

class TapBoxC extends StatefulWidget {

  final bool active;
  final ValueChanged<bool> onChanged;

  TapBoxC({Key key,this.active, this.onChanged}):super(key:key);

  @override
  TapBoxCState createState() => new TapBoxCState();
}

class TapBoxCState extends State<TapBoxC> {

  bool _highlight = false;

  void _handleTapDown(TapDownDetails details){
    setState(() {
      _highlight = true;
    });
  }

  void _handleTapUp(TapUpDetails details){
    setState(() {
      _highlight = false;
    });
  }

  void _handleTapCancel(){
    setState(() {
      _highlight = false;
    });
  }

  void _handleTap() {
    widget.onChanged(!widget.active);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _handleTapDown,
      onTapUp: _handleTapUp,
      onTapCancel: _handleTapCancel,
      onTap: _handleTap,
      child: Container(
          child: Center(
            child: Text(widget.active?"active":"inActive",
              style: TextStyle(color: Colors.white),),
          ),
          width: 200,
          height: 200,
          decoration: BoxDecoration(
            color: widget.active?Colors.blue:Colors.green,
            border: _highlight?Border.all(color:Colors.red,width: 10):null
          ),
        ),
    );
  }
}