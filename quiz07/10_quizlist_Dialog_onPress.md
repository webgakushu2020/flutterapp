# **クイズアプリを作ろう 10**

## **次の問題を表示する QuizListPage.class**

<br>

① onPressdで前画面に戻る処理を追加（popで戻る）  
② 同期処理を追加　（ダイアログで次の問題ボタンが押されるまで次の処理に行かないようにする）  
③「次の問題」ボタンが押された処理を追加
④「_listIndex」に１を足す（次の問題のインデックス番号にする）  
  「_selectButton」を初期化  

<br>

#### **【ソースコード】**

```dart

class _QuizListPageState extends State<QuizListPage> {
  int _listIndex = 0;
  int _selectButton = 0;
  String _kekkaText = "";
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

  // ★② 同期処理　「async」を追加
  void answerSelect() async {
    if (quizlist[_listIndex]["correct"] == _selectButton) {
      _kekkaText = "正解！";
      _correctCount++; //正解数をカウント
    } else {
      _kekkaText = "ざんねん・・・";
    }
    print(_kekkaText);

    // ★② 同期処理　「final rtext = await 」を追加
    final rtext = await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text(_kekkaText), //表示文字列
        actions: [
          TextButton(
            onPressed: () {
              // ★① 前の画面に戻る　引数に「_kekkaText」を返す
              Navigator.pop(context, _kekkaText);
            },
            child: Text("次の問題"), //ボタン
          )
        ],
      ),
    );
    // ★③ 次の問題が押されたとき　setStateで画面を再読み込み
    if (rtext != null) {
      setState(() {
        // ★④ インデックス番号を加算　回答ボタン番号を初期化
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
