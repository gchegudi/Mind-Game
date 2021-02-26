import 'package:flutter/material.dart';

class DropDown extends StatefulWidget {
  @override
  _DropDown createState() => _DropDown();
}

class _DropDown extends State<DropDown> {
  List<int> _randomNumbers = [2, 3, 4, 5, 6];
  List<int> _typesOfRandomNumbers = [2, 3, 4, 5, 6, 7, 8, 9, 10];
  var _timeRequidForDisply = [
    '7 secs',
    '9 secs',
    '12 secs',
    '15 secs',
    '18 secs'
  ];
  var _timeRequidForEnter = [
    '10 secs',
    '15secs',
    '20 secs',
    '25 secs',
    '30 secs'
  ];
  int _currentValue = 2;
  int _currentValue1 = 2;
  var _currentValue2 = '7 secs';
  var _currentValue3 = '10 secs';

  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('Setting'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              child: Column(
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    width: 400,
                    height: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        color: Colors.blueAccent,
                        border: Border.all()),
                    padding: EdgeInsets.fromLTRB(30, 10, 10, 0),
                    child: DropdownButton<int>(
                      items: _randomNumbers.map((int dropDownStringItem) {
                        return DropdownMenuItem<int>(
                          value: dropDownStringItem,
                          child: Text('You Chose is $dropDownStringItem,'),
                        );
                      }).toList(),
                      onChanged: (int newValueSeleted) {
                        setState(() {
                          this._currentValue = newValueSeleted;
                        });
                      },
                      value: _currentValue,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: Column(
                children: [
                  Container(
                    width: 400,
                    height: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        color: Colors.blueAccent,
                        border: Border.all()),
                    padding: EdgeInsets.fromLTRB(30, 10, 10, 0),
                    child: DropdownButton<int>(
                      items:
                          _typesOfRandomNumbers.map((int dropDownStringItem) {
                        return DropdownMenuItem<int>(
                          value: dropDownStringItem,
                          child: Text('You Chose is $dropDownStringItem,'),
                        );
                      }).toList(),
                      onChanged: (int newValueSeleted) {
                        setState(() {
                          this._currentValue1 = newValueSeleted;
                        });
                      },
                      value: _currentValue1,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: Column(
                children: [
                  Container(
                    width: 400,
                    height: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        color: Colors.blueAccent,
                        border: Border.all()),
                    padding: EdgeInsets.fromLTRB(30, 10, 10, 0),
                    child: DropdownButton<String>(
                      items:
                          _timeRequidForDisply.map((String dropDownStringItem) {
                        return DropdownMenuItem<String>(
                          value: dropDownStringItem,
                          child: Text('You Chose is $dropDownStringItem,'),
                        );
                      }).toList(),
                      onChanged: (String newValueSeleted) {
                        setState(() {
                          this._currentValue2 = newValueSeleted;
                        });
                      },
                      value: _currentValue2,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: Column(
                children: [
                  Container(
                    width: 400,
                    height: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        color: Colors.blueAccent,
                        border: Border.all()),
                    padding: EdgeInsets.fromLTRB(30, 10, 10, 0),
                    child: DropdownButton<String>(
                      items:
                          _timeRequidForEnter.map((String dropDownStringItem) {
                        return DropdownMenuItem<String>(
                          value: dropDownStringItem,
                          child: Text('You Chose is $dropDownStringItem,'),
                        );
                      }).toList(),
                      onChanged: (String newValueSeleted) {
                        setState(() {
                          this._currentValue3 = newValueSeleted;
                        });
                      },
                      value: _currentValue3,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
