import 'package:flutter/material.dart';
import 'package:flutter_water/Home_Page.dart';
import 'package:flutter_water/services/api.dart';

class LoginPage extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<LoginPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  Api _api = new Api();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('MUTARE CITY COUNCIL'),
      ),
      body: Builder(
        builder: (context) => Padding(
          padding: EdgeInsets.all(10),
          child: ListView(
            children: <Widget>[
              // Container(
              //   alignment: Alignment.center,
              //   padding: EdgeInsets.all(10),
              //   child: Text(
              //     'Water Billing ',
              //     style: TextStyle(
              //         color: Colors.blue,
              //         fontWeight: FontWeight.w500,
              //         fontSize: 30),
              //   ),
              // ),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(10),
                child: Text(
                  'Sign in',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'User Name',
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: TextField(
                  obscureText: true,
                  controller: passwordController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                  ),
                ),
              ),
              FlatButton(
                onPressed: () {
                  //forgot password screen
                },
                textColor: Colors.blue,
                child: Text('Forgot Password'),
              ),
              Container(
                height: 50,
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: RaisedButton(
                  textColor: Colors.white,
                  color: Colors.blue,
                  child: Text('Login'),
                  onPressed: () async {
                    var response = await _api.login(
                        nameController.text, passwordController.text);
                    if (response) {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => HomePage(),
                        ),
                      );
                    } else {
                      var snackBar = SnackBar(
                        content: Text("Wrong details or network error"),
                      );
                      Scaffold.of(context).showSnackBar(snackBar);
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
