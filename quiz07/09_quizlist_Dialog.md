# **クイズアプリを作ろう 09**

## **結果をダイアログに表示しよう QuizListPage.class**

<br>

①　変数「_kekkaText」を作成し、初期値に空白を代入  
②　変数「_correctCount」を作成し、初期値に０を代入  
③　「answerSelect」関数の中で、正解・不正解の判定を追加
④ 「showDialog」を追加し「_kekkaText」を表示する  

<br>

#### **【ソースコード】**

```dart

class _QuizListPageState extends State<QuizListPage> {
  int _listIndex = 0;
  int _selectButton = 0;
  // ★① 「正解」「ざんねん」の文字列を入れる変数を作成
  String _kekkaText = "";
  // ★② 正解数をカウントする変数を作成 
  int _correctCount = 0;

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

  void answerSelect() {
    // ★③ 正解番号と押したボタンの数値が一致したら「正解」
    if (quizlist[_listIndex]["correct"] == _selectButton) {
      _kekkaText = "正解！";
      _correctCount++; //正解数をカウント
    } else {
      _kekkaText = "ざんねん・・・";
    }

    // ★④ ダイアログ表示
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text(_kekkaText),  //表示文字列
        actions: [
          TextButton(
            onPressed: () {},
            child: Text("次の問題"),  //ボタン
          )
        ],
      ),
    );
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
