# **クイズアプリを作ろう 0６**

## **選択肢ボタンが押された時の処理をつくろう　QuizListPage.class**

<br>

① 変数「_selectButton」を作成し、初期値に０を代入  
② 選択肢ボタンが押されたら、ボタンの番号を_selectButtonに代入する

<br>

#### **【ソースコード】**

```dart

// 省略

class QuizListPage extends StatefulWidget {
  const QuizListPage({super.key});

  @override
  _QuizListPageState createState() => _QuizListPageState();
}

class _QuizListPageState extends State<QuizListPage> {
  int _listIndex = 0;
  // ★①　選択肢ボタンの番号
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
                  Text("第" + (_listIndex + 1).toString() + "問"),
                  const SizedBox(height: 10),
                  Text(quizlist[_listIndex]["question"]),
                  const SizedBox(height: 10),
                ],
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              child: Text(quizlist[_listIndex]["answer1"]),
              style: ElevatedButton.styleFrom(
                primary: Colors.orange,
                onPrimary: Colors.white,
                fixedSize: Size(200, 50),
              ),
              onPressed: () async {
                // ★①　何番目のボタンが押されたか代入
                _selectButton = 1;
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

// 省略

```
