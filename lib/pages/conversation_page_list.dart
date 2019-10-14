import 'package:flutter/material.dart';
import 'package:messaging_app/pages/conversation_page.dart';
import 'package:rubber/rubber.dart';

class ConversationPageList extends StatefulWidget {

  @override
  _ConversationPageListState createState() => new _ConversationPageListState();

  const ConversationPageList();
}

class _ConversationPageListState extends State<ConversationPageList> with SingleTickerProviderStateMixin {

  var controller;

  @override
  void initState() {
    controller = RubberAnimationController(vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      children: <Widget>[
        ConversationPage(),
        ConversationPage(),
        ConversationPage(),
      ],
    );
  }
}
