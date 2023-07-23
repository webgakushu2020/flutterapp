# **クイズアプリを作ろう 07**

## **選択肢を増やそう　 QuizListPage.class**

<br>

① for文を使って、選択肢ボタンを４つに増やす  
② Mapのkey「answer`1`」「answer`2`」「answer`3`」「answer`4`」の数字の部分を変数`i`に置き換える  
③ 「_selectButton」の値を`i`に置き換える

<br>

#### **【ソースコード】**

```dart

class _QuizListPageState extends State<QuizListPage> {
  int _listIndex = 0;
  int _selectButton = 0;

  List<Map<String, dynamic>> quizlist = [
    {
      "question": "日本一高い山は",
      "answer1": "富士山",
      "answer2": "北岳",
      "answer3": "奥穂高岳",
      "answer4": "間ノ岳",
      "correct": 1
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
