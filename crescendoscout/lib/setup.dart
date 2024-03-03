import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'dart:developer';

class Setup extends StatefulWidget {
  @override
  State<Setup> createState() => SetupState();
}

class SetupState extends State<Setup> {
  String otherAllergen = '';
  String selectedItem = "";
  final myController = TextEditingController();
  bool _isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(),
      body: Container(
        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Spacer(flex: 4),
            Container(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
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
                // popupProps: const PopupPropsMultiSelection.menu(
                //   showSelectedItems: true,
                //   //disabledItemFn: (String s) => s.startsWith('I'),
                // ),
                onChanged: (value) {
                  setState(() {
                    selectedItem = value.toString();
                    _isVisible = _isWeekSelected(selectedItem);
                  });
                },
              ),
            ),
            Visibility(
              visible: _isVisible,
              child: ToggleWidget(week: selectedItem),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _isVisible = true;
                });

                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) =>
                //         MyHomePage(UniqueKey(), selectedItems),
                //   ),
                // );

                //Navigator.pop(context);
              },
              child: const Text('Save Allergens'),
            ),
            const Spacer(flex: 4),
            Visibility(
              visible: _isVisible,
              child: TextField(
                controller: myController,
                onChanged: (value) {
                  setState(() {
                    otherAllergen = value;
                  });
                },
              ),
            ),
            // Visibility(
            //   visible: _isVisible,
            //   child: ElevatedButton(
            //     onPressed: () {
            //       setState(() {
            //         selectedItems.add(otherAllergen);
            //         myController.clear();
            //       });

            //       //Navigator.pop(context);
            //     },
            //     child: const Text('Add New Allergens'),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

bool _isWeekSelected(String selectedItem) {
    return selectedItem.startsWith('Week');
}

class ToggleWidget extends StatefulWidget {
  final String week;

  const ToggleWidget({Key? key, required this.week}) : super(key: key);

  @override
  _ToggleWidgetState createState() => _ToggleWidgetState();
}

class _ToggleWidgetState extends State<ToggleWidget> {
  bool isOn = false;

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
          Expanded(
            child: Text(
              firstOption,
              textAlign: TextAlign.left,
            ),
          ),
          Switch(
            value: isOn,
            onChanged: (newValue) {
              setState(() {
                isOn = newValue;
              });
            },
          ),
          
         Expanded(
            child: Text(
              secondOption,
              textAlign: TextAlign.left,
            ),
          ),
        ],
      ),
    ));
    ;
  }
}

class MyKey {
  const MyKey();
}
