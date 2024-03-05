import 'package:flutter/material.dart';
import 'dart:developer';

class ViewData extends StatefulWidget {
  @override
  State<ViewData> createState() => _ViewDataState();
}

class _ViewDataState extends State<ViewData> {
  
  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
      extendBody: true,
      appBar: AppBar(),
      body: Container(
        child: Text('Hi')
      ),
      
      //body: ListView(),
     
    );
  }
}
