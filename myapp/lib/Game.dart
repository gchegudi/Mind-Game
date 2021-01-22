import 'package:flutter/material.dart';
import 'dart:math';

import 'package:flutter/services.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';

class RandomNum extends StatefulWidget {
  @override
  _RandomNumbers createState() => _RandomNumbers();
}

class _RandomNumbers extends State<RandomNum> {
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: initScreen(context),
    );
  }

  initScreen(BuildContext context) {
    Widget countDownController;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Random Numbers'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          verticalDirection: VerticalDirection.down,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              child: _getRandomNumbers(),
            ),
            countDownController = _getCountDownController(),
            //Container(child: _textFormField())
          ],
        ),
      ),
    );
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
/*
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
                new LengthLimitingTextInputFormatter(2),
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
                new LengthLimitingTextInputFormatter(2),
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
                new LengthLimitingTextInputFormatter(2),
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
                new LengthLimitingTextInputFormatter(2),
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
                new LengthLimitingTextInputFormatter(2),
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
}*/

Widget _getCountDownController() {
  CountDownController _controller = CountDownController();
  return Center(
    child: CircularCountDownTimer(
      height: 100,
      width: 100,

      duration: 7,
      controller: _controller,
      color: Colors.white,
      fillColor: Colors.blue,
      strokeWidth: 5.0,
      textStyle: TextStyle(
          fontSize: 22.0, color: Colors.black, fontWeight: FontWeight.bold),
      isReverse: false,

      // true for reverse animation, false for forward animation
      isReverseAnimation: false,

      // Optional [bool] to hide the [Text] in this widget.
      isTimerTextShown: true,

      // Function which will execute when the Countdown Ends
      onComplete: () {
        // Here, do whatever you want
        print('Countdown Ended');
      },
    ),
  );
}
