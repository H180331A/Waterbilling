import 'package:flutter/material.dart';
import 'package:flutter_water/services/api.dart';

class RoutesPage extends StatefulWidget {
  @override
  _RoutesPageState createState() => _RoutesPageState();
}

class _RoutesPageState extends State<RoutesPage> {
  Api _api = new Api();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Load Routes"),
        centerTitle: true,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: FutureBuilder(
          future: _api.fetchRoute(),
          builder: (context, snapshot) {
            while (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            var data = snapshot.data["routes"];
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return CheckboxListTile(
                  value: false,
                  title: Text("${data[index]["route"]}"),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
