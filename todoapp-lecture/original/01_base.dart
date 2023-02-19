/*-------------------------------------
  todoアプリを作ろう
  01_base
    アプリのベースを作る

  【課題①】
  ・下のコードを写経しましょう

  【結果】
  ・実行して、「リスト一覧」の文字が表示されること
  「01_result.png」を参照

  【ポイント】
  ◆入力に慣れる
    バージョンやOSによって、コードの書き方が異なる場合がある
    ・赤色の波線が出た時・・・エラー・・・入力に誤りがないか確認
    ・緑色の波線が出た時・・・警告・・・エラーではないが正しい記述になっていない
      波線にカーソルを合わせて、電球アイコンから正しい記述を選択しましょう。
      どれを選んだらよいかわからない場合は講師質問しましょう
 --------------------------------------*/
import 'package:flutter/material.dart';

void main() {
  // 最初に表示するWidget
  runApp(MyTodoApp());
}

class MyTodoApp extends StatelessWidget {
  const MyTodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // アプリ名
      title: 'My Todo App',
      theme: ThemeData(
        // テーマカラー
        primarySwatch: Colors.blue,
      ),
      // リスト一覧画面を表示
      home: TodoListPage(),
    );
  }
}

class TodoListPage extends StatelessWidget {
  const TodoListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Text('リスト一覧画面'),
    ));
  }
}
