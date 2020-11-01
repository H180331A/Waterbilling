import 'package:flutter/material.dart';
import 'package:flutter_water/db_test.dart';
import 'package:flutter_water/services/api.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class RoutesPage extends StatefulWidget {
  @override
  _RoutesPageState createState() => _RoutesPageState();
}

class _RoutesPageState extends State<RoutesPage> {
  Api _api = new Api();
  List<String> _selectedData = [];
  Helperx _helper = new Helperx();

  bool _checkIfExists(route) {
    return _selectedData.contains(route);
  }

  bool _isDeleting = false;

  get handleClick => (value) async {
        switch (value) {
          case "Clear Database":
            setState(() {
              _isDeleting = true;
            });
            var _result = await _helper.deleteAccountsData();
            setState(() {
              _isDeleting = false;
            });
            if (_result) {
              print("not deleted");
            } else {
              print("not deleted");
            }
            break;
        }
      };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Load Routes"),
        centerTitle: true,
        actions: <Widget>[
          PopupMenuButton<String>(
            onSelected: handleClick,
            itemBuilder: (BuildContext context) {
              return {'Clear Database'}.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
        ],
      ),
      body: ModalProgressHUD(
        inAsyncCall: _isDeleting,
        child: Builder(
          builder: (context) => Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: [
                FutureBuilder(
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
                          value: _checkIfExists(data[index]["route"]),
                          title: Text("${data[index]["route"]}"),
                          onChanged: (value) {
                            setState(() {
                              if (!_checkIfExists(data[index]["route"])) {
                                _selectedData
                                    .add(data[index]["route"].toString());
                              } else {
                                _selectedData
                                    .remove(data[index]["route"].toString());
                              }
                            });
                          },
                        );
                      },
                    );
                  },
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 20,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.blue,
                      ),
                      width: MediaQuery.of(context).size.width,
                      child: MaterialButton(
                        child: Text(
                          "Fetch Details",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        onPressed: () async {
                          if (_selectedData.length < 1) {
                            var snackBar = SnackBar(
                              content: Text(
                                "Select at least 1 route to continue with fetch",
                              ),
                            );
                            return Scaffold.of(context).showSnackBar(snackBar);
                          } else {
                            var result =
                                await _api.fetchDetailsByRoutes(_selectedData);
                            if (result) {
                              var snackBar = SnackBar(
                                content: Text(
                                  "Data has been fetched",
                                ),
                              );
                              return Scaffold.of(context)
                                  .showSnackBar(snackBar);
                            }
                          }
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
