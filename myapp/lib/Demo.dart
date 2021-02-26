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

  _save(value) async {
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
/*
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
        title: Text(''),
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
