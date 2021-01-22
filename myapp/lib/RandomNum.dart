import 'dart:math';
import 'package:flutter/material.dart';
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

  var num1 = new TextEditingController();
  var num2 = new TextEditingController();
  var num3 = new TextEditingController();
  var num4 = new TextEditingController();
  var num5 = new TextEditingController();

  List<int> list = List();
  List<int> list1 = List();
  bool inVisible = true;
  bool invisible = true;

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
            Visibility(
              visible: invisible,
              child: _getRandomNumbers(),
            ),
            Visibility(visible: invisible, child: _getCountDownController()),
            Container(child: _textFormField())
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
                controller: num1,
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
                controller: num2,
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
                controller: num3,
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
                controller: num4,
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
                controller: num5,
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
            onPressed: () {
              _equalValues(list, _textFormFieldValues());
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
      return _showAlertDialogforWrong();
    } else {
      for (var i = 0; i < list.length; i++) {
        if (list[i] != list1[i]) {
          return _showAlertDialogforWrong();
        }
      }
    }
    return _showAlertDialogforRight();
  }

  _showAlertDialogforRight() {
    Widget okButton = FlatButton(
      child: Text(
        'Ok',
      ),
      onPressed: () {},
    );
    AlertDialog alert = AlertDialog(
      title: Text(
        'Correct',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 20),
      ),
      content: Icon(
        Icons.done,
        color: Colors.blue,
        size: 140,
      ),
      actions: [okButton],
    );
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        });
  }

  _showAlertDialogforWrong() {
    Widget okButton = FlatButton(
      child: Text('Ok'),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    AlertDialog alert = AlertDialog(
      title: Text(
        'wrong',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 20),
      ),
      content: Icon(
        Icons.dangerous,
        color: Colors.blue,
        size: 140,
      ),
      actions: [okButton],
    );
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        });
  }

  _getCountDownController() {
    CountDownController _controller = CountDownController();
    return Center(
      child: CircularCountDownTimer(
        height: 100,
        width: 100,

        duration: 10,
        controller: _controller,
        color: Colors.white,
        fillColor: Colors.blue,
        strokeWidth: 5.0,
        textStyle: TextStyle(
            fontSize: 22.0, color: Colors.black, fontWeight: FontWeight.bold),
        isReverse: true,

        // true for reverse animation, false for forward animation
        isReverseAnimation: false,

        // Optional [bool] to hide the [Text] in this widget.
        isTimerTextShown: true,

        // Function which will execute when the Countdown Ends
        onComplete: () {
          setState(() {
            invisible = false;
          });
          inVisible = false;
          // Here, do whatever you want
          print('Countdown Ended');
        },
      ),
    );
  }
}
