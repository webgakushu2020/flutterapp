/*----------------------------------

余白を細かく調整しよう！

①RowをそれぞれPaddingで囲って、下だけに余白を作ろう
②Sizedboxで余白を作ろう

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
              child: Column(
                children: [
                  Image.asset("images/sakura.jpg"),
                  // ★：①RowをそれぞれPaddingで囲って、下だけに余白を作ろう
                  Padding(
                    padding: EdgeInsets.only(bottom: 5),
                    child: Row(
                      children: [
                        Text('名前'),
                        // ★：②Sizedboxで余白を作ろう
                        SizedBox(width: 5),
                        Text('ぞえ')
                      ],
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
                      Text('アプリ作ろうぜ！')
                    ],
                  )
                ],
              ),
            ),
          )),
    );
  }
}
