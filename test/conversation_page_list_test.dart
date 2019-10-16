import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:messaging_app/pages/conversation_page.dart';
import 'package:messaging_app/pages/conversation_page_slide.dart';
import 'package:messaging_app/widget/input_widget.dart';

void main() {
  MaterialApp app = MaterialApp(
    home: Scaffold(
      body: ConversationPageSlide(),
    ),
  );

  testWidgets("ConversationPageSlide UI Test", (tester) async {
    await tester.pumpWidget(app);

    expect(find.byType(ConversationPage), findsOneWidget);
    expect(find.byType(PageView), findsOneWidget);
    expect(find.byType(InputWidget), findsOneWidget);
  });
}
