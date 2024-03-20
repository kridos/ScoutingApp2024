import 'package:flutter/material.dart';
import 'dart:developer';
import 'package:shared_preferences/shared_preferences.dart';

class ViewMatchData extends StatefulWidget {
  @override
  State<ViewMatchData> createState() => _ViewMatchDataState();
}

class _ViewMatchDataState extends State<ViewMatchData> {
  List<String> myList = [];
  bool isLoaded = false;

  @override
  void initState() {
    super.initState();
    _fetchDataFromSharedPreferences();
  }

  void _fetchDataFromSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    final storedList = prefs.getStringList('matchteams');
    if (storedList != null) {
      setState(() {
        myList = storedList;
        isLoaded = true;
      });
    }else{
      log("BEEELLLOOOWWW");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(),
      body: isLoaded
          ? Container(
              child: ListView.builder(
              itemCount: myList.length,
              itemBuilder: (context, index) {
                final String item = myList[index];
                return ListTile(
                  title: Text(item),
                );
              },
            ))
          : Center(child: CircularProgressIndicator()),

      //body: ListView(),
    );
  }
}
