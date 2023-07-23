# **クイズアプリを作ろう 11**

## **最終問題のときの判定を追加しよう QuizListPage.class**

<br>

① 変数「_quizlistCnt」を作成し、問題数を代入  
② 変数「_quizlistEndIndex」を作成し、最終問題のインデックス番号を代入  
③ 最終問題の判定  
④ 変数「_nextText」を作成し、ボタン名を代入する  
⑤ ボタン名を「_nextText」に置き換える

<br>

#### **【ソースコード】**

```dart

class _QuizListPageState extends State<QuizListPage> {
  int _listIndex = 0;
  int _selectButton = 0;
  String _kekkaText = "";
  int _correctCount = 0;
  // ★④ ボタンの文字列を代入
  String _nextText = "";

  List<Map<String, dynamic>> quizlist = [
    {
      "question": "日本一高い山は", //問題文
      "answer1": "富士山", //選択肢１
      "answer2": "北岳", //選択肢２
      "answer3": "奥穂高岳", //選択肢３
      "answer4": "間ノ岳", //選択肢４
      "correct": 1 //回答番号
    },
    {
      "question": "問題２",
      "answer1": "答え１",
      "answer2": "答え２",
      "answer3": "答え３",
      "answer4": "答え４",
      "correct": 4
    },
    {
      "question": "問題３",
      "answer1": "答え１",
      "answer2": "答え２",
      "answer3": "答え３",
      "answer4": "答え４",
      "correct": 2
    },
    {
      "question": "問題４",
      "answer1": "答え１",
      "answer2": "答え２",
      "answer3": "答え３",
      "answer4": "答え４",
      "correct": 3
    },
    {
      "question": "問題５",
      "answer1": "答え１",
      "answer2": "答え２",
      "answer3": "答え３",
      "answer4": "答え４",
      "correct": 2
    },
  ];

  void answerSelect() async {
    // ★① 問題数をquizlist配列から取得する
    int _quizlistCnt = quizlist.length;
    // ★② 最終問題のインデックス番号を取得する
    int _quizlistEndIndex = quizlist.length - 1;

    if (quizlist[_listIndex]["correct"] == _selectButton) {
      _kekkaText = "正解！";
      _correctCount++; //正解数をカウント
    } else {
      _kekkaText = "ざんねん・・・";
    }

    // ★③ 最終問題の判定
    if (_listIndex == _quizlistEndIndex) {
      // ★④ 結果を代入
      _nextText = "結果発表";
    } else {
      _nextText = "次の問題";
    }

    final rtext = await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text(_kekkaText), //表示文字列
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context, _kekkaText);
            },
            // ★⑤ _nextTextに置き換える
            child: Text(_nextText), //ボタン
          )
        ],
      ),
    );
    if (rtext != null) {
      setState(() {
        _listIndex++;
        _selectButton = 0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('出題'),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              width: double.infinity,
              height: 200,
              color: Colors.yellow,
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  Text("第${_listIndex + 1}問"),
                  const SizedBox(height: 10),
                  Text(quizlist[_listIndex]["question"]),
                  const SizedBox(height: 10),
                ],
              ),
            ),
            const SizedBox(height: 30),
            for (int i = 1; i <= 4; i++) ...{
              ElevatedButton(
                child: Text(quizlist[_listIndex]["answer$i"]),
                style: ElevatedButton.styleFrom(
                  primary: Colors.orange,
                  onPrimary: Colors.white,
                  fixedSize: Size(200, 50),
                ),
                onPressed: () async {
                  _selectButton = i;
                  answerSelect();
                },
              ),
              const SizedBox(height: 20),
            }
          ],
        ),
      ),
    );
  }
}

```
