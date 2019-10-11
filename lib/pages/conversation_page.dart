import 'package:flutter/material.dart';
import 'package:messaging_app/widget/chat_app_bar.dart';
import 'package:messaging_app/widget/chat_list_widget.dart';
import 'package:messaging_app/widget/input_widget.dart';

class ConversationPage extends StatefulWidget {
  @override
  _ConversationPageState createState() => new _ConversationPageState();
}

class _ConversationPageState extends State<ConversationPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: ChatAppBar(),
        body: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                ChatListWidget(),
                GestureDetector(
                  onPanUpdate: (details) {
                    if (details.delta.dy < 0) {

                    }
                  },
                  child: InputWidget(),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
