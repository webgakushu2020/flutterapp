import 'package:flutter/material.dart';
// ----------------------------------------
// 文字を横に並べてみよう
// ----------------------------------------

// ignore: camel_case_types
class NextPage_aaa extends StatelessWidget {
  const NextPage_aaa({super.key});
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
        child: Column(
          children: [
            // ★　見出しを付ける　文字を横に並べる
            Row(
              children: [
                Text('名前：'),
                Text('中島朋子'),
              ],
            ),
            Row(
              children: [
                Text('出身：'),
                Text('栃木県佐野市'),
              ],
            ),
            Row(
              children: [
                Text('生年月日：'),
                Text('1979/01/12'),
              ],
            ),
            Row(
              children: [
                Text('趣味：'),
                Text('ドラマをみること'),
              ],
            ),
            Row(
              children: [
                Text('メッセージ：'),
                Text('アプリを作り楽しいね！'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
