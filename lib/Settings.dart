import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  TextEditingController ipaddressController = TextEditingController();
  TextEditingController portController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Mutare City Council'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              child: TextField(
                controller: ipaddressController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'IP Address',
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: TextField(
                controller: portController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Port',
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(color: Colors.blue),
              child: MaterialButton(
                onPressed: () {},
                child: Text(
                  'Save',
                  style: TextStyle(fontSize: 23.0, color: Colors.black),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
