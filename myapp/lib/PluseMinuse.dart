import 'package:flutter/material.dart';

import 'package:number_inc_dec/number_inc_dec.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TextForm extends StatefulWidget {
  @override
  _TextState createState() => _TextState();
}

class _TextState extends State<TextForm> {
  int i = 1;

  // final myController = TextEditingController();

  void initState() {
    super.initState();
    getValue('Saved Value').then((value) => i = value);
  }

  Widget build(BuildContext context) {
    return Material(
        child: Scaffold(
            appBar: AppBar(),
            body: Column(children: <Widget>[
              Container(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(20),
                        child: Text(
                          i.toString(),
                          style: TextStyle(fontSize: 40),
                        ),
                      ),
                      new SizedBox(
                          width: 100,
                          height: 40,
                          child: RaisedButton(
                            color: Colors.black,
                            textColor: Colors.white,
                            child: Text(
                              'Pluse',
                            ),
                            onPressed: () {
                              setState(() {
                                i++;
                              });
                              saveValue('Saved Value', i);
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0))),
                          )),
                      new SizedBox(
                          width: 100,
                          height: 40,
                          child: RaisedButton(
                            color: Colors.black,
                            textColor: Colors.white,
                            child: Text(
                              'Minus',
                            ),
                            onPressed: () {
                              setState(() {
                                i--;
                              });
                              saveValue('Saved Value', i);
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0))),
                          ))
                    ]),
              )
            ])));
  }

  Future<int> getValue(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var number = prefs.getInt(key) ?? 0;
    return number;
  }

  Future<void> saveValue(String key, int value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(key, value);
  }
}

_getNumberOfDigits() {
  return Container(
      child: NumberInputWithIncrementDecrement(
    controller: TextEditingController(),
    min: 2,
    initialValue: 3,
    max: 6,
    numberFieldDecoration: InputDecoration(
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide(color: Colors.orange, width: 5.0),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
    ),
    incIcon: Icons.add,
    incIconSize: 40,
    decIcon: Icons.remove,
    decIconSize: 40,
  ));
}

/*
class ListTileItem extends StatefulWidget {
  String title;
  ListTileItem({this.title});
  @override
  _ListTileItemState createState() => new _ListTileItemState();
}

class _ListTileItemState extends State<ListTileItem> {
  int _itemCount = 0;
  @override
  Widget build(BuildContext context) {
    return new ListTile(
      title: new Text(widget.title),
      trailing: new Row(
        children: <Widget>[
          _itemCount != 0
              ? new IconButton(
                  icon: new Icon(Icons.remove),
                  onPressed: () => setState(() => _itemCount--),
                )
              : new Container(),
          new Text(_itemCount.toString()),
          new IconButton(
              icon: new Icon(Icons.add),
              onPressed: () => setState(() => _itemCount++))
        ],
      ),
    );
  }
}



  _getList(){
    return new Scaffold(
      body: new ListView(
        children: new List.generate(
            5,
            (i) => new ListTileItem(
                  title: "Item#$i",
                )),
      ),
    );
  }

*/
/*
class NumberCountDemo extends StatefulWidget {
  @override
  __NumberCountDemoState createState() => __NumberCountDemoState();
}

class __NumberCountDemoState extends State<NumberCountDemo> {
  int _n = 0;
  void add() {
    setState(() {
      _n++;
    });
  }

  void minus() {
    setState(() {
      if (_n != 0) _n--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(title: new Text("Number Count")),
        body: Center(
            child: Column(children: [
          Container(
            child: new Center(
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  new Text('$_n', style: new TextStyle(fontSize: 60.0)),
                  new FloatingActionButton(
                    onPressed: add,
                    child: new Icon(
                      Icons.add,
                      color: Colors.black,
                    ),
                    backgroundColor: Colors.white,
                  ),
                  new FloatingActionButton(
                    onPressed: minus,
                    child: new Icon(Icons.remove, color: Colors.black),
                    backgroundColor: Colors.white,
                  ),
                ],
              ),
            ),
          ),
          Container(
            child: new Center(
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  new Text('$_n', style: new TextStyle(fontSize: 60.0)),
                  new FloatingActionButton(
                    onPressed: add,
                    child: new Icon(
                      Icons.add,
                      color: Colors.black,
                    ),
                    backgroundColor: Colors.white,
                  ),
                  new FloatingActionButton(
                    onPressed: minus,
                    child: new Icon(Icons.remove, color: Colors.black),
                    backgroundColor: Colors.white,
                  ),
                ],
              ),
            ),
          ),
        ])));
  }
}
class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;

  void _incrementCount() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCount() {
    setState(() => _counter--);
  }

  void _resetCount() {
    setState(() => _counter = 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Count Value"),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.display1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 0),
                      child: RaisedButton(
                        child: Text(
                          "Increment Counter",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: _incrementCount,
                        color: Colors.green[400],
                      ),
                    ),
                  ),
                  Container(
                    child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: RaisedButton(
                          child: Text(
                            "Decrement Counter",
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: _decrementCount,
                          color: Colors.red,
                        )),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _resetCount,
        tooltip: 'increment',
        child: Icon(Icons.refresh),
      ),
    );
  }
}*/
