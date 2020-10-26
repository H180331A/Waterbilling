import 'package:flutter/material.dart';
import 'package:flutter_water/Home_Page.dart';
import 'package:flutter_water/db_test.dart';
import 'package:flutter_water/models/reading.dart';

class History extends StatefulWidget {
  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  TextEditingController meternumberController = TextEditingController();
  TextEditingController accountnoController = TextEditingController();
  TextEditingController statusController = TextEditingController();
  TextEditingController modelController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Meter History'),
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
                  padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 3.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blue.withOpacity(0.1),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
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
                  padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 3.0),
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
                  padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 3.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blue.withOpacity(0.1),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: TextFormField(
                        controller: statusController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          labelText: "Status",
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
                            id: 1,
                            accountno: accountnoController.text,
                            model: modelController.text,
                            meternumber: meternumberController.text,
                            status: statusController.text,
                          );
                          var isSaved = await helper.saveReading(reading);
                          print(isSaved);
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
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Image.asset(
                      'assets/meter.png',
                      height: 215,
                      width: 250,
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
