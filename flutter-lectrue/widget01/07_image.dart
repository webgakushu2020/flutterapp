/*----------------------------------

画像を入れよう！

★：①画像を入れる前に…
「sample」フォルダの下に「images」フォルダを作成、その中に使いたい画像を入れる
「pubspec.yaml」を開く
一番下（flutter ブロックの中。assets:の前は必ず空白スペースをあけて）に以下を追記

assets:
  - images


②imageを追加

----------------------------------*/

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
          backgroundColor: Colors.yellow.shade50,
          appBar: AppBar(title: const Text('自己紹介')),
          body: Center(
            child: Container(
              width: 300,
              height: 500,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.brown, width: 2),
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                children: [
                  // ★：②imageを追加
                  Image.asset('images/sakura.jpg'),
                  Row(
                    children: [Text('名前'), Text('ぞえ')],
                  ),
                  Row(
                    children: [Text('住み'), Text('東京')],
                  ),
                  Row(
                    children: [Text('誕生日'), Text('02/20')],
                  ),
                  Row(
                    children: [Text('趣味'), Text('音楽')],
                  ),
                  Row(
                    children: [Text('ひとこと'), Text('アプリ作ろうぜ！')],
                  )
                ],
              ),
            ),
          )),
    );
  }
}
