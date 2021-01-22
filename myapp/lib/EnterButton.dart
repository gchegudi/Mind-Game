import 'package:flutter/material.dart';
import 'package:myapp/RandomNum.dart';

class EnterButton extends StatefulWidget {
  @override
  _EnterButton createState() => _EnterButton();
}

class _EnterButton extends State<EnterButton> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text('Memory Master'),
          ),
          body: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                Image(
                  image: AssetImage("assets/Images/Master.png"),
                  height: 300,
                  width: 800,
                ),
                Container(
                  height: 60,
                  width: 180,
                  child: RaisedButton(
                    child: Text(
                      'Start Game',
                      style: TextStyle(fontSize: 20),
                    ),
                    color: Colors.lightBlue,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16.0))),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => RandomNum()));
                    },
                  ),
                )
              ]))),
    );
  }
}

/*
 Container(
                  
                  child: RaisedButton(
                    onPressed: () {},
                    textColor: Colors.white,
                    padding: const EdgeInsets.all(0.0),
                    child: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: <Color>[
                            Color(0xFF0D47A1),
                            Color(0xFF1976D2),
                            Color(0xFF42A5F5),
                          ],
                        ),
                      ),
                      padding: const EdgeInsets.all(10.0),
                      child: const Text('Start Game'),
                    ),
                  ),
                )
*/
