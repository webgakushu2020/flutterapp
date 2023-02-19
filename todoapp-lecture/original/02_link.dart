/*-------------------------------------
  todoアプリを作ろう
  02_link
    02_1.遷移ボタンを作る
    02_２.遷移先のベースを作る
    
    【課題】
    ・下記コードの「//★」の部分を追記しましょう
  
    【結果】
    ・画面右下にボタンが表示されること
    「02_result.png」参照

    【ポイント】
    ①ボタンを押したときの処理　onPress内に記述
    ②画面遷移先のclassを　pushで追加する
    「02c_link.png」参照
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
      ), //★ ←カンマ追加から↓↓↓
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
      //★　ここまで
    );
  }
}

//★リスト追加画面のベースを作る
class TodoAddPage extends StatelessWidget {
  const TodoAddPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
