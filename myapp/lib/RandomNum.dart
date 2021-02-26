import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:toast/toast.dart';

class RandomNum extends StatefulWidget {
  @override
  _RandomNumbers createState() => _RandomNumbers();
}

class _RandomNumbers extends State<RandomNum> {
  CountDownController _controller = CountDownController();
  CountDownController controller = CountDownController();

  var num1 = new TextEditingController();
  var num2 = new TextEditingController();
  var num3 = new TextEditingController();
  var num4 = new TextEditingController();
  var num5 = new TextEditingController();

  List<int> list = List();
  List<int> list1 = List();

  bool inVisible = true;
  bool invisible = true;
  bool isEnable = false;

  List<int> _textFormFieldValues() {
    list1.clear();
    int _num1 = int.parse(num1.text);
    int _num2 = int.parse(num2.text);
    int _num3 = int.parse(num3.text);
    int _num4 = int.parse(num4.text);
    int _num5 = int.parse(num5.text);
    list1 = [_num1, _num2, _num3, _num4, _num5];
    return list1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: initScreen(context),
    );
  }

  initScreen(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Memory Master'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          verticalDirection: VerticalDirection.down,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Visibility(
              visible: invisible,
              child: _getRandomNumbers(),
            ),
            Visibility(visible: invisible, child: _getCountDownController()),
            _getTimer(),
            Container(child: _textFormField()),
            _getRaisedButton()
          ],
        ),
      ),
    );
  }

  _getRandomNumbers() {
    if (inVisible) {
      List<int> list = [];
      for (var i = 1; i <= 5; i++) {
        list.add(new Random().nextInt(99));
      }
      return Text(
          '$list'.replaceAll("[", "").replaceAll("]", "").replaceAll(",", " "),
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40));
    } else {
      return Container();
    }
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
                enabled: isEnable,
                controller: num1,
                keyboardType: TextInputType.number,
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
                enabled: isEnable,
                controller: num2,
                keyboardType: TextInputType.number,
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
                enabled: isEnable,
                controller: num3,
                keyboardType: TextInputType.number,
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
                enabled: isEnable,
                controller: num4,
                keyboardType: TextInputType.number,
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
                enabled: isEnable,
                controller: num5,
                keyboardType: TextInputType.number,
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
            onPressed: () {
              setState(() {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => RandomNum()));
              });
            },
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
          )),
          Container(
              child: RaisedButton(
            color: Colors.black,
            textColor: Colors.white,
            child: Text(
              'Check',
            ),
            onPressed: () {
              _equalValues(list, _textFormFieldValues());
              if (_textFormFieldValues() == null) {
                return _getToast("Enter Values");
              }
            },
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
          )),
        ],
      ),
    );
  }

  _equalValues(var list, list1) {
    if (list.length != list1.length) {
      return _getToast('Wrong');
    } else {
      for (var i = 0; i < list.length; i++) {
        if (list[i] != list1[i]) {
          return _getToast('Wrong');
        }
      }
    }
    return _getToast('Correct');
  }

  _getToast(String message) {
    ToastView.createView(message, context, Toast.TOP, Toast.BOTTOM,
        Colors.black, Colors.white, 20, null);
  }

  _getTimer() {
    if (invisible == false) {
      return _getCountDownController2();
    } else {
      return Container();
    }
  }

  _getCountDownController() {
    CountDownController _controller = CountDownController();
    return CircularCountDownTimer(
      height: 100,
      width: 100,
      duration: 9,
      controller: _controller,
      color: Colors.white,
      fillColor: Colors.blue,
      strokeWidth: 5.0,
      textStyle: TextStyle(
          fontSize: 22.0, color: Colors.black, fontWeight: FontWeight.bold),
      isReverse: true,
      isReverseAnimation: false,
      isTimerTextShown: true,
      onComplete: () {
        setState(() {
          invisible = false;
        });
        inVisible = false;
        isEnable = true;

        print('Countdown Ended');
      },
    );
  }

  _getCountDownController2() {
    CountDownController _controller;
    return (CircularCountDownTimer(
      height: 100,
      width: 100,
      duration: 20,
      controller: _controller,
      color: Colors.white,
      fillColor: Colors.blue,
      strokeWidth: 5.0,
      textStyle: TextStyle(
          fontSize: 22.0, color: Colors.black, fontWeight: FontWeight.bold),
      isReverse: true,
      isReverseAnimation: false,
      isTimerTextShown: true,
      onComplete: () {
        setState(() {
          isEnable = false;
        });

        print('Countdown Ended');
        _getTextFormFieldEmpty();
      },
    ));
  }

  _getTextFormFieldEmpty() {
    if ((num1.text == "" || null) &&
        (num2.text == "" || null) &&
        (num3.text == "" || null) &&
        (num4.text == "" || null) &&
        (num5.text == "" || null)) {
      return _getToast("TimeUp");
    }
  }
}
