# Todoアプリを作ろう 03

## 03_back

### 遷移元のページに戻る

#### **【課題】**

- [ ] 下記コードの「//★」の部分を追記

#### **【ポイント】**

- [ ] 前の画面に戻るには　popを使う
- PUSHとPOPの仕組みを理解しよう

#### **【解説】**

popはスタック領域の一番上の画面情報を取り出す仕組みです。取り出された後にスタック領域の一番上にある画面情報が表示されます。

![結果](origin/02c_link.png)

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
```

#### **【結果】**  

- [ ] 「リスト追加画面（クリックで戻る）」ボタンが表示され、クリックすると元の画面に戻ること

![結果](origin/03_result.png)
