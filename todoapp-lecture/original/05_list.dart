/*-------------------------------------
  todoアプリを作ろう
  05.list
    リスト表示
    
    【課題】
    ①TodoListPage画面をスクロール可能なリスト表示に変更しましょう
    ②「05_result.png」参照し同じ表示になるように修正しましょう

    ※難しい場合は、下記コードの「//★」の部分を確認して修正してもよいです
  
    【結果】
    ・リスト表示されること

    【ポイント】
    ①スクロール表示したい場合はListViewを使う
    ②リスト表示の方法をおさらいしましょう
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
      appBar: AppBar(
        title: Text('リスト一覧'),
      ),
      //★① Center→ListViewに変更
      body: ListView(
        //★ リスト追加ここから
        children: const <Widget>[
          Text('にんじんを買う'),
          Text('タマネギを買う'),
          Text('ジャガイモを買う'),
          Text('カレールーを買う'),
        ],
        //★ リスト追加ここまで
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //Pushで新規画面に移動
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) {
              //遷移先の画面としてリスト追加画面を指定
              return TodoAddPage();
            }),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class TodoAddPage extends StatelessWidget {
  const TodoAddPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('リスト追加画面（クリックで戻る）'),
        ),
      ),
    );
  }
}
