# Todoアプリを作ろう 09

## 09_text

### テキスト入力された時の処理

1. 入力されたテキストを表示
2. TextFieldのonChangeからテキストを受け取る

#### **【課題】**

- [ ] 下記コードの「//★」の部分を追記
  
#### **【ポイント】**

- XXXXXXXXXXXXXX
  
#### **【ソースコード】**

#### ★調査要 --- TextFiledにバグあり、入力した文字の変換がおかしい

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
            //★①　ここから
            //入力されたテキストを表示 ここから
            Text(_text, style: TextStyle(color: Colors.blue)),
            const SizedBox(height: 8),
            //★ ここまで

            //テキスト入力
            TextField(
              //★②　ここから
              //入力されたテキストの値を受け取る　valueが入力されたテキスト
              onChanged: (String value) {
                //データが変更したことを知らせる（画面を更新する）
                setState(() {
                  _text = value;
                });
              },
              //★ ここまで
            ),
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
```

#### **【結果】**

- [ ] 入力したテキストが入力フィールドの上に表示されること

![結果](img/09_result.png)
