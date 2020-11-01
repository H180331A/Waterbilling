import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_water/Home_Page.dart';
import 'package:flutter_water/db_test.dart';
import 'package:flutter_water/models/reading.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Routes extends StatefulWidget {
  @override
  _RoutesState createState() => _RoutesState();
}

class _RoutesState extends State<Routes> {
  TextEditingController accountnameController = TextEditingController();
  TextEditingController accountnoController = TextEditingController();
  TextEditingController unitsController = TextEditingController();
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
                Row(
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 8.0, vertical: 3.0),
                      child: Container(
                        width: 250,
                        decoration: BoxDecoration(
                          color: Colors.blue.withOpacity(0.1),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Container(
                            width: MediaQuery.of(context).size.height,
                            child: TextFormField(
                              controller: meternumberController,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                labelText: "Meter no",
                              ),
                            ),
                          ),
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
                        controller: accountnoController,
                        enabled: false,
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
                        enabled: false,
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
                        enabled: false,
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
                        controller: previousreadingController,
                        enabled: false,
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
                        enabled: false,
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
                            accountname: accountnameController.text,
                            accountno: accountnoController.text,
                            units: unitsController.text,
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
