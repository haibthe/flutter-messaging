import 'package:flutter/material.dart';
import 'package:messaging_app/widget/chat_item_widget.dart';

class ChatListWidget extends StatelessWidget {
  ChatListWidget();

  final ScrollController listScrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListView.builder(
        padding: EdgeInsets.all(10),
        itemCount: 20,
        reverse: true,
        controller: listScrollController,
        itemBuilder: (context, index) => ChatItemWidget(index),
      ),
    );
  }
}
