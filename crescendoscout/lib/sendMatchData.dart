import 'package:flutter/material.dart';
import 'dart:developer';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:qr_flutter/qr_flutter.dart';

class SendMatchData extends StatefulWidget {
  @override
  State<SendMatchData> createState() => _SendMatchDataState();
}

class _SendMatchDataState extends State<SendMatchData> {
  String selectedItem = "";
  String combinedString = "";
  bool showQrCode = false;
  bool isLoaded = false;
  QrCode qrCode =
  QrCode(4, QrErrorCorrectLevel.L); // Initialize with default data

  List<String> myList = []; // Initialize an empty list

  @override
  void initState() {
    super.initState();
    _fetchDataFromSharedPreferences();
  }

  void _fetchDataFromSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    final storedList = prefs.getStringList('matchteams');
    log("ACcedcsing data ${storedList.toString()}");
    if (storedList != null) {
      setState(() {
        myList = storedList;
        isLoaded = true;
      });
    }else{
      log("null fetDataFromSharedPreferences");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(),
      body: isLoaded
          ? Column(children: <Widget>[
              myList.isNotEmpty
                  ? DropdownSearch<String>(
                      items: myList, // Use retrieved list
                      onChanged: (value) {
                        setState(() {
                          selectedItem = value.toString();
                          log(value.toString());
                        });
                      },
                    )
                  : Text('Loading Teams...'),
              ElevatedButton(
                  onPressed: () async {
                    try {
                      final prefs = await SharedPreferences.getInstance();
                      final storedList = prefs.getStringList(selectedItem);
                      if (storedList != null) {
                        combinedString = storedList.join(",");

                        setState(() {
                          showQrCode = true;
                        });
                      } else {
                        log("Error: No data found for selected item.");
                      }
                    } catch (error) {
                      log("Error generating QR code: ${error.toString()}");
                    }
                  },
                  child: Text("Generate QR Code")),
              Visibility(
                visible: showQrCode,
                child: QrImageView(
                  data: combinedString,
                  version: QrVersions.auto,
                ), // Display QR code when visible
              ),
            ])
          : Center(child: CircularProgressIndicator()),

      //body: ListView(),
    );
  }
}
