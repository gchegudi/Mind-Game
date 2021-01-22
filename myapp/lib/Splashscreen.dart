import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
//import 'RandomNum.dart';
import 'dart:math';

class SplashScreen extends StatefulWidget {
  final Color backgroundColor = Colors.lightBlue;
  final TextStyle styleTextUnderTheLoader = TextStyle(
      fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.black);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final splashDelay = 5;

  @override
  void initState() {
    super.initState();

    _route();
  }

  _route() async {
    var _duration = Duration(seconds: splashDelay);
    return Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (BuildContext context) => _textFormField()));
  }
/*
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'WelCome',
        ),
        automaticallyImplyLeading: false, // hides leading widget
      ),
      body: InkWell(
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  flex: 7,
                  child: Container(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        child: Text(
                          'WelCome, In this Game the numbers will Appear jest 5 seconds and Then will Disappaer.',
                          style: TextStyle(
                              fontSize: 30,
                              backgroundColor: Colors.lightBlue[100]),
                        ),
                      ),
                    ],
                  )),
                ),
              ],
            ),
          ],
        ),
      ),
    );*/

  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Random Numbers'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          verticalDirection: VerticalDirection.down,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              child: _getRandomNumbers(),
            ),
            Container(child: _textFormField())
          ],
        ),
      ),
    ));
  }
}

_getRandomNumbers() {
  List<int> list = [];
  for (var i = 1; i <= 5; i++) {
    list.add(new Random().nextInt(99));
  }
  return Text(
      '$list'.replaceAll("[", "").replaceAll("]", "").replaceAll(",", " "),
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40));
}

Widget _textFormField() {
  return Column(
    children: <Widget>[
      Row(
        mainAxisSize: MainAxisSize.max,
        verticalDirection: VerticalDirection.down,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            child: TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
              ),
              inputFormatters: [
                // new LengthLimitingTextInputFormatter(2),
              ],
            ),
            width: 60,
            height: 35,
          ),
          SizedBox(
            width: 10,
          ),
          Container(
            child: TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
              ),
              inputFormatters: [
                // new LengthLimitingTextInputFormatter(2),
              ],
            ),
            width: 60,
            height: 35,
          ),
          SizedBox(
            width: 10,
          ),
          Container(
            child: TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
              ),
              inputFormatters: [
                // new LengthLimitingTextInputFormatter(2),
              ],
            ),
            width: 60,
            height: 35,
          ),
          SizedBox(
            width: 10,
          ),
          Container(
            child: TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
              ),
              inputFormatters: [
                // new LengthLimitingTextInputFormatter(2),
              ],
            ),
            width: 60,
            height: 35,
          ),
          SizedBox(
            width: 10,
          ),
          Container(
            child: TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
              ),
              inputFormatters: [
                // new LengthLimitingTextInputFormatter(2),
              ],
            ),
            width: 60,
            height: 35,
          ),
        ],
      ),
      SizedBox(
        height: 40,
      ),
      _getRaisedButton()
    ],
  );
}

_getRaisedButton() {
  return Container(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Container(
            child: RaisedButton(
          color: Colors.black,
          textColor: Colors.white,
          child: Text(
            'Play Again',
          ),
          onPressed: () {},
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
        )),
        Container(
            child: RaisedButton(
          color: Colors.black,
          textColor: Colors.white,
          child: Text(
            'Submit',
          ),
          onPressed: () {},
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
        )),
      ],
    ),
  );
}
