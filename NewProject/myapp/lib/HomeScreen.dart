/*import 'package:flutter/material.dart';

import 'LogInPage.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Home"),
        actions: <Widget>[
          new IconButton(
              icon: new Icon(Icons.exit_to_app),
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                    new MaterialPageRoute(
                        builder: (BuildContext context) => new LoginPage()),
                    (Route<dynamic> route) => false);
              })
        ],
      ),
      body: new Container(
        alignment: Alignment.center,
        child: new Text(
          "Welcome to flutter.!",
          style: new TextStyle(fontSize: 26.0, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}*/

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Demo extends StatefulWidget {
  @override
  _Demo createState() => _Demo();
}

class _Demo extends State<Demo> {
  TextEditingController saveController = TextEditingController();
  SharedPreferences sharedPreferences;

  bool _name = false;

  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: Column(
          children: <Widget>[
            Container(
              child: Column(children: [
                Container(
                  child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0))),
                      ),
                      controller: saveController),
                ),
                CheckboxListTile(
                  value: _name,
                  onChanged: _save,
                  title: new Text("Remember me"),
                  controlAffinity: ListTileControlAffinity.leading,
                ),
                new Container(
                  decoration: new BoxDecoration(
                      border: Border.all(color: Colors.black)),
                  child: new ListTile(
                    title: new Text(
                      "Press",
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              ]),
            )
          ],
        ),
      ),
    );
  }

  _save(bool value) async {
    sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      _name = value;
      sharedPreferences.setBool("check", _name);
      sharedPreferences.setString("username", saveController.text);

      getCredential();
    });
  }

  getCredential() async {
    sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      _name = sharedPreferences.getBool("check");
      if (_name != null) {
        if (_name) {
          saveController.text = sharedPreferences.getString("username");
        } else {
          saveController.clear();

          sharedPreferences.clear();
        }
      } else {
        _name = false;
      }
    });
  }
}
