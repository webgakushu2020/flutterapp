# Todoアプリを作ろう 11

## 11_listadd

### リストデータを表示

1. TodoListPage画面をStatelessWidget⇨StatefulWidgetに変更
2. 変数を作り、}を閉じる
3. class _TodoListPageStateを作成
4. Todoリストの配列を作成
5. overrideを記載
6. 配列にデータを格納

#### **【課題】**

- [ ] 下記コードの「//★」の部分を追記
  
#### **【ポイント】**

- 「配列」や「if文（条件分岐）」が出てくるよ！忘れてしまってたら、Dartの教科書をもう一度復習しよう！
  
#### **【ソースコード】**

```Dart
import 'package:flutter/material.dart';

void main() {
  runApp(MyTodoApp());
}

class MyTodoApp extends StatelessWidget {
  const MyTodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Todo App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TodoListPage(),
    );
  }
}

// ★①StatelessWidget⇨StatefulWidgetに変更
class TodoListPage extends StatefulWidget {
  const TodoListPage({super.key});

  @override
  // ★②変数を作り、}を閉じる
  _TodoListPageState createState() => _TodoListPageState();
}

// ★③class _TodoListPageStateを作成
class _TodoListPageState extends State<TodoListPage> {
  // ★④Todoリストの配列を作成
  List<String> todoList = [];

  // ★⑤overrideを記載

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
          )),
          Card(
              child: ListTile(
            title: Text('タマネギを買う'),
          )),
          Card(
              child: ListTile(
            title: Text('ジャガイモを買う'),
          )),
          Card(
              child: ListTile(
            title: Text('カレールーを買う'),
          )),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newListText = await Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) {
            return TodoAddPage();
          }));

          // ★⑥配列にデータを格納
          // if文のことを思い出そう…
          if (newListText != null) {
            setState(() {
              todoList.add(newListText as String);
            });
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class TodoAddPage extends StatefulWidget {
  const TodoAddPage({super.key});

  @override
  _TodoAddPageState createState() => _TodoAddPageState();
}

class _TodoAddPageState extends State<TodoAddPage> {
  String _text = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('リスト追加'),
      ),
      body: Container(
        padding: EdgeInsets.all(60),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_text, style: TextStyle(color: Colors.blue)),
            SizedBox(height: 8),
            TextField(
              onChanged: (String value) {
                setState(() {
                  _text = value;
                });
              },
            ),
            SizedBox(height: 8),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop(_text);
                },
                child: Text(
                  'リスト追加',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 8),
            Container(
                width: double.infinity,
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('キャンセル'),
                ))
          ],
        ),
      ),
    );
  }
}

```

#### **【結果】**

- [ ] 今のところ変化なし