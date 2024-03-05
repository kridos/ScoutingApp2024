import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'dart:developer';
import 'package:crescendoscout/home.dart';

class Setup extends StatefulWidget {
  @override
  State<Setup> createState() => SetupState();
}

class SetupState extends State<Setup> {
  String otherAllergen = '';
  String selectedItem = "";
  String competition = '';
  final myController = TextEditingController();
  bool _isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(),
      body: Container(
        color: const Color.fromARGB(255, 70, 70, 70),
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Spacer(flex: 4),
            Container(
              //padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
              decoration: const BoxDecoration(
                color:
                    Colors.white, // Replace with your desired background color
              ),
              child: DropdownSearch<String>(
                items: const [
                  'Week 1',
                  'Week 2',
                  'Week 3',
                  'Week 4',
                  'District Champs',
                  'Worlds',
                  'Other'
                ],
                onChanged: (value) {
                  setState(() {
                    selectedItem = value.toString();
                    if (selectedItem == "Other") {
                      competition = '';
                    }
                    _isVisible = _isWeekSelected(selectedItem);
                  });
                },
              ),
            ),
            Visibility(
              visible: _isVisible,
              child: ToggleWidget(
                week: selectedItem,
                updateCompetition: (newCompetition) {
                  setState(() {
                    competition = newCompetition;
                  });
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  if (selectedItem == "Other" && competition == '') {
                    _showInputDialog(); // Call the function to show the dialog
                  } else {
                    if (selectedItem == "Other") {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              MyHomePage(UniqueKey(), competition),
                        ),
                      );
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MyHomePage(
                              UniqueKey(),
                              selectedItem.contains("Week")
                                  ? "$selectedItem - $competition"
                                  : selectedItem),
                        ),
                      );
                    }
                  }
                });
              },
              child: const Text('Next'),
            ),
            const Spacer(flex: 4),
            Visibility(
              visible: _isVisible,
              child: TextField(
                controller: myController,
                onChanged: (value) {
                  setState(() {});
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool _isWeekSelected(String selectedItem) {
    if (selectedItem == "Week 1") {
      competition = "Clackamas Academy";
    } else if (selectedItem == "Week 2") {
      competition = "Oregon State Fairgrounds";
    } else if (selectedItem == "Week 3") {
      competition = "SunDome";
    } else if (selectedItem == "Week 4") {
      competition = "Wilsonville";
    }
    return selectedItem.startsWith('Week');
  }

  void _showInputDialog() {
    TextEditingController _competitionController = TextEditingController();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Enter competition name'),
          content: TextField(
            controller: _competitionController,
            decoration: InputDecoration(hintText: 'Competition name'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
                // Handle competition name here (e.g., update variable)
                setState(() {
                  competition = _competitionController
                      .text; // Update competition variable
                });
              },
              child: Text('Submit'),
            ),
            TextButton(
              onPressed: () =>
                  Navigator.pop(context), // Close the dialog without saving
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }
}

class ToggleWidget extends StatefulWidget {
  final String week;
  final Function(String) updateCompetition;

  const ToggleWidget(
      {Key? key, required this.week, required this.updateCompetition})
      : super(key: key);

  @override
  _ToggleWidgetState createState() => _ToggleWidgetState();
}

class _ToggleWidgetState extends State<ToggleWidget> {
  bool _isButtonOnePressed = false;
  bool _isButtonTwoPressed = false;

  @override
  Widget build(BuildContext context) {
    String firstOption = '';
    String secondOption = '';

    switch (widget.week) {
      case 'Week 1':
        firstOption = 'Clackamas Academy';
        secondOption = 'Glacier Peak';
        break;
      case 'Week 2':
        firstOption = 'Oregon State Fairgrounds';
        secondOption = 'Auburn';
        break;
      case 'Week 3':
        firstOption = 'SunDome';
        secondOption = 'Bonney Lake';
        break;
      case 'Week 4':
        firstOption = 'Wilsonville';
        secondOption = 'Sammamish';
        break;
      default:
        // For other weeks or default case
        firstOption = 'Option 1';
        secondOption = 'Option 2';
    }

    return Center(
      child: Visibility(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: _isButtonOnePressed
                    ? Colors.blue
                    : Colors.grey, // Grey when not pressed
              ),
              child: TextButton(
                onPressed: () {
                  setState(() {
                    _isButtonOnePressed = true;
                    _isButtonTwoPressed = false;
                    widget.updateCompetition(firstOption);
                  });
                },
                child: Text(
                  firstOption,
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
                color: _isButtonTwoPressed
                    ? Colors.blue
                    : Colors.grey, // Grey when not pressed
              ),
              child: TextButton(
                onPressed: () {
                  setState(() {
                    _isButtonOnePressed = false;
                    _isButtonTwoPressed = true;
                    widget.updateCompetition(secondOption);
                  });
                },
                child: Text(
                  secondOption,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MyKey {
  const MyKey();
}
