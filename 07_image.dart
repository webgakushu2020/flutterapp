import 'package:flutter/material.dart';
// ----------------------------------------
// 画像を入れよう①
// ----------------------------------------

// ignore: camel_case_types
class NextPage_image extends StatelessWidget {
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
          // ★背景画像　decrationの中に
          image: DecorationImage(
            image: AssetImage('images/sakura01.png'),
          ),
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
