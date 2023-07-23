# **クイズアプリを作ろう 03**

## **クイズデータを作る QuizListPage.class**

<br>

①Map型List変数　「quizlist」を作成、問題データを作成  
②問題文を表示する枠を作成

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

  // ★① Map型List形式で問題作成
  List<Map<String, dynamic>> quizlist = [
    {
      "question": "日本一高い山は",   //問題文
      "answer1": "富士山",          //選択肢１
      "answer2": "北岳",            //選択肢２
      "answer3": "奥穂高岳",        //選択肢３
      "answer4": "間ノ岳",          //選択肢４
      "correct": 1                 //回答番号
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
        // ★②Centerの中に追加
        // コピペOK ↓ここから
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
                  // ここに何問目か表示
                  const SizedBox(height: 10),
                  // ここに問題文を表示
                  const SizedBox(height: 10),
                ],
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              child: Text('選択肢１'),
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
        // ↑ここまで
      ),
    );
  }
}

// 省略
```
