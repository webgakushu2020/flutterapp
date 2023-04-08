# クイズアプリを作ろう 08

## 08_diapchange

### 最終問題の表示切り替え

#### **【課題】**

- [ ] ①結果表示画面ResultPageを追加
- [ ] ②最終問題かどうかの判定用if文を追加 最終問題ならば総合結果表示ページへ（_AnswerPageState内）
- [ ] ③最終問題であれば、テキストを「結果表示」に変更（_AnswerPageState内）
- [ ] //★の部分を追加する

#### **【ポイント】**

- 変数_answerdispの値で最終問題かどうか判断する

#### **【ソースコード】**

```Dart

// _QuizListPageStateまで省略

class AnswerPage extends StatefulWidget {
  AnswerPage(this._result, this._quiznum);
  bool _result;
  int _quiznum;
  @override
  _AnswerPageState createState() => _AnswerPageState();
}

class _AnswerPageState extends State<AnswerPage> {
  Widget _resultText() {
    String _text = '';

    if (widget._result == true) {
      _text = '正解です！';
    } else {
      _text = '不正解です…';
    }

    return Text(_text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('結果'),
          automaticallyImplyLeading: false,
        ),
        body: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: _resultText(),
              ),
              ElevatedButton(
                onPressed: () {
                  // ★②最終問題かどうかの判定用if文を追加 最終問題ならば総合結果表示ページへ
                  if (widget._quiznum < 5) {
                    Navigator.of(context).pop(widget._quiznum);
                  } else {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return ResultPage();
                    }));
                  }
                },
                // ★③最終問題であれば、テキストを「結果表示」に変更
                child: Text(widget._quiznum < 5 ? '次の問題' : '総合結果'),
              )
            ],
          ),
        ));
  }
}

// ★①結果表示画面ResultPageを追加

class ResultPage extends StatefulWidget {
  const ResultPage({super.key});

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('総合結果'),
        automaticallyImplyLeading: false,
      ),
      body: Center(),
    );
  }
}

// ここまで
```

#### **【結果】**  

- [ ] 最終問題の場合「結果を表示」ボタンに切り替わること
- [ ] 「結果を表示」ボタンを押したとき、総合結果画面に遷移すること

![結果](img/08-1_result.png)
![結果](img/08-2_result.png)
