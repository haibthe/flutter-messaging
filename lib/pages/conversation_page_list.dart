import 'package:flutter/material.dart';
import 'package:messaging_app/pages/conversation_page.dart';

class ConversationPageList extends StatefulWidget {
  @override
  _ConversationPageListState createState() => new _ConversationPageListState();
}

class _ConversationPageListState extends State<ConversationPageList> {
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
