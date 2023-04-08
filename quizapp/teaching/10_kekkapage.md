# クイズアプリを作ろう 09

## 09_kekkapage

### 総合結果画面

#### **【課題】**

- [ ] ①正解数をカウントする変数を作成（_QuizListPageState内）
- [ ] ②正解だったら、正解数を+1する（_QuizListPageState内）
- [ ] ③正解数を総合結果画面に渡す（_QuizListPageState内）
- [ ] ④正解数を受け取る（AnswerPage内）
- [ ] ⑤受け取った正解数の変数を作成（AnswerPage内）
- [ ] ⑥総合結果画面で正解数を受け取る（ResultPage内）
- [ ] ⑦結果表示(_ResultPageState内)
- [ ] //★の部分を追加する

#### **【ポイント】**

- 変数_answerdispの値で最終問題かどうか判断する

#### **【ソースコード】**

```Dart
// QuizListPageまで省略

class _QuizListPageState extends State<QuizListPage> {
  int _answercnt = 0;
  int _quiznum = 1;

  // ★①正解数をカウントする変数を作成
  int _correctcnt = 0;

  bool check(num) {
    bool _result = true;

    if (quizlist[_answercnt]["correct"] == num) {
      _result = true;
      // ★②正解だったら、正解数を+1する
      _correctcnt++;
    } else {
      _result = false;
    }

    return _result;
  }

  List<Map<String, dynamic>> quizlist = [
    {
      "question": "日本で一番高い山は？",
      "answer1": "北岳",
      "answer2": "富士山",
      "answer3": "奥穂高岳",
      "correct": 2
    },
    {
      "question": "日本で１番長い川は？",
      "answer1": "信濃川",
      "answer2": "利根川",
      "answer3": "石狩川",
      "correct": 1
    },
    {
      "question": "日本で一番広い湖は？",
      "answer1": "霞ヶ浦",
      "answer2": "サロマ湖",
      "answer3": "琵琶湖",
      "correct": 3
    },
    {
      "question": "日本で一番広い県は？",
      "answer1": "北海道",
      "answer2": "広島県",
      "answer3": "東京都",
      "correct": 1
    },
    {
      "question": "日本で一番小さい県は？",
      "answer1": "沖縄県",
      "answer2": "香川県",
      "answer3": "東京都",
      "correct": 2
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('$_quiznum問目'),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(children: [
          Container(
            padding: EdgeInsets.all(30.0),
            child: Text(quizlist[_answercnt]["question"]),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                  onPressed: () async {
                    final returnText = await Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          // ②正解数を結果画面に渡す
                          return AnswerPage(check(1), _quiznum, _correctcnt);
                        },
                      ),
                    );
                    if (returnText != null) {
                      setState(() {
                        _answercnt++;
                        _quiznum++;
                      });
                    }
                  },
                  child: Text(quizlist[_answercnt]["answer1"])),
              ElevatedButton(
                  onPressed: () async {
                    final returnText = await Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return AnswerPage(check(2), _quiznum, _correctcnt);
                        },
                      ),
                    );
                    if (returnText != null) {
                      setState(() {
                        _answercnt++;
                        _quiznum++;
                      });
                    }
                  },
                  child: Text(quizlist[_answercnt]["answer2"])),
              ElevatedButton(
                  onPressed: () async {
                    final returnText = await Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return AnswerPage(check(3), _quiznum, _correctcnt);
                        },
                      ),
                    );
                    if (returnText != null) {
                      setState(() {
                        _answercnt++;
                        _quiznum++;
                      });
                    }
                  },
                  child: Text(quizlist[_answercnt]["answer3"])),
            ],
          ),
          Container(
            padding: EdgeInsets.only(top: 50),
            child: TextButton(
              onPressed: Navigator.of(context).pop,
              child: Text('STARTに戻る'),
            ),
          )
        ]),
      ),
    );
  }
}

class AnswerPage extends StatefulWidget {
  // ★③正解数を受け取る
  AnswerPage(this._result, this._quiznum, this._correctcnt);
  bool _result;
  int _quiznum;
  // ★④受け取った正解数の変数を作成
  int _correctcnt;
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
                  if (widget._quiznum < 5) {
                    Navigator.of(context).pop(widget._quiznum);
                  } else {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      // ★⑤正解数を総合結果画面に渡す
                      return ResultPage(widget._correctcnt);
                    }));
                  }
                },
                child: Text(widget._quiznum < 5 ? '次の問題' : '総合結果'),
              )
            ],
          ),
        ));
  }
}

class ResultPage extends StatefulWidget {
  // ★⑤総合結果画面で正解数を受け取る const ResultPage({super.key}); を削除
  ResultPage(this._correctcnt);
  int _correctcnt;

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
      body: Center(
        // ★⑦結果表示
        child: Column(children: [
          Padding(
              padding: EdgeInsets.all(60),
              child: Text(widget._correctcnt.toString() + '問正解です\nお疲れ様でした！')),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
              child: Text('STARTに戻る'))
        ]),
      ),
    );
  }
}

```

#### **【結果】**  

- [ ] 総合結果画面の正解の数が表示されること
- [ ] startに戻るで初画面に戻ること

![結果](img/09_result.png)
