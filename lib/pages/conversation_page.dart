import 'package:flutter/material.dart';
import 'package:messaging_app/config/palette.dart';
import 'package:messaging_app/widget/chat_app_bar.dart';
import 'package:messaging_app/widget/chat_list_widget.dart';
import 'package:messaging_app/widget/conversation_bottom_sheet.dart';
import 'package:messaging_app/widget/input_widget.dart';

class ConversationPage extends StatefulWidget {
  const ConversationPage();

  @override
  _ConversationPageState createState() => new _ConversationPageState();
}

class _ConversationPageState extends State<ConversationPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        appBar: ChatAppBar(),
        body: Container(
          color: Palette.chatBackgroundColor,
          child: Stack(
            children: <Widget>[
              Column(
                children: <Widget>[
                  ChatListWidget(),
                  GestureDetector(
                    onPanUpdate: (details) {
                      if (details.delta.dy < 0) {
                        _scaffoldKey.currentState.showBottomSheet((context) {
                          return ConversationBottomSheet();
                        });
                      }
                    },
                    child: InputWidget(),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
