# クイズアプリを作ろう 02

## 02_quizlist

### 出題画面のベースをつくる

#### **【課題】**

- [ ] 出題画面のベースをつくる
- [ ] //★の部分を追加する

#### **【ポイント】**

- 新しいページを作る時は「class:StatefulWidget」と「class:State<>」を作るところから始めよう
- 　

#### **【ソースコード】**

```Dart
class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            //★クイズリストページに遷移
            //★ここから↓
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return QuizListPage();
                },
              ),
            );
            //★ここまで↑
          },
          child: const Text('START'),
        ),
      ),
    );
  }
}

//★ 出題画面を追加
//★ここから↓
class QuizListPage extends StatefulWidget {
  const QuizListPage({super.key});

  @override
  _QuizListPageState createState() => _QuizListPageState();
}

class _QuizListPageState extends State<QuizListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('問題表示'),
      ),
      body: Center(),
    );
  }
}
//★ここまで↑
```

#### **【結果】**  

- [ ] 「STAR」ボタンを押して出題画面に遷移すること  

![結果](img/02_result.png)
