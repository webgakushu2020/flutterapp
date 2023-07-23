# **クイズアプリを作ろう 04**

## **問題を表示しよう QuizListPage.class**

<br>

① Listから１問目のデータを表示する

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
                  // ★① 問題表示
                  Text("第1問"),
                  const SizedBox(height: 10),
                  // ★① 問題文表示
                  Text(quizlist[0]["question"]),
                  const SizedBox(height: 10),
                ],
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              child: Text(quizlist[0]["answer1"]),
              style: ElevatedButton.styleFrom(
                primary: Colors.orange,
                onPrimary: Colors.white,
                fixedSize: Size(200, 50),
              ),
              onPressed: () async {},
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
