/*----------------------------------

変更を加えられる箇所と、そうでない箇所に分けよう！その2

①Center()の中身を、Myappから_MyHomePageStateに移動
②homeの設定を書き換え

----------------------------------*/

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile',
      theme: ThemeData(primarySwatch: Colors.blue),
      // ★：②homeの設定を書き換え（backgroundColor,appBar,bodyは消去）
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow.shade50,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        // ★：①Centerの中身をコピペ
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
                  TextButton(
                    onPressed: () {},
                    child: Text('文字'),
                  ),
                  SizedBox(width: 5),
                  OutlinedButton(
                    onPressed: () {},
                    child: Text('文字'),
                  ),
                  SizedBox(width: 5),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('文字'),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
