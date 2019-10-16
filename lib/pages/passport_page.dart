import 'package:flutter/material.dart';
import 'package:messaging_app/config/assets.dart';

class PassportPage extends StatefulWidget {
  @override
  _PassportPageState createState() => new _PassportPageState();
}

class _PassportPageState extends State<PassportPage> {
  // TODO: add state variables and methods

  @override
  Widget build(BuildContext context) {
    // TODO: add widget build method
    return buildPageOne();
  }

  buildPageOne() {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 250),
            child: Image.asset(
              Assets.appIconForeground,
              height: 100,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 30),
            child: Text(
              "App Messager",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
          ),
          Container(),
        ],
      ),
    );
  }

  buildPageTwo() {
    return Container();
  }
}
