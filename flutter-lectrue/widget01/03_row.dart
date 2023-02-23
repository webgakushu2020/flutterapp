/*----------------------------------

要素を横に並べよう！

①childrenの中にRow()を入れる
②childrenの中にTextを入れる（①②を全てに対し行う）

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
          appBar: AppBar(title: const Text('自己紹介')),
          body: Center(
            child: Container(
              child: Column(
                children: [
                  // ★：①childrenの中にRow()を入れる
                  Row(
                    // ★：②childrenの中にTextを入れる（①②を全てに対し行う）
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
