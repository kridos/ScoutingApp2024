import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:developer';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/widgets.dart';

class AddData extends StatefulWidget {
  @override
  State<AddData> createState() => _AddDataState();
}

//Robot Team Number
//Robot Team Name
//Where do they intake from (Ground -> Both, Source only)?
//Where can their robot outtake (Amp, Speaker, Both)?
//How many notes do they score in teleOp?
//Preferred Auto Starting Position
//Where do they score in Auto (Speaker, Amp, Both)?
//What is the max amount of notes they can score in the amp in auto?
//What is the max amount of notes they can score in the speaker in auto?
//Type of play (Offensive/Defensive)?
//Where do they score in teleOp primarily?
//Where do they prefer their human player to be (Amp -> spotlighting experience, Source, Either)
//Can they Climb?
//Approx amt of time needed to climb (for adjusting their bot at stage and actually climbing)?
//Can they harmonize?
//Can they score trap?

class _AddDataState extends State<AddData> {
  String intake = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
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
              ),
              Text("Robot Team Name"),
              TextFormField(
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Enter the Team Name',
                ),
              ),
              Text("Where do they intake from?"),
              DropdownSearch<String>(
                items: const [
                  'Ground (can Intake from Source and Ground)',
                  'Source only Intake'
                ],
                onChanged: (value) {
                  setState(() {
                    intake = value.toString();
                  });
                },
              ),
            ],
          ),
        )

        //body: ListView(),

        );
  }
}
