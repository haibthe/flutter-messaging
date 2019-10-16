import 'package:flutter/material.dart';
import 'package:messaging_app/config/palette.dart';
import 'package:messaging_app/widget/chat_app_bar.dart';
import 'package:messaging_app/widget/chat_list_widget.dart';

class ConversationPage extends StatefulWidget {
  const ConversationPage();

  @override
  _ConversationPageState createState() => new _ConversationPageState();
}

class _ConversationPageState extends State<ConversationPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          flex: 2,
          child: ChatAppBar(),
        ),
        Expanded(
          flex: 11,
          child: Container(
            color: Palette.chatBackgroundColor,
            child: ChatListWidget(),
          ),
        )
      ],
    );
  }

//  @override
//  Widget build(BuildContext context) {
//    return SafeArea(
//      child: Scaffold(
//        key: _scaffoldKey,
//        appBar: ChatAppBar(),
//        body: Container(
//          color: Palette.chatBackgroundColor,
//          child: Stack(
//            children: <Widget>[
//              Column(
//                children: <Widget>[
//                  ChatListWidget(),
//                  GestureDetector(
//                    onPanUpdate: (details) {
//                      if (details.delta.dy < 0) {
//                        _scaffoldKey.currentState.showBottomSheet((context) {
//                          return ConversationBottomSheet();
//                        });
//                      }
//                    },
//                    child: InputWidget(),
//                  ),
//                ],
//              )
//            ],
//          ),
//        ),
//      ),
//    );
//  }
}
