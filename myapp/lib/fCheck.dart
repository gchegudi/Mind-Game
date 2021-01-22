import 'dart:math';
import 'package:flutter/material.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/services.dart';

/*
_getRandomNumbers() {
  var list = List<int>.generate(100, (i) => i)..shuffle();
  list = list.take(5).toList();
  final input = list.take(5).toString();
  final removedBrackets = input.substring(1, input.length - 1);
  final parts = removedBrackets.split("[]");
  var joined = parts.map((part) => part).join("");
  return Text(
    '$joined',
    style: TextStyle(fontSize: 30),
  );
}*/

class FutureUse extends StatefulWidget {
  @override
  _FutureUse createState() => _FutureUse();
}

class _FutureUse extends State<FutureUse> {
  final FocusScopeNode _node = FocusScopeNode();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  @override
  void dispose() {
    super.dispose();
  }

  bool inVisible = true;
  bool invisible = true;
  bool isEnable = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        key: _formKey,
        home: FocusScope(
            node: _node,
            child: Scaffold(
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
                    Visibility(
                      visible: invisible,
                      child: _getCountDownController(),
                    ),
                    _textFormField(),
                    _getTextFormFieldsVisible(),
                  ],
                ),
              ),
            )));
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

  _textFormField() {
    return Material(
        child: Column(children: <Widget>[
      Row(
        mainAxisSize: MainAxisSize.max,
        verticalDirection: VerticalDirection.down,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            child: TextFormField(
              enabled: isEnable,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
              ),
              inputFormatters: [
                new LengthLimitingTextInputFormatter(2),
              ],
              onEditingComplete: _node.nextFocus,
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
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
              ),
              inputFormatters: [
                new LengthLimitingTextInputFormatter(2),
              ],
              onEditingComplete: _node.nextFocus,
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
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
              ),
              inputFormatters: [
                new LengthLimitingTextInputFormatter(2),
              ],
              onEditingComplete: _node.nextFocus,
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
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
              ),
              inputFormatters: [
                new LengthLimitingTextInputFormatter(2),
              ],
              onEditingComplete: _node.nextFocus,
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
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
              ),
              inputFormatters: [
                new LengthLimitingTextInputFormatter(2),
              ],
              onEditingComplete: _node.nextFocus,
            ),
            width: 60,
            height: 35,
          ),
        ],
      ),
      SizedBox(
        height: 40,
      ),
      _getRaisedButton(),
    ]));
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

  Widget _getTextFormFieldsVisible() {
    if (invisible = false) {
      return _getCountDownController1();
    } else {
      return Container();
    }
  }

  _getCountDownController() {
    CountDownController _controller = CountDownController();
    return Center(
      child: CircularCountDownTimer(
        height: 100,
        width: 100,

        duration: 5,
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

  _getCountDownController1() {
    CountDownController _controller = CountDownController();
    return Center(
      child: CircularCountDownTimer(
        height: 100,
        width: 100,

        duration: 5,
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
            isEnable = false;
          });

          // Here, do whatever you want
          print('Countdown Ended');
        },
      ),
    );
  }
}
