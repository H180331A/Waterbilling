import 'package:dropdownfield/dropdownfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_water/History.dart';
import 'package:flutter_water/Routes.dart';
import 'package:flutter_water/login.dart';
import 'package:flutter_water/routes_page.dart';
import 'package:flutter_water/saved.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  get handleClick => (value) {
        switch (value) {
          case "History":
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => History(),
              ),
            );
            break;
          case "Saved Routes":
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => SavedRoutes(),
              ),
            );
            break;
          case "Routes":
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => RoutesPage(),
              ),
            );
            break;
          case "Back":
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => LoginPage()),
            );
            break;
        }
      };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          PopupMenuButton<String>(
            onSelected: handleClick,
            itemBuilder: (BuildContext context) {
              return {'History', 'Saved Routes', 'Routes', 'Back'}
                  .map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
        ],
        centerTitle: true,
        title: Text('Mutare Water Billing'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.search),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => Routes(),
            ),
          );
        },
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                'assets/background.png',
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Column(children: [
                  // Text('Mutare City Water Billing',
                  //     style: TextStyle(
                  //         color: Colors.blue[800],
                  //         fontWeight: FontWeight.bold,
                  //         fontSize: 30)),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Image.asset(
                      'assets/images.png',
                      height: 215,
                      width: 250,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    color: Colors.blue,
                    child: DropDownField(
                      controller: routesSelected,
                      hintText: 'Select Route',
                      enabled: true,
                      value: selectRoute,
                      items: routes,
                      onValueChanged: (value) {
                        setState(
                          () {
                            selectRoute = value;
                          },
                        );
                      },
                    ),
                  ),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

String selectRoute = '';

final routesSelected = TextEditingController();

List<String> routes = [
  'Route A',
  'Route B',
  'Route C',
];
