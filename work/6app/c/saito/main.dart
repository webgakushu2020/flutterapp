import 'dart:developer';
import 'dart:html';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SamplePage(),
    );
  }
}

class SamplePage extends StatefulWidget {
  const SamplePage({Key? key}) : super(key: key);

  @override
  State<SamplePage> createState() => _SamplePageState();
}

class _SamplePageState extends State<SamplePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow.shade50,
      appBar: AppBar(title: const Text('クイズアプリ')),
      body: Center(
        child: Column(
          children: [
            Container(
              width: 350,
              height: 100,
              padding: EdgeInsets.all(25),
              margin: EdgeInsets.only(top: 50),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width: 2,
                ),
              ),
              child: Text('hogehoge'),
            ),
            Container(
                margin: EdgeInsets.only(top: 300),
                child: SizedBox(
                    width: 350,
                    height: 100,
                    child: ElevatedButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return const CustomDialog();
                          },
                        );
                      },
                      child: const Text('コース一覧'),
                    )))
          ],
        ),
      ),
    );
  }
}

class CustomDialog extends StatelessWidget {
  const CustomDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      insetPadding: const EdgeInsets.all(32),
      content: SizedBox(
        width: 400,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text('コース選択'),
          ),
          body: Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return const NextDialog();
                    },
                  ),
                );
              },
              child: const Text('コース1'),
            ),
          ),
        ),
      ),
    );
  }
}

class NextDialog extends StatefulWidget {
  const NextDialog({super.key});

  @override
  _NextDialogState createState() => _NextDialogState();
}

class _NextDialogState extends State<NextDialog> {
  bool qaanswer = false;
  var count = 0;
  List<Map<String, dynamic>> question = [
    {
      'question': 'カラスの色は？',
      'answer1': '黒',
      'answer2': '白',
      'answer3': '青',
      'correctanswer': 0,
      'Commentary': 'あたりまえだけど黒です',
    },
    {
      'question': 'monndaibunn',
      'answer1': '0',
      'answer2': '1',
      'answer3': '2',
      'correctanswer': 0,
      'Commentary': 'あたりまえだけど黒です', //★エラーにならないように追加
    },
    {
      'question': 'monndaibunn',
      'answer1': '0',
      'answer2': '1',
      'answer3': '2',
      'correctanswer': 0,
      'Commentary': 'あたりまえだけど黒です', //★エラーにならないように追加
    },
    {
      'question': 'monndaibunn',
      'answer1': '0',
      'answer2': '1',
      'answer3': '2',
      'correctanswer': 0,
      'Commentary': 'あたりまえだけど黒です', //★エラーにならないように追加
    },
  ];

  //★ void → Futureに変更
  //★ async と awaitをつけて非同期処理（処理の順番をプログラムの上から下の順番じゃなく処理すること）
  Future<int> CorrectIncorrectAdvance(
      int buttonnumber, String commentary, count) async {
    if (question[count]['correctanswer'] == buttonnumber) {
      qaanswer = true;
    } else {
      qaanswer = false;
    }
    //★ Navigator.of(context).pop();
    //★　CorrectIncorrectjudgementクラスからの戻り値をdeliveryに代入
    final delivery = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return CorrectIncorrectjudgement(qaanswer, commentary, count);
        },
      ),
    );

    //★ 関数内でsetStateができないので、returnで値を返してからsetState
    //★nullをreturnで返すことができない（AppBerの戻るボタンを押した場合deliveryの中身がnullとなる
    if (delivery == null) {
      return 0;
    } else {
      return 1;
    }
  }

  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      child: Scaffold(
        backgroundColor: Colors.yellow.shade50,
        appBar: AppBar(
          centerTitle: true,
          title: const Text('クイズ'),
        ),
        body: Center(
            child: Column(
          children: [
            Container(
              width: 350,
              height: 180,
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.only(top: 50),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width: 1,
                ),
              ),
              child: Text(question[count]['question'] +
                  '\n' +
                  '1 ' +
                  question[count]['answer1'] +
                  '\n' +
                  '2 ' +
                  question[count]['answer2'] +
                  '\n' +
                  '3 ' +
                  question[count]['answer3']),
            ),
            Container(
                margin: EdgeInsets.only(top: 200),
                child: SizedBox(
                  width: 350,
                  height: 70,
                  child: ElevatedButton(
                    onPressed: () async {
                      //★ CorrectIncorrectAdvance関数の戻り値kekkaに代入
                      final kekka = await CorrectIncorrectAdvance(
                          0, question[count]['Commentary'], count);

                      //★ kekkaに値が入っている場合はカウントアップして再読み込み
                      if (kekka == 1) {
                        setState(() {
                          count++;
                        });
                      } else {
                        //★kekkaがない場合＝AppBerの戻るボタンが押された時の処理
                        //★初画面に戻すのであればここでPOP
                        // Navigator.of(context).pop();
                      }
                    },
                    child: Text('1'),
                  ),
                )),
            Container(
                margin: EdgeInsets.only(top: 50),
                child: SizedBox(
                  width: 350,
                  height: 70,
                  child: ElevatedButton(
                    onPressed: () {
                      CorrectIncorrectAdvance(
                          1, question[count]['Commentary'], count);
                    },
                    child: Text('2'),
                  ),
                )),
            Container(
                margin: EdgeInsets.only(top: 50),
                child: SizedBox(
                  width: 350,
                  height: 70,
                  child: ElevatedButton(
                    onPressed: () {
                      CorrectIncorrectAdvance(
                          2, question[count]['Commentary'], count);
                    },
                    child: Text('3'),
                  ),
                )),
          ],
        )),
      ),
    );
  }
}

class CorrectIncorrectjudgement extends StatefulWidget {
  CorrectIncorrectjudgement(this.qaanswer, this.commentary, this.count);
  bool qaanswer;
  String commentary;
  var count;

  @override
  _CorrectIncorrectjudgementState createState() =>
      _CorrectIncorrectjudgementState();
}

class _CorrectIncorrectjudgementState extends State<CorrectIncorrectjudgement> {
  Widget _CorrectIncorrect() {
    if (widget.qaanswer == true) {
      return Text('正解!');
    } else {
      return Text('不正解...');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow.shade50,
      appBar: AppBar(title: const Text('クイズアプリ')),
      body: Center(
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              width: 350,
              height: 100,
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.only(top: 50),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width: 1,
                ),
              ),
              child: _CorrectIncorrect(),
            ),
            Container(
              alignment: Alignment.center,
              width: 350,
              height: 300,
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.only(top: 100),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width: 1,
                ),
              ),
              child: Text(widget.commentary),
            ),
            const SizedBox(
              width: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 150,
                  height: 100,
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.only(top: 100),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 1,
                    ),
                  ),
                  child: Text('退出'),
                ),
                Container(
                    child: SizedBox(
                  width: 150,
                  height: 100,
                  child: ElevatedButton(
                    onPressed: () {
                      // widget.count++;
                      //★POPで戻す
                      Navigator.of(context).pop(widget.count);
                      // Navigator.of(context).push(
                      //   MaterialPageRoute(
                      //     builder: (context) {
                      //       return const NextDialog();
                      //     },
                      //   ),
                      // );
                    },
                    child: Text('続行'),
                  ),
                ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
