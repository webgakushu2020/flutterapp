import 'package:flutter/material.dart';

// ----------------------------------------
// 文字を縦に並べてみよう
// ----------------------------------------
// ignore: camel_case_types
class NextPage_column extends StatelessWidget {
  const NextPage_column({super.key});
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
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

// ignore: camel_case_types
class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('自己紹介'),
      ),
      body: Container(
        // ★　文字を縦に並べる
        child: Column(
          children: [
            Text('中島朋子'),
            Text('神奈川県横浜市'),
            Text('1979/01/12'),
            Text('ドラマをみること'),
            Text('アプリを作り楽しいね！'),
          ],
        ),
      ),
    );
  }
}
