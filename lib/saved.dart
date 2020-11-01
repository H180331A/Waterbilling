import 'package:flutter/material.dart';
import 'db_test.dart';

class SavedRoutes extends StatefulWidget {
  @override
  _SavedRoutesState createState() => _SavedRoutesState();
}

class _SavedRoutesState extends State<SavedRoutes> {
  Helperx helper = new Helperx();
  var readingsList;

  @override
  void initState() {
    readingsList = helper.getReadingsList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Saved Readings"),
        centerTitle: true,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: FutureBuilder(
          future: readingsList,
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
                  return ListTile(
                    leading: CircleAvatar(
                      child: Icon(Icons.home),
                    ),
                    title: Text(
                      data[index]["accountname"] != null
                          ? "Account Name: ${data[index]["accountname"]}"
                          : "Account Name: Missing value",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle:
                        Text("Account Number ${data[index]["accountno"]}"),
                    trailing: IconButton(
                      onPressed: null,
                      icon: Icon(
                        Icons.send,
                        color: Colors.blue,
                      ),
                    ),
                  );
                });
          },
        ),
      ),
    );
  }
}
