import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.yellow, fontFamily: "ZenMaru"),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.yellow,
        fontFamily: 'ZenMaru',
      ),
      home: StartPage(),
    );
  }
}

class StartPage extends StatefulWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return QuizListPage();
          }));
        },
        child: Text('START'),
      )),
    );
  }
}

class QuizListPage extends StatefulWidget {
  const QuizListPage({Key? key}) : super(key: key);

  @override
  _QuizListPageState createState() => _QuizListPageState();
}

class _QuizListPageState extends State<QuizListPage> {
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
        title: Text('問題'),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(30.0),
              child: Text(quizlist[0]["question"]),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () {}, child: Text(quizlist[0]["answer1"])),
                ElevatedButton(
                    onPressed: () {}, child: Text(quizlist[0]["answer2"])),
                ElevatedButton(
                    onPressed: () {}, child: Text(quizlist[0]["answer3"])),
              ],
            ),
            Container(
              padding: EdgeInsets.only(top: 50),
              child: TextButton(
                  onPressed: Navigator.of(context).pop,
                  child: Text('STARTに戻る')),
            )
          ],
        ),
      ),
    );
  }
}
