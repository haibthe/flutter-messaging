import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:messaging_app/main.dart';

void main() {
  testWidgets("ChatListWidget UI Test", (tester) async {
    await tester.pumpWidget(MyApp());

//    expect(find.byType(ListView), findsOneWidget);
  });
}
