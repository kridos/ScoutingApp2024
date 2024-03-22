
import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

class AddMatchData extends StatefulWidget {
  @override
  State<AddMatchData> createState() => _AddMatchDataState();
}



class _AddMatchDataState extends State<AddMatchData> {
  //Need to actually get data from the textformfield inputs and store it
  TextEditingController qualificationNumber = TextEditingController();
  TextEditingController team1NumberController = TextEditingController();
  TextEditingController team2NumberController = TextEditingController();
  TextEditingController team3NumberController = TextEditingController();
  TextEditingController autoAmpNotes = TextEditingController();
  TextEditingController autoSpeakerNotes = TextEditingController();
  TextEditingController extraAutoInfo = TextEditingController();
  TextEditingController extraTeleopInfo = TextEditingController();
  TextEditingController teleopAmpNotes = TextEditingController();
  TextEditingController teleopSpeakerNotes = TextEditingController();
  
  String allianceColor = "Red";
  String trapped = "false";
  String team1Harmonize = "false";
  String team2Harmonize = "false";
  String team3Harmonize = "false";
  String team1Climb = "false";
  String team2Climb = "false";
  String team3Climb = "false";
  

  Future<void> saveDataString(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }

  Future<void> saveDataStringList(String key, List<String> values) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(key, values);
    log("Prior saved data${values.toString()}");
  }

  Future<String?> readData(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  Future<List<String>?> readDataStringList(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(key);
  }
  void _incrementValue(TextEditingController cont) {
    int currentValue = int.tryParse(cont.text) ?? 0;
    cont.text = (currentValue + 1).toString();
  }

  void _decrementValue(TextEditingController cont) {
    int currentValue = int.tryParse(cont.text) ?? 0;
    if (currentValue > 0) {
      cont.text = (currentValue - 1).toString();
    }
  }
// team1 DONE
// team2 DONE
// team3 DONE
// ampAuto DONE
//SpeakerAuto DONE
// AmpTele DONE
// SpeakerTele DONE
// DidTrap(Boolean, true if there was one in the match) DONE
//team1harmonize Done
//team2harmonize Done
//team3harmonize(all boolean, only yes if 2nd robot on chain) Need to do this parantheses part other wise DONE
//didClimb1 Done
//didClimb2 Done
//didClimb3(Boolean) Done
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
                //Intaking
              Text("Scouting Red or Blue Alliance?"),
              Row(
                
                children: [
                  Radio(
                    value: "Red",
                    groupValue: allianceColor, // Assign the string value here
                    onChanged: (value) => setState(() => allianceColor = value ?? ""),
                  ),
                  Text('Red'),
                ],
              ),

              Row(
                
                children: [
                  Radio(
                    value: "Blue",
                    groupValue: allianceColor, // Assign the string value here
                    onChanged: (value) => setState(() => allianceColor = value ?? ""),
                  ),
                  Text('Blue'),
                ],
              ),
              //Team Number
              Text("Qualification Match Number"),
              TextFormField(
                maxLength: 2,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Qualification Match Number',
                ),
                controller: qualificationNumber,
              ),
              //Team Number
              Text("Team 1 number"),
              TextFormField(
                maxLength: 5,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Enter the Team Number',
                ),
                controller: team1NumberController,
              ),
               //Team Number
              Text("Team 2 number"),
              TextFormField(
                maxLength: 5,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Enter the Team Number',
                ),
                controller: team2NumberController,
              ),
               //Team Number
              Text("Team 3 number"),
              TextFormField(
                maxLength: 5,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Enter the Team Number',
                ),
                controller: team3NumberController,
              ),

              
              //Intaking
              Text("How many Auto notes scored in Amp"),
             TextFormField(
                maxLength: 2,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Number of Amp Auto Notes',
                ),
                controller: autoAmpNotes,
              ),
              Row(
                
                children: [
                  TextButton(
                    onPressed: () => _decrementValue(autoAmpNotes),
                    style: TextButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 162, 213, 255), // Set button color
                      textStyle: TextStyle(color: Colors.green),
                    ),
                    child: Text("-"),
                  ),
                  SizedBox(width: 10), // Add spacing between buttons
                  TextButton(
                    onPressed: () => _incrementValue(autoAmpNotes),
                    style: TextButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 162, 213, 255), // Set button color
                    textStyle: TextStyle(color: Colors.green),
      
                  ),
                    child: Text("+"),
                  ),
                ],
              ),
                //Intaking
              Text("How many Auto notes scored in Speaker"),
             TextFormField(
                maxLength: 2,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Number of Speaker Auto Notes',
                ),
                controller: autoSpeakerNotes,
              ),
             
              Row(
                
                children: [
                  TextButton(
                    onPressed: () => _decrementValue(autoSpeakerNotes),
                    style: TextButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 162, 213, 255), // Set button color
                      textStyle: TextStyle(color: Colors.green),
                    ),
                    child: Text("-"),
                  ),
                  SizedBox(width: 10), // Add spacing between buttons
                  TextButton(
                    onPressed: () => _incrementValue(autoSpeakerNotes),
                    style: TextButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 162, 213, 255), // Set button color
                    textStyle: TextStyle(color: Colors.green),
      
                  ),
                    child: Text("+"),
                  ),
                ],
              ),
            Text("Extra Auto period info.(Did anything significant happen, e.g. robot didnt do anything, or robot failed to score most of their shots)"),
              TextFormField(
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Enter the Team Number with what happened',
                ),
                controller: extraAutoInfo,
              ),
              //Intaking
              Text("How many Teleop notes scored in Amp"),
             TextFormField(
                maxLength: 2,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Number of Amp Teleop Notes',
                ),
                controller: teleopAmpNotes,
              ),
              Row(
                
                children: [
                  TextButton(
                    onPressed: () => _decrementValue(teleopAmpNotes),
                    style: TextButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 162, 213, 255), // Set button color
                      textStyle: TextStyle(color: Colors.green),
                    ),
                    child: Text("-"),
                  ),
                  SizedBox(width: 10), // Add spacing between buttons
                  TextButton(
                    onPressed: () => _incrementValue(teleopAmpNotes),
                    style: TextButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 162, 213, 255), // Set button color
                    textStyle: TextStyle(color: Colors.green),
      
                  ),
                    child: Text("+"),
                  ),
                ],
              ),
                //Intaking
              Text("How many Teleop notes scored in Speaker"),
             TextFormField(
                maxLength: 2,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Number of Speaker Teleop Notes',
                ),
                controller: teleopSpeakerNotes,
              ),
              Row(
                
                children: [
                  TextButton(
                    onPressed: () => _decrementValue(teleopSpeakerNotes),
                    style: TextButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 162, 213, 255), // Set button color
                      textStyle: TextStyle(color: Colors.green),
                    ),
                    child: Text("-"),
                  ),
                  SizedBox(width: 10), // Add spacing between buttons
                  TextButton(
                    onPressed: () => _incrementValue(teleopSpeakerNotes),
                    style: TextButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 162, 213, 255), // Set button color
                    textStyle: TextStyle(color: Colors.green),
      
                  ),
                    child: Text("+"),
                  ),
                ],
              ),

              //Trapping
              Text("Trapping Ability"),
              Row(
                
                children: [
                  Radio(
                    
                    value: "True",
                    groupValue: trapped, // Assign the string value here
                    onChanged: (value) => setState(() => trapped = value ?? ""),
                    
                  ),
                  Text('True'),
                  
                  
                ],
                
              ),
              

              Row(
                
                children: [
                  Radio(
                    value: "False",
                    groupValue: trapped, // Assign the string value here
                    onChanged: (value) => setState(() => trapped = value ?? ""),
                  ),
                  Text('False'),
                ],
              ),

              //Harmonizing
              Text("Harmonizing(>1 robot on a single chain)(Mark the second robot to get on one chain as true, all the others false, otherwise mark everything as false)"),
              Row(

                children: [
                  Text("Team1 ${team1NumberController.text}"),
                  Radio(
                    value: "True",
                    groupValue: team1Harmonize, // Assign the string value here
                    onChanged: (value) => setState(() => team1Harmonize = value ?? ""),
                  ),
                  Text("True"),
                  Radio(
                    value: "False",
                    groupValue: team1Harmonize, // Assign the string value here
                    onChanged: (value) => setState(() => team1Harmonize = value ?? ""),
                  ),
                  Text("False"),
                  
                ],
              ),
               Row(

                children: [
                  Text("Team2 ${team2NumberController.text}"),
                  Radio(
                    value: "True",
                    groupValue: team2Harmonize, // Assign the string value here
                    onChanged: (value) => setState(() => team2Harmonize = value ?? ""),
                  ),
                  Text("True"),
                  Radio(
                    value: "False",
                    groupValue: team2Harmonize, // Assign the string value here
                    onChanged: (value) => setState(() => team2Harmonize = value ?? ""),
                  ),
                  Text("False"),
                  
                ],
              ),
               Row(

                children: [
                  Text("Team3 ${team3NumberController.text}"),
                  Radio(
                    value: "True",
                    groupValue: team3Harmonize, // Assign the string value here
                    onChanged: (value) => setState(() => (team3Harmonize = value ?? "")),
                  ),
                  Text("True"),
                  Radio(
                    value: "False",
                    groupValue: team3Harmonize, // Assign the string value here
                    onChanged: (value) => setState(() => team3Harmonize = value ?? ""),
                  ),
                  Text("False"),
                  
                ],
              ),

              //Climbing
              Text("Did the Robots climb"),
              Row(

                children: [
                  Text("Team1 ${team1NumberController.text}"),
                  Radio(
                    value: "True",
                    groupValue: team1Climb, // Assign the string value here
                    onChanged: (value) => setState(() => team1Climb = value ?? ""),
                  ),
                  Text("True"),
                  Radio(
                    value: "False",
                    groupValue: team1Climb, // Assign the string value here
                    onChanged: (value) => setState(() => team1Climb = value ?? ""),
                  ),
                  Text("False"),
                  
                ],
              ),
               Row(

                children: [
                  Text("Team2 ${team2NumberController.text}"),
                  Radio(
                    value: "True",
                    groupValue: team2Climb, // Assign the string value here
                    onChanged: (value) => setState(() => team2Climb = value ?? ""),
                  ),
                  Text("True"),
                  Radio(
                    value: "False",
                    groupValue: team2Climb, // Assign the string value here
                    onChanged: (value) => setState(() => team2Climb = value ?? ""),
                  ),
                  Text("False"),
                  
                ],
              ),
               Row(

                children: [
                  Text("Team3 ${team3NumberController.text}"),
                  Radio(
                    value: "True",
                    groupValue: team3Climb, // Assign the string value here
                    onChanged: (value) => setState(() => team3Climb = value ?? ""),
                  ),
                  Text("True"),
                  Radio(
                    value: "False",
                    groupValue: team3Climb, // Assign the string value here
                    onChanged: (value) => setState(() => team3Climb = value ?? ""),
                  ),
                  Text("False"),
                  
                ],
              ),
              Text("Extra Teleop Information e.g. did a robot carry the whole match"),
              TextFormField(
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Enter the Team Number with what happened',
                ),
                controller: extraTeleopInfo,
              ),

              ElevatedButton(
                onPressed: () async {
                  List<String>? tempTeamList =
                      await readDataStringList("matchteams");
                  if (tempTeamList != null) {
                    tempTeamList.add(qualificationNumber.text);
                    saveDataStringList("matchteams", tempTeamList);                  
                  } else {
                    List<String> teamList = [qualificationNumber.text];
                    saveDataStringList("matchteams", teamList);
                    // Handle the case where data retrieval failed (e.g., print an error message)
                    log("Returned Null");
                  }

                  String team1NumController = team1NumberController.text;
                  String team2NumController = team2NumberController.text;
                  String team3NumController = team3NumberController.text;
                  String autoAmpNote = autoAmpNotes.text;
                  String autoSpeakerNote = autoSpeakerNotes.text;
                  String teleopAmpNote = teleopAmpNotes.text;
                  String teleopSpeakerNote = teleopSpeakerNotes.text;

                  if(team1NumController == "" || team1NumController == null){
                    team1NumController = "0";
                  }
                  if(team2NumController == "" || team2NumController == null){
                    team2NumController = "0";
                  } 
                  if(team3NumController == "" ||team3NumController == null){
                    team3NumController = "0";
                  }
                  if(autoAmpNote == "" ||autoAmpNote ==null){
                    autoAmpNote = "0";
                  }
                  if(autoSpeakerNote == "" || autoSpeakerNote == null){
                    autoSpeakerNote = "0";
                  }
                  if(teleopAmpNote == "" || teleopAmpNote == null){
                    teleopAmpNote = "0";
                  }
                  if(teleopSpeakerNote == "" || teleopSpeakerNote == null){
                    teleopSpeakerNote = "0";
                  }
                  List<String> teamStats = [
                    team1NumController,
                    team2NumController,
                    team3NumController,
                    autoAmpNote,
                    autoSpeakerNote,
                    (extraAutoInfo.text == "" || extraAutoInfo.text == null) ? "No info given" : extraAutoInfo.text,
                    teleopAmpNote,
                    teleopSpeakerNote,
                    trapped,
                    team1Harmonize,
                    team2Harmonize,
                    team3Harmonize,
                    team1Climb,
                    team2Climb,
                    team3Climb,
                    (extraTeleopInfo.text == "" || extraTeleopInfo.text == null) ? "No info given" : extraTeleopInfo.text,

                  ];
                  log(teamStats.toString());
                  saveDataStringList("${qualificationNumber.text}", teamStats);

                  // ignore: use_build_context_synchronously
                  Navigator.pop(context);
                },
                child: const Text('Save Team Data'),
              ),
            ],
          ),
        ));
        
  }
}
