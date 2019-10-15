import 'package:flutter/material.dart';
import 'package:messaging_app/pages/conversation_bottom_sheet.dart';
import 'package:messaging_app/pages/conversation_page.dart';
import 'package:messaging_app/widget/input_widget.dart';
import 'package:rubber/rubber.dart';

class ConversationPageSlide extends StatefulWidget {
  @override
  _ConversationPageSlideState createState() => new _ConversationPageSlideState();

  const ConversationPageSlide();
}

class _ConversationPageSlideState extends State<ConversationPageSlide> with SingleTickerProviderStateMixin {
  var controller;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  void initState() {
    controller = RubberAnimationController(
      vsync: this,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        body: Column(
          children: <Widget>[
            Expanded(
              child: PageView(
                children: <Widget>[
                  ConversationPage(),
                  ConversationPage(),
                  ConversationPage(),
                ],
              ),
            ),
            Container(
              child: GestureDetector(
                child: InputWidget(),
                onPanUpdate: (details) {
                  if (details.delta.dy < 0) {
                    _scaffoldKey.currentState.showBottomSheet((BuildContext context) {
                      return ConversationBottomSheet();
                    });
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
