import 'package:flutter/material.dart';
import 'dart:developer';

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
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Enter your username',
                ),
              ),
              Text("Robot Team Name")
            ],
          ),
        )

        //body: ListView(),

        );
  }
}
