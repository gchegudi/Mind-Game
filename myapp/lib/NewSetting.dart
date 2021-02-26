import 'package:flutter/material.dart';
//import 'package:flutter/rendering.dart';
import 'package:number_inc_dec/number_inc_dec.dart';

class SelectionNumber extends StatefulWidget {
  @override
  _SelectionNumber createState() => _SelectionNumber();
}

class _SelectionNumber extends State<SelectionNumber> {
  TextEditingController _digitController = TextEditingController();
  TextEditingController _randomController = TextEditingController();
  TextEditingController _displayController = TextEditingController();
  TextEditingController _enterController = TextEditingController();

  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return Material(
        child: Scaffold(
            appBar: AppBar(
              title: Text('Setiing'),
              centerTitle: true,
            ),
            body: Center(
              child: ListView(children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                Container(
                    padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: Text(
                      'You Can change Digits Between 2-6',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    )),
                _digits(),
                SizedBox(
                  height: 20,
                ),
                Container(
                    padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: Text(
                      'You Can change Random Numbers Between 2-10',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    )),
                _randomNumber(),
                SizedBox(
                  height: 20,
                ),
                Container(
                    padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: Text(
                      'You Can change Timer1  UPTO  7-30 Secs',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    )),
                _timeForDisplayNumbers(),
                SizedBox(
                  height: 20,
                ),
                Container(
                    padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: Text(
                      'You Can change Timer2 UPTO 10-30 Secs',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    )),
                _timeForEnterNumbers()
              ]),
            )));
  }

  _digits() {
    return Container(
        child: NumberInputWithIncrementDecrement(
      widgetContainerDecoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          border: Border.all(
            color: Colors.black,
            width: 2,
          )),
      style: TextStyle(
        color: Colors.cyan,
        fontSize: 30,
      ),
      controller: _digitController,
      min: 2,
      initialValue: 3,
      max: 6,
      numberFieldDecoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      incIcon: Icons.add,
      incIconSize: 30,
      decIcon: Icons.remove,
      decIconSize: 30,
    ));
  }

  _randomNumber() {
    return Container(
        child: NumberInputWithIncrementDecrement(
      widgetContainerDecoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          border: Border.all(
            color: Colors.black,
            width: 2,
          )),
      style: TextStyle(
        color: Colors.cyan,
        fontSize: 30,
      ),
      controller: _randomController,
      min: 2,
      initialValue: 3,
      max: 10,
      numberFieldDecoration: InputDecoration(
        fillColor: Colors.cyan,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      incIcon: Icons.add,
      incIconSize: 30,
      decIcon: Icons.remove,
      decIconSize: 30,
    ));
  }

  _timeForDisplayNumbers() {
    return Container(
        child: NumberInputWithIncrementDecrement(
      widgetContainerDecoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          border: Border.all(
            color: Colors.black,
            width: 2,
          )),
      style: TextStyle(
        color: Colors.cyan,
        fontSize: 30,
      ),
      controller: _displayController,
      min: 9,
      initialValue: 9,
      max: 30,
      numberFieldDecoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      incIcon: Icons.add,
      incIconSize: 30,
      decIcon: Icons.remove,
      decIconSize: 30,
    ));
  }

  _timeForEnterNumbers() {
    return Container(
        child: NumberInputWithIncrementDecrement(
      widgetContainerDecoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          border: Border.all(
            color: Colors.black,
            width: 2,
          )),
      style: TextStyle(
        color: Colors.cyan,
        fontSize: 30,
      ),
      controller: _enterController,
      min: 10,
      initialValue: 10,
      max: 30,
      numberFieldDecoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      incIcon: Icons.add,
      incIconSize: 30,
      decIcon: Icons.remove,
      decIconSize: 30,
    ));
  }
}
