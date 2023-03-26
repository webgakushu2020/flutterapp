# クイズアプリを作ろう 01

## 01_base

### アプリのベースを作る

#### **【課題】**

- [ ] 新しくプロジェクトを作成
- quizappという名前でプロジェクトを作成

- [ ] 下記のソースコードをコピー
- 最初にmain.dartのコードを全て削除してから書こう

#### **【ポイント】**

- [ ] ベースは転用できるプログラムをコピーして再利用しよう
- [ ] 画面設計を作ってからコーディングを始めましょう

#### **【ソースコード】**

```Dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: StartPage(),
    );
  }
}

class StartPage extends StatefulWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {},
          child: const Text('START'),
        ),
      ),
    );
  }
}
```

#### **【結果】**  

- [ ] 実行して、「START」ボタンが表示されること  

![結果](img/01_result.png)
