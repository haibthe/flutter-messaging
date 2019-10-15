import 'package:flutter/material.dart';
import 'package:messaging_app/config/palette.dart';
import 'package:messaging_app/pages/conversation_bottom_sheet.dart';

class InputWidget extends StatelessWidget {
  final TextEditingController textEditingController = TextEditingController();

  InputWidget();

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 60.0,
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Palette.greyColor,
              width: 0.5,
            ),
          ),
          color: Colors.white,
        ),
        child: Row(
          children: <Widget>[
            Material(
              child: Container(
                color: Colors.white,
                margin: EdgeInsets.symmetric(horizontal: 1),
                child: IconButton(
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (BuildContext bc) {
                          return Container(
                            child: Wrap(
                              children: <Widget>[
                                ConversationBottomSheet(),
                              ],
                            ),
                          );
                        });
                  },
                  icon: Icon(Icons.face),
                  color: Palette.accentColor,
                ),
              ),
            ),
            Flexible(
              child: Material(
                child: Container(
                  child: TextField(
                    style: TextStyle(
                      color: Palette.primaryTextColor,
                      fontSize: 15,
                    ),
                    controller: textEditingController,
                    decoration: InputDecoration.collapsed(
                      hintText: "Type a message",
                      hintStyle: TextStyle(color: Palette.greyColor),
                    ),
                  ),
                ),
              ),
            ),
            Material(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 8.0),
                color: Colors.white,
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.send),
                  color: Palette.accentColor,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
