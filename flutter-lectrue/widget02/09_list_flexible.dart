/*----------------------------------

要素がはみ出さないように設定しよう！

①Column ⇨ ListViewに変更
  下部分のはみ出しをスクロールにできる
②TextをFlexibleで囲う
  右部分のはみ出しを折り返しにできる

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
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.brown, width: 2),
                  borderRadius: BorderRadius.circular(20)),
              padding: EdgeInsets.all(10),
              // ★：①Column ⇨ ListViewに変更
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
                      children: [
                        Text('誕生日'),
                        SizedBox(width: 5),
                        Text('02/20')
                      ],
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
                      // ★：②TextをFlexibleで囲う
                      Flexible(
                          child: Text(
                              'アプリ作ろうぜ！そういえばメッセージって長くなりがちだよね。そんな時も安心！Flexibleで囲ってあげれば、自動的にこんな感じで折り返してくれるよ〜すごいぜ〜〜。ちなみに改行をしたい場合は\nをつけるとできるよ！\n\n2個連続ももちろんオッケー！'))
                    ],
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
