import 'package:flutter/material.dart';

import 'package:circular_countdown_timer/circular_countdown_timer.dart';

class TimerCountDown extends StatefulWidget {
  @override
  _TimerCountDown createState() => _TimerCountDown();
}

class _TimerCountDown extends State<TimerCountDown> {
  CountDownController _controller = CountDownController();

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
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
        isReverse: true,
        isReverseAnimation: false,
        isTimerTextShown: true,
        onComplete: () {
          print('Countdown Ended');
        },
      )),
    );
  }
}

/*CountdownTimerController controller;
  int endTime = DateTime.now().millisecondsSinceEpoch + 900 * 10;

  void initState() {
    super.initState();
    // controller = CountdownTimerController(endTime: endTime, onEnd: onEnd);
  }

  void onEnd() {
    print('onEnd');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          CountdownTimer(
            textStyle: TextStyle(
              fontSize: 45,
              color: Colors.blue,
            ),
            onEnd: onEnd,
            endTime: endTime,
          ),
        ],
      ),
    );
  }
}*/

/*CountdownTimer(
            controller: controller,
            widgetBuilder: (BuildContext context, CurrentRemainingTime time) {
              if (time == null) {
                return Text('Game over',
                style: TextStyle(fontStyle: FontStyle.italic,));
              }
              /* List<Widget> list = [];
              if (time.days != null) {
                list.add(Row(
                  children: <Widget>[
                    Icon(Icons.sentiment_dissatisfied),
                    Text(time.days.toString()),
                  ],
                ));
              }*/
              /*
              if (time.hours != null) {
                list.add(Row(
                  children: <Widget>[
                    Icon(Icons.sentiment_satisfied),
                    Text(time.hours.toString()),
                  ],
                ));
              }
              if (time.min != null) {
                list.add(Row(
                  children: <Widget>[
                    Icon(Icons.sentiment_very_dissatisfied),
                    Text(time.min.toString()),
                  ],
                ));
              }
              if (time.sec != null) {
                list.add(Row(
                  children: <Widget>[
                    Icon(Icons.sentiment_very_satisfied),
                    Text(time.sec.toString()),
                  ],
                ));
              }*/

              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                //children: list,
              );
            },
          ),*/
