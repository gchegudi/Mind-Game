import 'package:flutter/material.dart';
import 'package:dropdown_formfield/dropdown_formfield.dart';

class Setting extends StatefulWidget {
  _Setting createState() => _Setting();
}

class _Setting extends State<Setting> {
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text('Settings'),
            ),
            body: Center(
                child: Column(

                    //mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                      width: 200,
                      height: 60,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          color: Colors.blueAccent,
                          border: Border.all()),
                      padding: EdgeInsets.fromLTRB(30, 10, 10, 0),
                      child: DropdownButton<int>(
                        value: _dropdownValue,
                        icon: Icon(Icons.arrow_downward),
                        iconSize: 30,
                        elevation: 10,
                        style: TextStyle(color: Colors.black, fontSize: 15),
                        underline: Container(
                          height: 2,
                        ),
                        onChanged: (number) {
                          setState(() {
                            dropdownValue = number;
                          });
                        },
                        items: <int>[2, 3, 4, 5, 6]
                            .map<DropdownMenuItem<int>>((number) {
                          return DropdownMenuItem<int>(
                            value: number,
                            child: Text('You Chose is $number,'),
                          );
                        }).toList(),
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                      width: 200,
                      height: 60,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          color: Colors.blueAccent,
                          border: Border.all()),
                      padding: EdgeInsets.fromLTRB(30, 10, 10, 0),
                      child: DropdownButton<int>(
                        value: dropdownValue,
                        icon: Icon(Icons.arrow_downward),
                        iconSize: 30,
                        elevation: 10,
                        style: TextStyle(color: Colors.black, fontSize: 15),
                        underline: Container(
                          height: 2,
                        ),
                        onChanged: (number) {
                          setState(() {
                            dropdownValue = number;
                          });
                        },
                        items: <int>[2, 4, 6, 8, 10]
                            .map<DropdownMenuItem<int>>((number) {
                          return DropdownMenuItem<int>(
                            value: number,
                            child: Text('You Chose is $number,'),
                          );
                        }).toList(),
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                      width: 200,
                      height: 60,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          color: Colors.blueAccent,
                          border: Border.all()),
                      padding: EdgeInsets.fromLTRB(30, 10, 10, 0),
                      child: DropdownButton<int>(
                        value: _dropdownValues,
                        icon: Icon(Icons.arrow_downward),
                        iconSize: 30,
                        elevation: 10,
                        style: TextStyle(color: Colors.black, fontSize: 15),
                        underline: Container(
                          height: 2,
                        ),
                        onChanged: (number) {
                          setState(() {
                            dropdownValue = number;
                          });
                        },
                        items: <int>[
                          7,
                          12,
                          15,
                          20,
                          25,
                        ].map<DropdownMenuItem<int>>((number) {
                          return DropdownMenuItem<int>(
                            value: number,
                            child: Text('You Chose is $number,'),
                          );
                        }).toList(),
                      )),
                ]))));
  }
}

/*
 String _myActivity1;

  String _myActivity2;
  String _myActivity3;
  String _myActivity4;
  String _myActivityResult1;
  String _myActivityResult2;
  String _myActivityResult3;
  String _myActivityResult4;

  final formKey = new GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _myActivity1 = '';
    _myActivityResult1 = '';
    _myActivity2 = '';
    _myActivityResult2 = '';
    _myActivity3 = '';
    _myActivityResult3 = '';
    _myActivity4 = '';
    _myActivityResult4 = '';
  }
/*
  _saveForm() {
    var form = formKey.currentState;
    if (form.validate()) {
      form.save();
      setState(() {
        _myActivityResult1 = _myActivity1;
      });
    }
  }

  _saveForm1() {
    var form = formKey.currentState;
    if (form.validate()) {
      form.save();
      setState(() {
        _myActivityResult1 = _myActivity1;
      });
    }
  }

  _saveForm2() {
    var form = formKey.currentState;
    if (form.validate()) {
      form.save();
      setState(() {
        _myActivityResult1 = _myActivity1;
      });
    }
  }

  _saveForm4() {
    var form = formKey.currentState;
    if (form.validate()) {
      form.save();
      setState(() {
        _myActivityResult1 = _myActivity1;
      });
    }
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dropdown Formfield Example'),
      ),
      body: Center(
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                child: DropDownFormField(
                  titleText: 'How Many Random Numbers You Want',

                  value: _myActivity1,
                  onSaved: (value) {
                    setState(() {
                      _myActivity1 = value;
                    });
                  },
                  onChanged: (value) {
                    setState(() {
                      _myActivity1 = value;
                    });
                  }, //dataSource
                  dataSource: [
                    {
                      "display": "2",
                      "value": "2",
                    },
                    {
                      "display": "3",
                      "value": "3",
                    },
                    {
                      "display": "4",
                      "value": "4",
                    },
                    {
                      "display": "5",
                      "value": "5",
                    },
                    {
                      "display": "6",
                      "value": "6",
                    },
                  ],
                  textField: 'display',
                  valueField: 'value',
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: DropDownFormField(
                  titleText: 'Size of Random Numbers',

                  value: _myActivity2,
                  onSaved: (value) {
                    setState(() {
                      _myActivity1 = value;
                    });
                  },
                  onChanged: (value) {
                    setState(() {
                      _myActivity2 = value;
                    });
                  }, //dataSource
                  dataSource: [
                    {
                      "display": "2",
                      "value": "2",
                    },
                    {
                      "display": "3",
                      "value": "3",
                    },
                    {
                      "display": "4",
                      "value": "4",
                    },
                    {
                      "display": "5",
                      "value": "5",
                    },
                    {
                      "display": "6",
                      "value": "6",
                    },
                    {
                      "display": "7",
                      "value": "7",
                    },
                    {
                      "display": "8",
                      "value": "8",
                    },
                    {
                      "display": "9",
                      "value": "9",
                    },
                  ],
                  textField: 'display',
                  valueField: 'value',
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: DropDownFormField(
                  titleText: 'Time Requid to Display',

                  value: _myActivity3,
                  onSaved: (value) {
                    setState(() {
                      _myActivity3 = value;
                    });
                  },
                  onChanged: (value) {
                    setState(() {
                      _myActivity3 = value;
                    });
                  }, //dataSource
                  dataSource: [
                    {
                      "display": "7 secs",
                      "value": "7 secs",
                    },
                    {
                      "display": "9 secs",
                      "value": "9 secs",
                    },
                    {
                      "display": "12 secs",
                      "value": "12 secs",
                    },
                    {
                      "display": "15 secs",
                      "value": "15 secs",
                    },
                    {
                      "display": "20 secs",
                      "value": "20 secs",
                    },
                    {
                      "display": "25 secs",
                      "value": "25 secs",
                    },
                    {
                      "display": "30 secs",
                      "value": "30 secs",
                    },
                  ],
                  textField: 'display',
                  valueField: 'value',
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: DropDownFormField(
                  titleText: 'Time Requid to Enter the Values',

                  value: _myActivity4,
                  onSaved: (value) {
                    setState(() {
                      _myActivity4 = value;
                    });
                  },
                  onChanged: (value) {
                    setState(() {
                      _myActivity4 = value;
                    });
                  }, //dataSource
                  dataSource: [
                    {
                      "display": "10 secs",
                      "value": "10 secs",
                    },
                    {
                      "display": "15 secs",
                      "value": "15 secs",
                    },
                    {
                      "display": "20 secs",
                      "value": "20 secs",
                    },
                    {
                      "display": "25 secs",
                      "value": "25 secs",
                    },
                    {
                      "display": "30 secs",
                      "value": "30 secs",
                    },
                  ],
                  textField: 'display',
                  valueField: 'value',
                ),
              ), /*
              Container(
                padding: EdgeInsets.all(16),
                child: Text(_myActivityResult4),
              ),
              Container(
                padding: EdgeInsets.all(8),
                child: RaisedButton(
                  child: Text('Save'),
                  onPressed: _saveForm,
                ),
              ),
              Container(
                padding: EdgeInsets.all(16),
                child: Text(_myActivityResult2),
              )*/
            ],
          ),
        ),
      ),
    );
  }*/
