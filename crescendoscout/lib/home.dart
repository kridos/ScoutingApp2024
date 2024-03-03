import 'package:flutter/material.dart';
import 'dart:developer';

class MyHomePage extends StatefulWidget {
  final String comp;

  const MyHomePage(
    Key key,
    this.comp,
  ) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
      extendBody: true,
      appBar: AppBar(),
      body: Container(
        child: Text(widget.comp),
      ),
      
      //body: ListView(),
     
    );
  }
}
