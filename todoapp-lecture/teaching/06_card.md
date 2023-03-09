# Todoアプリを作ろう 06

## 06_card

### リスト表示デザインの変更

#### **【課題】**

- [ ] リストの表示デザインをCard Widgetを使って変更
- 下記の画面と同じ表示になるように修正しましょう
- 下記ソースコードの「//★」の部分を見ながら追加してみよう

![課題画像](img/06_result.png)
  
#### **【ポイント】**

- 予測入力、コピペをうまく利用して効率よく入力してみよう
  
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
          // ★①TextをCard Widgetで囲う
          Card(
              // ★②ListTileの中にtitleを入れる
              child: ListTile(
            // ★③titleの次にTextを入れる
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
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return TodoAddPage();
          }));
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
```

#### **【結果】**  

- [ ] リストの表示デザインがCardになっていること

![結果](img/06_result.png)
