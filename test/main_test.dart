// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import "package:messaging_app/main.dart";
import 'package:messaging_app/pages/conversation_page_list.dart';
import 'package:messaging_app/pages/conversation_page_slide.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

//    expect(find.text("Hello World!"), findsOneWidget);
    expect(find.byType(ConversationPageSlide), findsOneWidget);
  });
}