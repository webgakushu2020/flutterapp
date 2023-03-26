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
            showDialog(
              context: context,
              builder: (context) {
                return const QuizListPage();
              },
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
  //int _allcount = 5; //ステップアップ：配列の数を自動取得にする
  int _answercnt = 0; //何問目かListのindexに使用
  int _answerdisp = 1; //何問目か表示用
  bool _kekka = true; //正解：true 不正解：false
  var _seikaicnt = 0; //正解した数をカウント

  List<Map<String, dynamic>> quilist = [
    {
      "question": "日本で１番高い山は？",
      "answer1": "北岳",
      "answer2": "富士山",
      "answer3": "奥穂高岳",
      "correct": 1
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
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 8),
            Text(quilist[_answercnt]["question"]),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () async {
                // 正解不正解の判定 正解:true 不正解:false
                // １番のボタンが正解の場合は「correct」の値が１
                if (quilist[_answercnt]["correct"] == 1) {
                  _kekka = true;
                  _seikaicnt++;
                } else {
                  _kekka = false;
                }
                //AnswerPage からの戻り値をreturnTextに格納
                final returnText = await Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return AnswerPage(_kekka, _answercnt, _seikaicnt);
                    },
                  ),
                );
                //AnswerPageから戻り値がある場合が次の問題にカウントアップ
                //AppBerから戻った場合はここは通らない（問題のカウントアップをしないので次の問題に切り替わらない）
                if (returnText != null) {
                  //カウントアップした後再読み込み
                  setState(() {
                    _answercnt++;
                    _answerdisp++;
                  });
                }
              },
              child: Text(quilist[_answercnt]["answer1"]),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () async {
                // 正解不正解の判定 正解:true 不正解:false
                // ２番のボタンが正解の場合は「correct」の値が２
                if (quilist[_answercnt]["correct"] == 2) {
                  _kekka = true;
                  _seikaicnt++;
                } else {
                  _kekka = false;
                }
                //AnswerPage からの戻り値をreturnTextに格納
                final returnText = await Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return AnswerPage(_kekka, _answercnt, _seikaicnt);
                    },
                  ),
                );
                if (returnText != null) {
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
                // 正解不正解の判定 正解:true 不正解:false
                // １番のボタンが正解の場合は「correct」の値が３
                if (quilist[_answercnt]["correct"] == 3) {
                  _kekka = true;
                  _seikaicnt++;
                } else {
                  _kekka = false;
                }
                //AnswerPage からの戻り値をreturnTextに格納
                final returnText = await Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return AnswerPage(_kekka, _answercnt, _seikaicnt);
                    },
                  ),
                );
                if (returnText != null) {
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
  // ここにイニシャライザを書く
  //元の画面からデータ受け取る
  AnswerPage(this._kekka, this._answercnt, this._seikaicnt);
  bool _kekka;
  int _answercnt;
  int _seikaicnt;

  @override
  _AnswerPageState createState() => _AnswerPageState();
}

class _AnswerPageState extends State<AnswerPage> {
  // ---------------関数--------------
  Widget _kekkaText() {
    if (widget._kekka) {
      return Text('正解です');
    } else {
      return Text('不正解です');
    }
  }

  Widget _buttonText() {
    if (widget._answercnt < 4) {
      return Text('次の問題');
    } else {
      return Text('結果を表示');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('結果'),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 8),
            //Widgetの中でDart使う場合は関数を作ってTextを返す
            _kekkaText(),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                if (widget._answercnt < 4) {
                  //全画面へ戻る（何問目かを返す）　　AppBerから戻った場合はpopの引数なしで戻る
                  Navigator.of(context).pop(widget._answercnt);
                } else {
                  // 最終問題の場合　結果画面へ遷移
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return KekkaPage(widget._seikaicnt);
                      },
                    ),
                  );
                }
              },
              child: _buttonText(),
            ),
          ],
        ),
      ),
    );
  }
}

class KekkaPage extends StatefulWidget {
  // const KekkaPage({super.key});
  KekkaPage(this._seikaicnt);
  int _seikaicnt;

  @override
  _KekkaPageState createState() => _KekkaPageState();
}

class _KekkaPageState extends State<KekkaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('総合結果'),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 8),
            // intからstring型に変換して表示
            Text(widget._seikaicnt.toString() + '問正解です'),
            const SizedBox(height: 8),
            Text('おつかれさまでした!'),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
              child: const Text('startに戻る'),
            ),
          ],
        ),
      ),
    );
  }
}
