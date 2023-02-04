import 'package:flutter/material.dart';
// ----------------------------------------
// 細かい部分の余白の入れ方
// columnの中の余白
// rowの中の余白
// 文字の改行
// ----------------------------------------

class NextPage_margin2 extends StatelessWidget {
  const NextPage_margin2({super.key});

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
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 254, 255, 205),
          border: Border.all(color: Colors.blue, width: 2),
          borderRadius: BorderRadius.circular(50),
        ),
        child: Column(
          children: [
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/sakura01.png'),
                ),
              ),
            ),
            // ★columnの余白
            SizedBox(height: 20),
            Row(
              children: [
                Text('名　前　：'),
                // ★rowの余白
                SizedBox(width: 5),
                Text('中島朋子'),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Text('出　身　：'),
                SizedBox(width: 5),
                Text('栃木県佐野市'),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Text('生年月日：'),
                SizedBox(width: 5),
                Text('1979/01/12'),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Text('趣　味　：'),
                SizedBox(width: 5),
                Text('映画をみること\nドラマをみること\n俳優大好き！'),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Text('メッセージ：'),
                SizedBox(width: 5),
                Expanded(
                  //折り返して表示
                  child: Text('どんなアプリが作れるかな！楽しみですね'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
