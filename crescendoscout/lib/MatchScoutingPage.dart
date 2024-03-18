
import 'package:crescendoscout/sendMatchData.dart';
import 'package:crescendoscout/addMatchData.dart';
import 'package:crescendoscout/viewMatchData.dart';
import 'package:flutter/material.dart';
import 'dart:developer';
import 'package:shared_preferences/shared_preferences.dart';

class MatchScoutingPage extends StatefulWidget {
  final String comp;

  const MatchScoutingPage(
    Key key,
    this.comp,
  ) : super(key: key);

  @override
  State<MatchScoutingPage> createState() => _MatchScoutingPageState();
}

class _MatchScoutingPageState extends State<MatchScoutingPage> {
  Future<void> removeSpecificData(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
  }

  Future<void> saveDataStringList(String key, List<String> values) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(key, values);
  }

  Future<List<String>?> readDataStringList(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(key);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(),
      body: Column(children: <Widget>[
        Row(
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
                        builder: (context) => AddMatchData(),
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
                        builder: (context) => ViewMatchData(),
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
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
                        builder: (context) => SendMatchData(),
                      ),
                    );
                  });
                },
                child: Text(
                  "Send Team Data",
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
                onPressed: () async {
                  

                   List<String>? tempTeamList =
                      await readDataStringList("teams");

                  if (tempTeamList != null) {
                    for(int i = 0; i < tempTeamList.length; i++){
                      removeSpecificData(tempTeamList[i]);
                    }
                  }

                  saveDataStringList("teams", []);
                },
                child: Text(
                  "Clear All Data",
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ]),

      //body: ListView(),
    );
  }
}
