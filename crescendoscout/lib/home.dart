import 'package:crescendoscout/adddata.dart';
import 'package:crescendoscout/viewdata.dart';
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.blue // Grey when not pressed
              ),
              child: TextButton(
                onPressed: () {
                  setState(() {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              AddData(),
                        ),
                      );
                  });
                },
                child: Text(
                  "Scout New Team",
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.blue, // Grey when not pressed
              ),
              child: TextButton(
                onPressed: () {
                  setState(() {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ViewData(),
                        ),
                      );
                  });
                },
                child: Text(
                  "View Team Data",
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
      
      //body: ListView(),
     
    );
  }
}
