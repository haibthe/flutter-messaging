import 'package:flutter/material.dart';
import 'package:messaging_app/config/palette.dart';
import 'package:messaging_app/pages/conversation_page_list.dart';
import 'package:messaging_app/pages/conversation_page_slide.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Palette.primaryColor,
      ),
      home: ConversationPageSlide(),
    );
  }
}

//class MyHomePage extends StatefulWidget {
//  MyHomePage({Key key, this.title}) : super(key: key);
//
//  final String title;
//
//  @override
//  _MyHomePageState createState() => _MyHomePageState();
//}
//
//class _MyHomePageState extends State<MyHomePage> {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text(widget.title),
//      ),
//      body: Center(child: Text('Hello World!')),
//    );
//  }
//}
