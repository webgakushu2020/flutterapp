/*-------------------------------------
  todoアプリを作ろう
  11_listadd
    リストデータを表示
    ・TodoListPage画面をStatefulに修正
    ・テキストデータを配列に入れる

    【課題】
    ・//★の部分を追加しましょう
  
    【結果】
    ・

    【ポイント】
    ①
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

//★① ここから
//リスト一覧画面でデータを扱えるようにする
class TodoListPage extends StatefulWidget {
  const TodoListPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TodoListPageState createState() => _TodoListPageState();
}
//★ ここまで

//★① Stateに修正
// class TodoListPage extends StatelessWidget {
// const TodoListPage({super.key});
class _TodoListPageState extends State<TodoListPage> {
  //★② Todoリストの配列宣言
  List<String> todoList = [];

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
        onPressed: () async {
          //Pushで新規画面に移動
          //pusuで帰ってきた値を変数に入れる
          final newListText = await Navigator.of(context).push(
            MaterialPageRoute(builder: (context) {
              //遷移先の画面としてリスト追加画面を指定
              return TodoAddPage();
            }),
          );
          //★② ここから
          //配列にデータを格納
          // ignore: unnecessary_null_comparison
          if (newListText != null) {
            setState(() {
              todoList.add(newListText as String);
            });
          }
          //★　ここまで
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

//StatefulWidgetに変更　データを扱えるようにする
class TodoAddPage extends StatefulWidget {
  const TodoAddPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TodoAddPageState createState() => _TodoAddPageState();
}

//StatelessWidgetをStateに変更
class _TodoAddPageState extends State<TodoAddPage> {
  //変数宣言 型を指定して変数宣言
  String _text = '';

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
            //入力されたテキストを表示 ここから
            Text(_text, style: TextStyle(color: Colors.blue)),
            const SizedBox(height: 8),
            //テキスト入力
            TextField(
              //入力されたテキストの値を受け取る　valueが入力されたテキスト
              onChanged: (String value) {
                //データが変更したことを知らせる（画面を更新する）
                setState(() {
                  _text = value;
                });
              },
            ),
            SizedBox(height: 8),
            // ignore: sized_box_for_whitespace
            Container(
              //横幅いっぱいに広げる
              width: double.infinity,
              //リスト追加ボタン
              child: ElevatedButton(
                onPressed: () {
                  //popで前の画面に戻る、引数にテキストデータを入れる
                  Navigator.of(context).pop(_text);
                },
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
