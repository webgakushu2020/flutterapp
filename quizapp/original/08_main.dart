import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: StartPage(),
    );
  }
}

class StartPage extends StatefulWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return QuizListPage();
                },
              ),
            );
          },
          child: const Text('START'),
        ),
      ),
    );
  }
}

class QuizListPage extends StatefulWidget {
  const QuizListPage({super.key});

  @override
  _QuizListPageState createState() => _QuizListPageState();
}

class _QuizListPageState extends State<QuizListPage> {
  bool _kekka = true; //正解：true 不正解：false
  int _answercnt = 0; //何問目かListのindexに使用
  int _answerdisp = 1; //何問目か表示用

  List<Map<String, dynamic>> quilist = [
    {
      "question": "日本で１番高い山は？",
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
      "question": "3問目",
      "answer1": "①",
      "answer2": "②",
      "answer3": "③",
      "correct": 1
    },
    {
      "question": "４問目",
      "answer1": "①",
      "answer2": "②",
      "answer3": "③",
      "correct": 2
    },
    {
      "question": "5問目",
      "answer1": "①",
      "answer2": "②",
      "answer3": "③",
      "correct": 0
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('$_answerdisp問目'),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 8),
            Text(quilist[_answercnt]["question"]),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () async {
                if (quilist[_answercnt]["correct"] == 1) {
                  _kekka = true;
                } else {
                  _kekka = false;
                }
                //final returnText = await を　Navigetorの前につける
                final returnText = await Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return AnswerPage(_kekka, _answerdisp);
                    },
                  ),
                );
                //ここから↓
                if (returnText != null) {
                  //カウントアップした後再読み込み
                  setState(() {
                    _answercnt++;
                    _answerdisp++;
                  });
                }
                //ここまで↑
              },
              child: Text(quilist[_answercnt]["answer1"]),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () async {
                if (quilist[_answercnt]["correct"] == 2) {
                  _kekka = true;
                } else {
                  _kekka = false;
                }
                final returnText = await Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return AnswerPage(_kekka, _answerdisp);
                    },
                  ),
                );
                if (returnText != null) {
                  //カウントアップした後再読み込み
                  setState(() {
                    _answercnt++;
                    _answerdisp++;
                  });
                }
              },
              child: Text(quilist[_answercnt]["answer2"]),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () async {
                if (quilist[_answercnt]["correct"] == 3) {
                  _kekka = true;
                } else {
                  _kekka = false;
                }
                final returnText = await Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return AnswerPage(_kekka, _answerdisp);
                    },
                  ),
                );
                if (returnText != null) {
                  //カウントアップした後再読み込み
                  setState(() {
                    _answercnt++;
                    _answerdisp++;
                  });
                }
              },
              child: Text(quilist[_answercnt]["answer3"]),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: Navigator.of(context).pop,
              child: const Text('startに戻る'),
            ),
          ],
        ),
      ),
    );
  }
}

class AnswerPage extends StatefulWidget {
  AnswerPage(this._kekka, this._answerdisp);
  bool _kekka;
  int _answerdisp;

  @override
  _AnswerPageState createState() => _AnswerPageState();
}

class _AnswerPageState extends State<AnswerPage> {
  //----- 正解不正解表示　-----
  Widget _kekkaText() {
    if (widget._kekka) {
      return Text('正解です');
    } else {
      return Text('不正解です');
    }
  }

  //----- ボタンの表示を切り替える -----
  //★②最終問題のときは「結果を表示」とする
  //ここから↓
  Widget _buttonText() {
    if (widget._answerdisp < 5) {
      return Text('次の問題');
    } else {
      return Text('結果を表示');
    }
  }
  //ここまで↑

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
            const SizedBox(height: 8),
            _kekkaText(),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                //★③　　最終問題の場合はKekkaPageに画面遷移
                //Navigator.of(context).pop(widget._answerdisp);
                //ここから↓
                if (widget._answerdisp < 5) {
                  //前画面へ戻る（何問目かを返す）
                  Navigator.of(context).pop(widget._answerdisp);
                } else {
                  // 最終問題の場合　結果画面へ遷移
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return KekkaPage();
                      },
                    ),
                  );
                }
                //ここまで↑
              },
              //★①　ボタンの文字を切り替える　関数を作成
              //child: Text('次の問題'),削除
              child: _buttonText(),
            ),
          ],
        ),
      ),
    );
  }
}

//★④ 結果画面を追加
//ここから↓
class KekkaPage extends StatefulWidget {
  const KekkaPage({super.key});

  @override
  _KekkaPageState createState() => _KekkaPageState();
}

class _KekkaPageState extends State<KekkaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('総合結果'),
        automaticallyImplyLeading: false,
      ),
      body: Center(),
    );
  }
}
//ここまで↑
