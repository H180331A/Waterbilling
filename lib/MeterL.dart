import 'package:flutter/material.dart';
import 'package:flutter_water/services/api.dart';

class Readings extends StatefulWidget {
  @override
  _ReadingsState createState() => _ReadingsState();
}

class _ReadingsState extends State<Readings> {
  Api _api = new Api();
  List<Map<String, dynamic>> values = [
    {
      "accountName": "Mberi",
      "accountNo": "23",
      "isChecked": false,
    },
    {
      "accountName": "Mberi",
      "accountNo": "23",
      "isChecked": false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Meter Readings'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'Routes',
                    style: TextStyle(fontSize: 20, color: Colors.blueAccent),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'Select',
                    style: TextStyle(fontSize: 20, color: Colors.blueAccent),
                  ),
                ),
              ],
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.7,
              child: Container(
                child: FutureBuilder(
                  future: _api.fetchRoutes(),
                  builder: (context, snapshot) {
                    while (!snapshot.hasData) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    var data = snapshot.data;
                    print(data);
                    return ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        return CheckboxListTile(
                          title: Text("eee"),
                          value: false,
                          onChanged: null,
                        );
                      },
                      // itemCount: 50,
                    );
                  },
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  decoration: BoxDecoration(color: Colors.blue),
                  child: MaterialButton(
                    onPressed: () {},
                    child: Text(
                      'Load',
                      style: TextStyle(fontSize: 23.0, color: Colors.black),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(color: Colors.blue),
                  child: MaterialButton(
                    onPressed: () {},
                    child: Text(
                      'Cancel',
                      style: TextStyle(fontSize: 23.0, color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(
      new MaterialApp(home: new Readings(), debugShowCheckedModeBanner: false));
}
