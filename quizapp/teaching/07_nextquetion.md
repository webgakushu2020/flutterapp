# クイズアプリを作ろう 06

## 06_nextquetion

### 次の問題に切り替える

#### **【課題】**

- [ ] ①答えのカウント用、何問目かの表示用変数を作る
- [ ] ②配列のindex番号に変数を使用 [0]→「_answercnt」に。※5ヶ所あるよ
- [ ] ③Textの中身に_quiznumを使い、何問目かを表示
- [ ] ④戻るボタンを非表示に
- [ ] //★の部分を追加する

#### **【ポイント】**

- 出題は全て、QuizListPage画面を使用する
- 変数_answercntの値により問題を切り替える

#### **【ソースコード】**

```Dart
// QuizListPageまで省略

class _QuizListPageState extends State<QuizListPage> {
  // ★①答えのカウント用、何問目かの表示用変数を作る
  int _answercnt = 0;
  int _quiznum = 1;

  bool check(num) {
    bool _result = true;

    // ★②[0]→「_answercnt」に
    if (quizlist[_answercnt]["correct"] == num) {
      _result = true;
    } else {
      _result = false;
    }

    return _result;
  }

  List<Map<String, dynamic>> quizlist = [
    // 中身省略
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        // ★③Textの中身に_quiznumを使い、何問目かを表示
        title: Text('$_quiznum問目'),
        // ★④戻るボタンを非表示に
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(children: [
          Container(
            padding: EdgeInsets.all(30.0),
            // ★②[0]→「_answercnt」に
            child: Text(quizlist[_answercnt]["question"]),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return AnswerPage(check(1));
                        },
                      ),
                    );
                  },
                  // ★②[0]→「_answercnt」に
                  child: Text(quizlist[_answercnt]["answer1"])),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return AnswerPage(check(2));
                        },
                      ),
                    );
                  },
                  // ★②[0]→「_answercnt」に
                  child: Text(quizlist[_answercnt]["answer2"])),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return AnswerPage(check(3));
                        },
                      ),
                    );
                  },
                  // ★②[0]→「_answercnt」に
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
```

#### **【結果】**  

- [ ] １問目が表示され、回答により結果表示が変わること
- [ ] タイトルが１問目になっていること

![結果](img/06_result.png)
