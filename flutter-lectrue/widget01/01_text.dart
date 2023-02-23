/*----------------------------------

文字を入れよう！

①アプリタイトルを変更
②上のバー（appBar）の文字を変更
③全体をCenterで中央揃えに
④子要素にコンテナを入れる
⑤子要素にテキスト入れ、表示させる

----------------------------------*/

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // ★：①アプリタイトルを変更
      title: 'Profile',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
          // ★：②上のバー（appBar）の文字を変更
          appBar: AppBar(title: const Text('自己紹介')),
          // ★：③全体をCenterで中央揃えに
          body: Center(
            // ★：④子要素にコンテナを入れる
            child: Container(
              // ★：⑤子要素にテキスト入れ、表示させる
              child: Text('ぞえ'),
            ),
          )),
    );
  }
}
