import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:developer';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddData extends StatefulWidget {
  @override
  State<AddData> createState() => _AddDataState();
}

//Robot Team Number - DONE
//Robot Team Name - DONE
//Where do they intake from (Ground -> Both, Source only)? - DONE
//Where can their robot outtake (Amp, Speaker, Both)? - DONE
//How many notes do they score in teleOp? - DONE
//Preferred Auto Starting Position - DONE
//Where do they score in Auto (Speaker, Amp, Both)? - DONE
//What is the max amount of notes they can score in the amp in auto? - DONE
//What is the max amount of notes they can score in the speaker in auto? - DONE
//Type of play (Offensive/Defensive)? - DONE
//Where do they score in teleOp primarily? - DONE
//Where do they prefer their human player to be (Amp -> spotlighting experience, Source, Either) - DONE
//Can they Climb? - DONE
//Approx amt of time needed to climb (for adjusting their bot at stage and actually climbing)? - DONE
//Can they harmonize?
//Can they score trap?

class _AddDataState extends State<AddData> {
  //Need to actually get data from the textformfield inputs and store it
  TextEditingController teamNumberController = TextEditingController();
  TextEditingController teamNameController = TextEditingController();
  TextEditingController autoAmpNotes = TextEditingController();
  TextEditingController autoSpeakerNotes = TextEditingController();
  TextEditingController teleOpScoredNotes = TextEditingController();
  TextEditingController approxClimbTime = TextEditingController();

  String intake = "Source Only";
  String outtake = "Amp";
  String autoPrefStart = "Close to Amp";
  String outtakeAuto = "Amp";
  String typeOfStrat = "Offensive";
  String primaryTeleOpScoreLocation = "Amp";
  String whereHumanPlayer = "Amp";
  String canClimb = "Yes";
  String canHarmonize = "Yes";
  String canTrap = "Yes";

  Future<void> saveDataString(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }

  Future<void> saveDataStringList(String key, List<String> values) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(key, values);
  }

  Future<String?> readData(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
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
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              //Team Number
              Text("Robot Team Number"),
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
                controller: teamNumberController,
              ),

              //Team Name
              Text("Robot Team Name"),
              TextFormField(
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Enter the Team Name',
                ),
                controller: teamNameController,
              ),

              //Intaking
              Text("Where do they intake from?"),
              Row(
                children: [
                  Radio(
                    value: "Source Only",
                    groupValue: intake, // Assign the string value here
                    onChanged: (value) => setState(() => intake = value ?? ""),
                  ),
                  Text('Source Only'),
                ],
              ),

              Row(
                children: [
                  Radio(
                    value: "Ground (Source and Ground)",
                    groupValue: intake, // Assign the string value here
                    onChanged: (value) => setState(() => intake = value ?? ""),
                  ),
                  Text('Ground (Source and Ground)'),
                ],
              ),

              //Outtaking
              Text("Where can their robot outtake?"),
              Row(
                children: [
                  Radio(
                    value: "Amp",
                    groupValue: outtake, // Assign the string value here
                    onChanged: (value) => setState(() => outtake = value ?? ""),
                  ),
                  Text('Amp'),
                ],
              ),

              Row(
                children: [
                  Radio(
                    value: "Speaker",
                    groupValue: outtake, // Assign the string value here
                    onChanged: (value) => setState(() => outtake = value ?? ""),
                  ),
                  Text('Speaker'),
                ],
              ),

              Row(
                children: [
                  Radio(
                    value: "Both (Speaker and Amp)",
                    groupValue: outtake, // Assign the string value here
                    onChanged: (value) => setState(() => outtake = value ?? ""),
                  ),
                  Text('Both (Speaker and Amp)'),
                ],
              ),

              //Preferred Auto Start Position
              Text("Where do they prefer to start in Auto?"),
              Row(
                children: [
                  Radio(
                    value: "Close to Amp",
                    groupValue: autoPrefStart, // Assign the string value here
                    onChanged: (value) => setState(() => autoPrefStart = value ?? ""),
                  ),
                  Text('Close to Amp'),
                ],
              ),

              Row(
                children: [
                  Radio(
                    value: "In front of speaker",
                    groupValue: autoPrefStart, // Assign the string value here
                    onChanged: (value) => setState(() => autoPrefStart = value ?? ""),
                  ),
                  Text('In front of speaker'),
                ],
              ),

              Row(
                children: [
                  Radio(
                    value: "Away from the Amp",
                    groupValue: autoPrefStart, // Assign the string value here
                    onChanged: (value) => setState(() => autoPrefStart = value ?? ""),
                  ),
                  Text('Away from the Amp'),
                ],
              ),

              //Where scoring in Auto
              Text("Where can they score in Auto?"),
              Row(
                children: [
                  Radio(
                    value: "Amp",
                    groupValue: outtakeAuto, // Assign the string value here
                    onChanged: (value) => setState(() => outtakeAuto = value ?? ""),
                  ),
                  Text('Amp'),
                ],
              ),

              Row(
                children: [
                  Radio(
                    value: "Speaker",
                    groupValue: outtakeAuto, // Assign the string value here
                    onChanged: (value) => setState(() => outtakeAuto = value ?? ""),
                  ),
                  Text('Speaker'),
                ],
              ),

              Row(
                children: [
                  Radio(
                    value: "Both (Speaker and Amp)",
                    groupValue: outtakeAuto, // Assign the string value here
                    onChanged: (value) => setState(() => outtakeAuto = value ?? ""),
                  ),
                  Text('Both (Speaker and Amp)'),
                ],
              ),

              //Max Auto Notes in Amp
              Text(
                  "What is the maximum amount of notes they can score in the Amp in Auto?"),
              TextFormField(
                maxLength: 2,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Amp Notes in Auto',
                ),
                controller: autoAmpNotes,
              ),

              //Max Auto Notes in Speaker
              Text(
                  "What is the maximum amount of notes they can score in the Speaker in Auto?"),
              TextFormField(
                maxLength: 2,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Speaker Notes in Auto',
                ),
                controller: autoSpeakerNotes,
              ),

              //Offensive or Defensive Play
              Text(
                  "What type of strategy do they generally use (Offensive/Defensive)?"),
              Row(
                children: [
                  Radio(
                    value: "Offensive",
                    groupValue: typeOfStrat, // Assign the string value here
                    onChanged: (value) => setState(() => typeOfStrat = value ?? ""),
                  ),
                  Text('Offensive'),
                ],
              ),

              Row(
                children: [
                  Radio(
                    value: "Defensive",
                    groupValue: typeOfStrat, // Assign the string value here
                    onChanged: (value) => setState(() => typeOfStrat = value ?? ""),
                  ),
                  Text('Defensive'),
                ],
              ),

              //Primary TeleOp Scoring (not where can they score, but where do they mostly score)
              Text("Where do they score in TeleOp primarily?"),
              Row(
                children: [
                  Radio(
                    value: "Amp",
                    groupValue: primaryTeleOpScoreLocation, // Assign the string value here
                    onChanged: (value) => setState(() => primaryTeleOpScoreLocation = value ?? ""),
                  ),
                  Text('Amp'),
                ],
              ),

              Row(
                children: [
                  Radio(
                    value: "Speaker",
                    groupValue: primaryTeleOpScoreLocation, // Assign the string value here
                    onChanged: (value) => setState(() => primaryTeleOpScoreLocation = value ?? ""),
                  ),
                  Text('Speaker'),
                ],
              ),

              Row(
                children: [
                  Radio(
                    value: "Split",
                    groupValue: primaryTeleOpScoreLocation, // Assign the string value here
                    onChanged: (value) => setState(() => primaryTeleOpScoreLocation = value ?? ""),
                  ),
                  Text('Split'),
                ],
              ),

              //How many notes on average in TeleOp
              Text("How many notes can they score in TeleOp on average?"),
              TextFormField(
                maxLength: 2,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Notes Scored in TeleOp',
                ),
                controller: teleOpScoredNotes,
              ),

              //Where Human Player
              Text("What is their preferred Human Player Placement?"),
              Row(
                children: [
                  Radio(
                    value: "Amp",
                    groupValue: whereHumanPlayer, // Assign the string value here
                    onChanged: (value) => setState(() => whereHumanPlayer = value ?? ""),
                  ),
                  Text('Amp'),
                ],
              ),

              Row(
                children: [
                  Radio(
                    value: "Source",
                    groupValue: whereHumanPlayer, // Assign the string value here
                    onChanged: (value) => setState(() => whereHumanPlayer = value ?? ""),
                  ),
                  Text('Source'),
                ],
              ),

              Row(
                children: [
                  Radio(
                    value: "Any",
                    groupValue: whereHumanPlayer, // Assign the string value here
                    onChanged: (value) => setState(() => whereHumanPlayer = value ?? ""),
                  ),
                  Text('Any'),
                ],
              ),

              //Can Climb
              Text("Can they climb?"),
              Row(
                children: [
                  Radio(
                    value: "Yes",
                    groupValue: canClimb, // Assign the string value here
                    onChanged: (value) => setState(() => canClimb = value ?? ""),
                  ),
                  Text('Yes'),
                ],
              ),

              Row(
                children: [
                  Radio(
                    value: "No",
                    groupValue: canClimb, // Assign the string value here
                    onChanged: (value) => setState(() => canClimb = value ?? ""),
                  ),
                  Text('No'),
                ],
              ),

              //Approx Climb Time
              Text(
                  "What is the approximate amount of time it takes them to climb (if they can climb)?"),
              TextFormField(
                maxLength: 2,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Approx Climb Time',
                ),
                controller: approxClimbTime,
              ),

              //Can Harmonize
              Text("Can they Harmonize?"),
              Row(
                children: [
                  Radio(
                    value: "Yes",
                    groupValue: canHarmonize, // Assign the string value here
                    onChanged: (value) => setState(() => canHarmonize = value ?? ""),
                  ),
                  Text('Yes'),
                ],
              ),

              Row(
                children: [
                  Radio(
                    value: "No",
                    groupValue: canHarmonize, // Assign the string value here
                    onChanged: (value) => setState(() => canHarmonize = value ?? ""),
                  ),
                  Text('No'),
                ],
              ),

              //Can Score Trap
              Text("Can they Score Trap?"),
              Row(
                children: [
                  Radio(
                    value: "Yes",
                    groupValue: canTrap, // Assign the string value here
                    onChanged: (value) => setState(() => canTrap = value ?? ""),
                  ),
                  Text('Yes'),
                ],
              ),

              Row(
                children: [
                  Radio(
                    value: "No",
                    groupValue: canTrap, // Assign the string value here
                    onChanged: (value) => setState(() => canTrap = value ?? ""),
                  ),
                  Text('No'),
                ],
              ),

              ElevatedButton(
                onPressed: () async {
                  List<String>? tempTeamList =
                      await readDataStringList("teams");

                  if (tempTeamList != null) {
                    tempTeamList.add(teamNumberController.text);
                    saveDataStringList("teams", tempTeamList);
                  } else {
                    List<String> teamList = [teamNumberController.text];
                    saveDataStringList("teams", teamList);
                    // Handle the case where data retrieval failed (e.g., print an error message)
                    log("Returned Null");
                  }

                  String autoAmpNotesText = autoAmpNotes.text;
                  String autoSpeakerNotesText = autoSpeakerNotes.text;
                  String teleOpScoredNotesText = teleOpScoredNotes.text;
                  String approxClimbTimeText = approxClimbTime.text;

                  if(autoAmpNotesText == ""){
                    autoAmpNotesText = "0";
                  }

                  if(autoSpeakerNotesText == ""){
                    autoSpeakerNotesText = "0";
                  }

                  if(teleOpScoredNotesText == ""){
                    teleOpScoredNotesText = "0";
                  }

                  if(approxClimbTimeText == ""){
                    approxClimbTimeText = "N/A";
                  }

                  List<String> teamStats = [
                    teamNumberController.text,
                    teamNameController.text,
                    intake,
                    outtake,
                    autoPrefStart,
                    outtakeAuto,
                    autoAmpNotesText,
                    autoSpeakerNotesText,
                    typeOfStrat,
                    primaryTeleOpScoreLocation,
                    teleOpScoredNotesText,
                    whereHumanPlayer,
                    canClimb,
                    approxClimbTimeText,
                    canHarmonize,
                    canTrap
                  ];
                  log(teamStats.toString());
                  saveDataStringList(teamNumberController.text, teamStats);

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
