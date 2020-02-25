import 'package:flutter/material.dart';

class ScrollSingle extends StatelessWidget {
  
  String letters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
  
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('ScrollBase'),
      ),
      body: Scrollbar(
        child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children:
              letters.split("").map(
                      (e)=>ConstrainedBox(
                        child:Text(e,textScaleFactor: 2.0,),
                        constraints: BoxConstraints(
                          minWidth: double.infinity,
                        ),
                      ),
              ).toList(),
            ),
        ),
      )
    );
  }
}