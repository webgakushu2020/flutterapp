# **クイズアプリを作ろう 01**

## **ベースを作ろう**

<br>

①ベースを作成  (▪️▪️▪️の部分を全て「StartPage」に変更)  
②最初の画面「StartPage」classを作成（枠のみ）  
②出題画面「QuizListPage」classを作成（枠のみ）  
③結果画面「ResultPage」classを作成（枠のみ）

<br>

#### **【ソースコード】**

```dart

// ★①コピペOK　↓ここから
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ▪️▪️▪️(),
    );
  }
}
//↑ここまで

// ★②「StartPage」classを作成
//コピペOK ↓ここから
class ▪️▪️▪️ extends StatefulWidget {
  const ▪️▪️▪️({super.key});

  @override
  _▪️▪️▪️State createState() => _▪️▪️▪️State();
}

class _▪️▪️▪️State extends State<▪️▪️▪️> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('クイズアプリ'),
      ),
      body: Center(),
    );
  }
}
//↑ここまで

// ★③「QuizListPage」classを作成
//「StartPage」classをコピーして、必要な箇所を変更する
// 「title」を変更しよう


// ★④「ResultPage」classを作成
//「StartPage」classをコピーして、必要な箇所を変更する
// 「title」を変更しよう

```

#### **【完成コード】**

```dart
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
  const StartPage({super.key});

  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('クイズアプリ'),
      ),
      body: Center(
        child: Column(
          children: [
            
          ]),
      ),
    );
  }
}

class QuizListPage extends StatefulWidget {
  const QuizListPage({super.key});

  @override
  _QuizListPageState createState() => _QuizListPageState();
}

class _QuizListPageState extends State<QuizListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('出題'),
        automaticallyImplyLeading: false,
      ),
      body: Center(),
    );
  }
}

class ResultPage extends StatefulWidget {
  const ResultPage({super.key});

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('結果表示'),
      ),
      body: Center(),
    );
  }
}

```
