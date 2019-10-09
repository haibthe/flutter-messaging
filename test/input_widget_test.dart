import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:messaging_app/pages/conversation_page.dart';
import 'package:messaging_app/pages/conversation_page_list.dart';
import 'package:messaging_app/widget/chat_app_bar.dart';
import 'package:messaging_app/widget/chat_list_widget.dart';
import 'package:messaging_app/widget/input_widget.dart';

void main() {
  MaterialApp app = MaterialApp(
    home: Scaffold(
      body: InputWidget(),
    ),
  );

  testWidgets("InputWidget UI Test", (tester) async {
    await tester.pumpWidget(app);

    expect(find.byType(IconButton),findsNWidgets(2));
    expect(find.byType(EditableText),findsOneWidget);
  });
}
