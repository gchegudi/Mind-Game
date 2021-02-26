import 'package:flutter/material.dart';

import 'package:flutter_number_picker/flutter_number_picker.dart';
import 'package:numberpicker/numberpicker.dart';

class NumberPickers extends StatefulWidget {
  _NumberPicker createState() => _NumberPicker();
}

class _NumberPicker extends State<NumberPickers> {
  int _currentIntValue = 2;
  double _currentdoubleValue = 1.0;

  NumberPicker integerNumberPicker;
  NumberPicker decimalNumberPicker;

  _handleValueChanged(num value) {
    if (value != null) {
      if (value is int) {
        setState(() => _currentIntValue = value);
      } else {
        setState(() => _currentdoubleValue = value);
      }
    }
  }

  _handleValueChangedExternally(num value) {
    if (value != null) {
      if (value is int) {
        setState(() => _currentIntValue = value);
        // integerNumberPicker.animateInt(value);
      } else {
        setState(() => _currentdoubleValue = value);
        //integerNumberPicker.animateDecimalAndInteger(value);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    integerNumberPicker = new NumberPicker.integer(
      initialValue: _currentIntValue,
      minValue: 2,
      maxValue: 5,
      step: 1,
      onChanged: _handleValueChanged,
    );
    /*
    integerNumberPicker = new NumberPicker.decimal(
      initialValue: _currentIntValue,
      minValue: 1,
      maxValue: 10,
      step: 2,
      onChanged: _handleValueChanged,
    );*/

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            integerNumberPicker,
            Container(
              child: FlatButton(
                child: Text(
                  '',
                  style: TextStyle(fontSize: 20.0),
                ),
                color: Colors.blueAccent,
                textColor: Colors.white,
                onPressed: () {
                  //_showIntegerDialog();
                },
              ),
            ),
            Container(
              child: FlatButton(
                child: Text(
                  '',
                  style: TextStyle(fontSize: 20.0),
                ),
                color: Colors.blueAccent,
                textColor: Colors.white,
                onPressed: () {
                  //_showIntegerDialog();
                },
              ),
            ),
            Container(
              child: FlatButton(
                child: Text(
                  '',
                  style: TextStyle(fontSize: 20.0),
                ),
                color: Colors.blueAccent,
                textColor: Colors.white,
                onPressed: () {
                  _showIntegerDialog();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future _showIntegerDialog() async {
    await showDialog<int>(
      context: context,
      builder: (BuildContext context) {
        return new NumberPickerDialog.integer(
          minValue: 2,
          maxValue: 5,
          step: 1,
          initialIntegerValue: _currentIntValue,
        );
      },
    ).then(_handleValueChangedExternally);
  }
}
/*
List<int> list = [
  2,
  3,
  4,
  5,
  6,
];*/
/*
class NumberPicker extends StatefulWidget {
  @override
  _NumberPicker createState() => _NumberPicker();
}

class _NumberPicker extends State<NumberPicker> {
  // Platform messages are asynchronous, so we initialize in an async method.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plutter number picker'),
        ),
        body: Center(
          child: Container(
            child: CustomNumberPicker(
              initialValue: 4,
              maxValue: 10,
              minValue: 2,
              step: 1,
              onValue: (value) {
                print(value.toString());
              },
            ),
          ),
        ),
      ),
    );
  }
}*/
