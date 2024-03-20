
import 'package:crescendoscout/home.dart';
import 'package:crescendoscout/MatchScoutingPage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PitMatchChoice extends StatefulWidget {
  final String comp;
  final Key theKey;
  const PitMatchChoice(
    Key key,
    this.theKey,
    this.comp,
    
  ) : super(key: key);
  
  @override
  State<PitMatchChoice> createState() => _PitMatchChoiceState();
}

class _PitMatchChoiceState extends State<PitMatchChoice> {
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
                        builder: (context) => MyHomePage(widget.theKey, widget.comp),
                      ),
                    );
                  });
                },
                child: Text(
                  "Pit Scouting",
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
                        builder: (context) => MatchScoutingPage(widget.theKey, widget.comp),
                      ),
                    );
                  });
                },
                child: Text(
                  "Match Scouting",
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
