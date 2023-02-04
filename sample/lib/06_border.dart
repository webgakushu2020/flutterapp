import 'package:flutter/material.dart';
// ----------------------------------------
// 線を入れよう
// ----------------------------------------

// ignore: camel_case_types
class NextPage_border extends StatelessWidget {
  const NextPage_border({super.key});

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
      backgroundColor: Color.fromARGB(255, 255, 223, 251),
      appBar: AppBar(
        title: Text('自己紹介'),
      ),
      body: Container(
        width: 300,
        height: 500,
        margin: EdgeInsets.all(50),
        padding: EdgeInsets.all(20),
        // ★borderはdexoration　背景色はdecorationの中に移動
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 254, 255, 205),
          border: Border.all(color: Colors.blue, width: 2),
          borderRadius: BorderRadius.circular(50),
        ),
        child: Column(
          children: [
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
                Text('どんなアプリが作れるかな'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
