import 'package:flutter/material.dart';
import 'dart:developer';
import 'package:shared_preferences/shared_preferences.dart';

class ViewData extends StatefulWidget {
  @override
  State<ViewData> createState() => _ViewDataState();
}

class _ViewDataState extends State<ViewData> {
  List<String> myList = [];
  bool isLoaded = false;

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
        isLoaded = true;

      });
              log("Plze worl" + storedList.toString());

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
              child: ListView(
                children: myList
                    .map(
                      (item) => ListTile(
                        title: Text(item),
                      ),
                    )
                    .toList(),
              ),
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
