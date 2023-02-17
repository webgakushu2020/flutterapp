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
              // ★：①Columnを追加（Ctrl + . を活用しよう！）
              child: Column(
                // ★：②Childrenに配列を作り、中にTextを並べる
                children: [
                  Text('ぞえ'),
                  Text('東京'),
                  Text('02/20'),
                  Text('音楽'),
                  Text('アプリ作ろうぜ！'),
                ],
              ),
            ),
          )),
    );
  }
}
