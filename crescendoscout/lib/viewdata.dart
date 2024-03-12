import 'package:flutter/material.dart';
import 'dart:developer';
import 'package:shared_preferences/shared_preferences.dart';

class ViewData extends StatefulWidget {
  @override
  State<ViewData> createState() => _ViewDataState();
}

class _ViewDataState extends State<ViewData> {
  List<String> myList = []; // Initialize an empty list

  @override
  void initState() {
    super.initState();
    _fetchDataFromSharedPreferences();
  }

  void _fetchDataFromSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    final storedList = prefs.getStringList('teams');
    if (storedList != null) {
      setState(() {
        myList = storedList;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(),
      body: Container(
          child: ListView.builder(
        itemCount: myList.length,
        itemBuilder: (context, index) {
          final String item = myList[index];
          return ListTile(
            title: Text(item),
          );
        },
      )),

      //body: ListView(),
    );
  }
}
