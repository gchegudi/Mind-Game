import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextForm extends StatefulWidget {
  @override
  _TextState createState() => _TextState();
}

class _TextState extends State<TextForm> {
  final FocusScopeNode _node = FocusScopeNode();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _node.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Material(
        key: _formKey,
        child: FocusScope(
            node: _node,
            child: Scaffold(
                appBar: AppBar(),
                body: Column(
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
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0))),
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
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0))),
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
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0))),
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
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0))),
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
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0))),
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
                    _getRaisedButton()
                  ],
                ))));
  }
}

_getRaisedButton() {
  return Container(
    child: Row(
      //mainAxisSize: MainAxisSize.max,
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
