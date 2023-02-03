import 'package:flutter/material.dart';

// ----------------------------------------
// 文字を表示しよう
// ----------------------------------------
// ignore: camel_case_types
class NextPage_text extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'MyProfile'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

// ignore: camel_case_types
class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // ★タイトルと文字列を表示しよう
    return Scaffold(
      appBar: AppBar(
        title: Text('自己紹介'),
      ),
      body: Container(
        child: Center(
          child: Text('中島朋子'),
        ),
      ),
    );
  }
}
