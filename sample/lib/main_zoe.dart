// flutterパッケージを読み込み
import 'package:flutter/material.dart';

// アプリ起動させる
void main() => runApp(MyApp());

// この中にWidgetを追加してアプリを作る
class MyApp extends StatelessWidget {
  @override
  // 中身を作成
  Widget build(BuildContext context) {
    // マテリアルデザインでアプリを作成
    return MaterialApp(
      // タイトル
      title: 'Profile',
      // テーマカラー
      theme: ThemeData(primarySwatch: Colors.blue),
      // Widgetを入れるツリー構造を作る
      home: Scaffold(
          backgroundColor: Color.fromARGB(255, 245, 255, 177),
          // 上のバー（タイトルなど入れる）
          appBar: AppBar(title: const Text('自己紹介')),
          // 本体部分 中央に配置
          // ignore: prefer_const_constructors, avoid_unnecessary_containers
          body: Center(
            child: Container(
              width: 300,
              height: 500,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 255, 222, 177),
                border: Border.all(color: Colors.brown, width: 2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Image.asset('images/sakura.jpg'),
                  Row(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const Text('名前'),
                      const Text('ぞえ'),
                    ],
                  ),
                  Row(
                    children: [
                      const Text('誕生日'),
                      const Text('1991/02/20'),
                    ],
                  ),
                  Row(
                    children: [
                      const Text('住居'),
                      const Text('東京都墨田区'),
                    ],
                  ),
                  Row(
                    children: [
                      const Text('趣味'),
                      const Text('競技プログラミング'),
                    ],
                  ),
                  Row(
                    children: [
                      const Text('一言'),
                      const Text('アプリつくろうぜ！'),
                    ],
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
