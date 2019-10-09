import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:messaging_app/widget/chat_app_bar.dart';

void main() {
  MaterialApp app = MaterialApp(
    home: Scaffold(
      body: ChatAppBar(),
    ),
  );

  testWidgets("ChatAppBar UI Test", (tester) async {
    await tester.pumpWidget(app);

    expect(find.text('Hai Bui'), findsOneWidget);
    expect(find.text('@gmail.com'), findsOneWidget);
    expect(find.byType(Icon), findsOneWidget);
    expect(find.byType(CircleAvatar), findsOneWidget);
  });
}
