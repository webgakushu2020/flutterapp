# Todoアプリを作ろう 10

## 10_datasend

### データの受け渡し

1. 入力されたテキストデータを引数として前の画面に渡す
2. 前の画面でデータを受け取る

#### **【課題】**

- [ ] 下記コードの「//★」の部分を追記
  
#### **【ポイント】**

- XXXXXXXXXXXXXX
  
#### **【ソースコード】**

```Dart
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
        //★② リスト追加画面から渡された値を受け取る
        onPressed: () async {
          //Pushで新規画面に移動
          //pusuで返ってきた値を変数に入れる
          final newListText = await Navigator.of(context).push(
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

//StatefulWidgetに変更　データを扱えるようにする
class TodoAddPage extends StatefulWidget {
  const TodoAddPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TodoAddPageState createState() => _TodoAddPageState();
}

//StatelessWidgetをStateに変更
class _TodoAddPageState extends State<TodoAddPage> {
  //① 変数宣言 型を指定して変数宣言
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
                  //★① ここから
                  //popで前の画面に戻る、引数にテキストデータを入れる
                  Navigator.of(context).pop(_text);
                  //★ ここまで
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
```

#### **【結果】**

- [ ] リスト追加ボタンを押すと、前の画面に戻ること

![結果](origin/10_datasend1.png)
![結果](origin/10_datasend2.png)
