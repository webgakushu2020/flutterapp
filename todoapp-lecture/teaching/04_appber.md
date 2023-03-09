# Todoアプリを作ろう 04

## 04_AppBer

### AppBerを追加

#### **【課題】**

- [ ] 下記の画面と同じ表示になるように、AppBerを追加
- まずはどこに追加したらよいか考えてみよう！

※※難しい場合は、下記ソースコードの「//★」の部分を見ながら追加してみよう

![課題画像](img/04_result.png)
  
#### **【ポイント】**

- [ ] appber,bodyの位置を再確認
- コードを書き写すだけでなく、思い出しながらコーディングすると上達します！

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
      // ★①appBarと、その中にタイトルを追加
      appBar: AppBar(
        title: Text('リスト一覧'),
      ),
      body: Center(
        child: Text('リスト一覧画面'),
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

- [ ] 画面上部にAppBerが表示されること

![結果](img/04_result.png)
