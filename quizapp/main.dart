import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.yellow, fontFamily: "kiwimaru"),
      darkTheme: ThemeData(
          brightness: Brightness.dark,
          primarySwatch: Colors.yellow,
          fontFamily: "kiwimaru"),
      home: const StartPage(),
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
        ),
      ),
    );
  }
}

class QuizListPage extends StatefulWidget {
  const QuizListPage({Key? key}) : super(key: key);

  @override
  _QuizListPageState createState() => _QuizListPageState();
}

class _QuizListPageState extends State<QuizListPage> {
  int _answercnt = 0;
  int _quiznum = 1;
  int _correctcnt = 0;

  bool check(num) {
    bool _result = true;

    if (quizlist[_answercnt]["correct"] == num) {
      _result = true;
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
  AnswerPage(this._result, this._quiznum, this._correctcnt);
  bool _result;
  int _quiznum;
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
