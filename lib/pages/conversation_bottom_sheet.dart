import 'package:flutter/material.dart';
import 'package:messaging_app/config/palette.dart';
import 'package:messaging_app/config/styles.dart';
import 'package:messaging_app/widget/chat_row_widget.dart';
import 'package:messaging_app/widget/navigation_pill_widget.dart';

class ConversationBottomSheet extends StatefulWidget {
  @override
  _ConversationBottomSheetState createState() => _ConversationBottomSheetState();

  const ConversationBottomSheet();
}

class _ConversationBottomSheetState extends State<ConversationBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
          children: <Widget>[
            GestureDetector(
              onVerticalDragEnd: (details) {
                print("Dragged Down");
                if (details.primaryVelocity > 50) {
                  Navigator.pop(context);
                }
              },
              child: ListView(
                physics: ClampingScrollPhysics(),
                shrinkWrap: true,
                children: <Widget>[
                  NavigationPillWidget(),
                  Center(
                    child: Text(
                      "Messages",
                      style: Styles.textHeading,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            ListView.separated(
              physics: ClampingScrollPhysics(),
              shrinkWrap: true,
              itemCount: 5,
              separatorBuilder: (context, index) => Padding(
                padding: EdgeInsets.only(left: 75, right: 20),
                child: Divider(
                  color: Palette.accentColor,
                ),
              ),
              itemBuilder: (context, index) {
                return ChatRowWidget();
              },
            )
          ],
        ),
      ),
    );
  }
}
