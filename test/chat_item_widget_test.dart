import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:messaging_app/pages/conversation_page.dart';
import 'package:messaging_app/pages/conversation_page_list.dart';
import 'package:messaging_app/widget/chat_app_bar.dart';
import 'package:messaging_app/widget/chat_item_widget.dart';

void main() {
  MaterialApp app = MaterialApp(
    home: Scaffold(
      body: ChatItemWidget(0),
    ),
  );

  testWidgets("ChatItemWidget UI Test", (tester) async {
    await tester.pumpWidget(app);


    expect(find.byType(Container),findsNWidgets(3));
    expect(find.byType(Column),findsNWidgets(1));
    expect(find.byType(Row),findsNWidgets(2));
    expect(find.byType(Text),findsNWidgets(2));

  });
}