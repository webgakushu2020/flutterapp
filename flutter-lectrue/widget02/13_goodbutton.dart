/*----------------------------------

いいねボタンを作ろう！

①変数goodを作り、初期値の0を入れる
②onPressedの中に「いいね！」が押されたら1追加する処理を追加
③ボタンの文字を「いいね！」に変更
④他2つのボタンを消し、いいねの数を表示
⑤いいね数のテキスト色を赤に

----------------------------------*/

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyHomePage(title: '自己紹介'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // ★：①変数goodを作り、初期値の0を入れる
  var good = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow.shade50,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          width: 300,
          height: 500,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.brown, width: 2),
              borderRadius: BorderRadius.circular(20)),
          padding: EdgeInsets.all(10),
          child: ListView(
            children: [
              Image.asset("images/sakura.jpg"),
              Padding(
                padding: EdgeInsets.only(bottom: 5),
                child: Row(
                  children: [Text('名前'), SizedBox(width: 5), Text('ぞえ')],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 5),
                child: Row(
                  children: [Text('住み'), SizedBox(width: 5), Text('東京')],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 5),
                child: Row(
                  children: [Text('誕生日'), SizedBox(width: 5), Text('02/20')],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 5),
                child: Row(
                  children: [Text('趣味'), SizedBox(width: 5), Text('音楽')],
                ),
              ),
              Row(
                children: [
                  Text('ひとこと'),
                  SizedBox(width: 5),
                  Flexible(
                      child: Text(
                          'アプリ作ろうぜ！そういえばメッセージって長くなりがちだよね。そんな時も安心！Flexibleで囲ってあげれば、自動的にこんな感じで折り返してくれるよ〜すごいぜ〜〜。ちなみに改行をしたい場合は\nをつけるとできるよ！\n\n2個連続ももちろんオッケー！'))
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  ElevatedButton(
                    // ★：②onPressedの中に「いいね！」が押されたら1追加する処理を追加
                    onPressed: () {
                      setState(() {
                        good++;
                      });
                    },
                    // ★：③ボタンの文字を「いいね！」に変更
                    child: Text('いいね！'),
                  ),
                  SizedBox(width: 20),
                  // ★：④他2つのボタンを消し、いいねの数を表示
                  Text(good.toString(),
                      // ★：⑤いいね数のテキスト色を赤に
                      style: TextStyle(color: Colors.red[400])),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
