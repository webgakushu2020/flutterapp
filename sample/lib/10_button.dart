import 'package:flutter/material.dart';
// ----------------------------------------
// ボタンをつけよう
// ----------------------------------------

// ignore: camel_case_types
class NextPage_button extends StatelessWidget {
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
            SizedBox(height: 20),
            Row(
              children: [
                Text('名　前　：'),
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
                Expanded(
                  //折り返して表示
                  child: Text('どんなアプリが作れるかな！楽しみですね'),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                // ★　いろいろな種類のボタンがあるよ
                TextButton(
                  onPressed: () {
                    /* ボタンが押された時の処理はここに書く */
                  },
                  child: Text('イイね！'),
                ),
                SizedBox(width: 5),
                OutlinedButton(
                  onPressed: () {
                    /* ボタンが押された時の処理はここに書く */
                  },
                  child: Text('趣味'),
                ),
                SizedBox(width: 5),
                ElevatedButton(
                  onPressed: () {
                    /* ボタンが押された時の処理はここに書く */
                  },
                  child: Text('ゲーム'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
