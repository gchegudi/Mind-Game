import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:shared_preferences/shared_preferences.dart';
/*
class SharedPreferenceDemo extends StatefulWidget {
  SharedPreferenceDemo() : super();

  final String title = "Shared Preference Demo";

  @override
  SharedPreferenceDemoState createState() => SharedPreferenceDemoState();
}

class SharedPreferenceDemoState extends State<SharedPreferenceDemo> {
  //
  String data = "";
  String nameKey = "_key_name";
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    const MethodChannel('plugins.flutter.io/shared_preferences')
        .setMockMethodCallHandler(
      (MethodCall methodcall) async {
        if (methodcall.method == 'getAll') {
          return {"flutter." + nameKey: "[ No Name Saved ]"};
        }
        return null;
      },
    );
    setData();
  }

  Future<bool> saveData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(nameKey, controller.text);
  }

  Future<String> loadData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(nameKey);
  }

  setData() {
    loadData().then((value) {
      setState(() {
        print('Print this $value');
        data = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            TextField(
              controller: controller,
              decoration: InputDecoration.collapsed(hintText: "Enter Name"),
            ),
            OutlineButton(
              child: Text("SAVE NAME"),
              onPressed: () {
                saveData();
              },
            ),
            Text(
              data,
              style: TextStyle(fontSize: 20),
            ),
            OutlineButton(
              child: Text("LOAD NAME"),
              onPressed: () {
                setData();
              },
            ),
          ],
        ),
      ),
    );
  }
}*/

class SharedPreferenceDemo extends StatefulWidget {
  SharedPreferenceDemo() : super();

  final String title = "Shared Preference Demo";

  @override
  SharedPreferenceDemoState createState() => SharedPreferenceDemoState();
}

class SharedPreferenceDemoState extends State<SharedPreferenceDemo> {
  int i = 2;

  @override
  void initState() {
    super.initState();
    _loadCounter();
  }

  //Loading counter value on start
  _loadCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      i = (prefs.getInt('counter') ?? 1);
    });
  }

  //Incrementing counter after click
  _incrementCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      i = (prefs.getInt('counter') ?? i) + 1;
      prefs.setInt('counter', i);
    });
  }

  _decrementCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      i = (prefs.getInt('counter') ?? i) - 1;
      prefs.setInt('counter', i);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Text(
                '$i',
                style: Theme.of(context).textTheme.headline4,
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                  child: RaisedButton(
                color: Colors.black,
                textColor: Colors.white,
                child: Text(
                  'Pluse',
                ),
                onPressed: () {
                  setState(() {
                    _incrementCounter();
                  });
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
              )),
              SizedBox(
                height: 10,
              ),
              Container(
                  child: RaisedButton(
                color: Colors.black,
                textColor: Colors.white,
                child: Text(
                  'Minuse',
                ),
                onPressed: () {
                  setState(() {
                    _decrementCounter();
                  });
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
