/*-------------------------------------
  todoアプリを作ろう
  0８.stateful
    入力されたテキストの扱い

    【課題】
    ・StefulWidgetに変更
    ・//★の部分を追加しましょう
  
    【結果】


    【ポイント】
    ①データを扱うには　StatefulWidgetとStateを使う
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
      body: ListView(
        children: const <Widget>[
          Card(
            child: ListTile(
              title: Text('にんじんを買う'),
            ),
          ),
          Card(
            child: ListTile(
              title: Text('タマネギを買う'),
            ),
          ),
          Card(
            child: ListTile(
              title: Text('ジャガイモを買う'),
            ),
          ),
          Card(
            child: ListTile(
              title: Text('カレールーを買う'),
            ),
          ),
        ],
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

//★ StatefulWidgetに変更　データを扱えるようにする
class TodoAddPage extends StatefulWidget {
  const TodoAddPage({super.key});

  @override
  //「_」から始まる変数はプライベート変数　他のクラスからアクセス不可となる
  // ignore: library_private_types_in_public_api
  _TodoAddPageState createState() => _TodoAddPageState();
}

//★StatelessWidgetをStateに変更
//★ class TodoListPage extends StatelessWidget {
//★ const TodoAddPage({super.key});
class _TodoAddPageState extends State<TodoAddPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('リスト追加'),
      ),
      body: Container(
        //余白をつける
        padding: EdgeInsets.all(64),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //テキスト入力
            TextField(),
            SizedBox(height: 8),
            // ignore: sized_box_for_whitespace
            Container(
              //横幅いっぱいに広げる
              width: double.infinity,
              //リスト追加ボタン
              child: ElevatedButton(
                onPressed: () {},
                child: Text('リスト追加', style: TextStyle(color: Colors.white)),
              ),
            ),
            SizedBox(height: 8),
            // ignore: sized_box_for_whitespace
            Container(
              width: double.infinity,
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('キャンセル'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
