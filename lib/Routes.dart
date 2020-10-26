import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_water/Home_Page.dart';
import 'package:flutter_water/db_test.dart';
import 'package:flutter_water/models/reading.dart';

class Routes extends StatefulWidget {
  @override
  _RoutesState createState() => _RoutesState();
}

class _RoutesState extends State<Routes> {
  TextEditingController accountnameController = TextEditingController();
  TextEditingController accountnoController = TextEditingController();
  TextEditingController modelController = TextEditingController();
  TextEditingController previousreadingController = TextEditingController();
  TextEditingController meternumberController = TextEditingController();
  TextEditingController currentreadingController = TextEditingController();
  TextEditingController homeaddressController = TextEditingController();

  String dropdownValue = "One";

  get handleClick => null;
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
                Center(child: Text("Meter Number")),
                Container(
                  child: Center(
                    child: DropdownButton<String>(
                      value: dropdownValue,
                      icon: Icon(Icons.arrow_downward),
                      iconSize: 24,
                      elevation: 16,
                      style: TextStyle(color: Colors.deepPurple),
                      underline: Container(
                        height: 2,
                        color: Colors.deepPurpleAccent,
                      ),
                      onChanged: (String newValue) {
                        setState(() {
                          dropdownValue = newValue;
                        });
                      },
                      items: <String>['One', 'Two', 'Three', 'Four']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
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
                        controller: accountnoController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          labelText: "Account no",
                        ),
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
                        controller: accountnameController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          labelText: "Account name",
                        ),
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
                        controller: homeaddressController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          labelText: "Home address",
                        ),
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
                        controller: modelController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          labelText: "Model",
                        ),
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
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          labelText: "Previous reading",
                        ),
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
                        controller: currentreadingController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          labelText: "Current reading",
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
                            accountname: accountnameController.text,
                            accountno: accountnoController.text,
                            model: modelController.text,
                            currentreading: currentreadingController.text,
                            previousreading: previousreadingController.text,
                            homeaddress: homeaddressController.text,
                          );
                          var isSaved = await helper.saveReading(reading);
                          print(isSaved);
                          if (isSaved != null) {
                            // var snackBar = SnackBar(
                            //   content: Text("Route saved"),
                            // );
                            // Scaffold.of(context).showSnackBar(snackBar);
                            print("data saved");
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
