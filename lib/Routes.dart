import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_water/Home_Page.dart';
import 'package:flutter_water/db_test.dart';
import 'package:flutter_water/models/reading.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Routes extends StatefulWidget {
  @override
  _RoutesState createState() => _RoutesState();
}

class _RoutesState extends State<Routes> {
  TextEditingController accountNameController = TextEditingController();
  TextEditingController accountNoController = TextEditingController();
  TextEditingController modelController = TextEditingController();
  TextEditingController previousReadingController = TextEditingController();
  TextEditingController meterNumberController = TextEditingController();
  TextEditingController currentReadingController = TextEditingController();
  TextEditingController homeAddressController = TextEditingController();

  var dbData;
  get handleClick => null;
  Helperx _helper = new Helperx();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          PopupMenuButton<String>(
            onSelected: handleClick,
            itemBuilder: (BuildContext context) {
              return {'Logout', 'Back'}.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
        ],
        centerTitle: true,
        title: Text('ROUTE SELECTED'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.7,
                          decoration: BoxDecoration(
                            color: Colors.blue.withOpacity(0.1),
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: TextFormField(
                              controller: meterNumberController,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                labelText: "Meter Number",
                              ),
                              keyboardType: TextInputType.number,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: Container(
                            color: Colors.blue,
                            child: MaterialButton(
                              child: Text(
                                "Lookup",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              onPressed: () async {
                                var dbData =
                                    await _helper.getSavedAccountsData();
                                var lookedUpItem = dbData
                                    .where((element) =>
                                        element["meter_number"] ==
                                        meterNumberController.text)
                                    .toList();
                                print(lookedUpItem);
                                if (lookedUpItem != null ||
                                    lookedUpItem.length > 0) {
                                  setState(() {
                                    accountNoController.text =
                                        lookedUpItem[0]["account_number"];
                                    accountNameController.text =
                                        lookedUpItem[0]["name"];
                                    homeAddressController.text =
                                        "${lookedUpItem[0]["house_number"]}, ${lookedUpItem[0]["street_name"]}, ${lookedUpItem[0]["area"]}";
                                    modelController.text =
                                        lookedUpItem[0]["model"];
                                    previousReadingController.text =
                                        lookedUpItem[0]["reading"];
                                  });
                                }
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(color: Colors.blue),
                      child: MaterialButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => HomePage(),
                            ),
                          );
                        },
                        child: Text(
                          'Go',
                          style: TextStyle(fontSize: 23.0, color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 3.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blue.withOpacity(0.1),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: TextFormField(
                        controller: accountNoController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          labelText: "Account no",
                        ),
                        readOnly: true,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blue.withOpacity(0.1),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: TextFormField(
                        controller: accountNameController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          labelText: "Account name",
                        ),
                        readOnly: true,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blue.withOpacity(0.1),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: TextFormField(
                        controller: homeAddressController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          labelText: "Home address",
                        ),
                        readOnly: true,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blue.withOpacity(0.1),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: TextFormField(
                        controller: previousreadingController,
                        enabled: false,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          labelText: "Previous reading",
                        ),
                        readOnly: true,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blue.withOpacity(0.1),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: TextFormField(
                        controller: previousReadingController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          labelText: "Current reading",
                        ),
                        readOnly: true,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blue.withOpacity(0.1),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: TextFormField(
                        controller: unitsController,
                        enabled: false
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          labelText: "Units",
                        ),
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      decoration: BoxDecoration(color: Colors.blue),
                      child: MaterialButton(
                        onPressed: () async {
                          var helper = new Helperx();
                          var reading = new Reading(
                            id: 6,
                            accountname: accountNameController.text,
                            accountno: accountNoController.text,
                            model: modelController.text,
                            currentreading: currentReadingController.text,
                            previousreading: previousReadingController.text,
                            homeaddress: homeAddressController.text,
                          );
                          var isSaved = await helper.saveReading(reading);
                          print(isSaved);
                          if (isSaved != null) {
                            // var snackBar = SnackBar(
                            //   content: Text("Route saved"),
                            // );
                            // Scaffold.of(context).showSnackBar(snackBar);
                            // print("data saved");
                            Fluttertoast.showToast(
                                msg: "This is Center Short Toast",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.red,
                                textColor: Colors.blue,
                                fontSize: 16.0);
                          } else {
                            // var snackBar = SnackBar(
                            //   content: Text("Error. Check code"),
                            //   backgroundColor: Colors.red,
                            // );
                            // Scaffold.of(context).showSnackBar(snackBar);
                            print("data not saved");
                          }
                        },
                        child: Text(
                          'Save',
                          style: TextStyle(fontSize: 23.0, color: Colors.black),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(color: Colors.blue),
                      child: MaterialButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => HomePage(),
                            ),
                          );
                        },
                        child: Text(
                          'Cancel',
                          style: TextStyle(fontSize: 23.0, color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
