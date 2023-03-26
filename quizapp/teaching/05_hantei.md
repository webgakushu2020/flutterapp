# クイズアプリを作ろう 05

## 05_hantei

### 正解不正解の判定処理

#### **【課題】**

- [ ] ①判定用の変数を宣言する
- [ ] ②正解か不正解か判定する
- [ ] ③判定した結果を次の画面に引数で渡す
- [ ] ④次の画面で結果を受け取る
- [ ] ⑤受け取った結果により、表示を変更
- [ ] ⑥表示切り替えは関数で行う
- [ ] //★の部分を追加する

#### **【ポイント】**

- 画面間のデータの流れを理解しよう
- 　

#### **【ソースコード】**

```Dart
class _QuizListPageState extends State<QuizListPage> {
  //★①変数宣言
  bool _kekka = true; //正解：true 不正解：false

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
        title: Text('問題表示'),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 8),
            Text(quilist[0]["question"]),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                //★② 正解不正解の判定 正解:true 不正解:false
                //★ １番のボタンが正解の場合は「correct」の値が１
                if (quilist[0]["correct"] == 1) {
                  _kekka = true;
                } else {
                  _kekka = false;
                }
                //ここまで↑
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      //★③ _kekkaを次の画面へ渡す
                      return AnswerPage(_kekka);
                    },
                  ),
                );
              },
              child: Text(quilist[0]["answer1"]),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                //★② 正解不正解の判定 正解:true 不正解:false
                //★ ２番のボタンが正解の場合は「correct」の値が２
                if (quilist[0]["correct"] == 2) {
                  _kekka = true;
                } else {
                  _kekka = false;
                }
                //ここまで↑
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      //★③ _kekkaを次の画面へ渡す
                      return AnswerPage(_kekka);
                    },
                  ),
                );
              },
              child: Text(quilist[0]["answer2"]),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                //★② 正解不正解の判定 正解:true 不正解:false
                //★ 3番のボタンが正解の場合は「correct」の値が3
                if (quilist[0]["correct"] == 3) {
                  _kekka = true;
                } else {
                  _kekka = false;
                }
                //ここまで↑
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      //★③ _kekkaを次の画面へ渡す
                      return AnswerPage(_kekka);
                    },
                  ),
                );
              },
              child: Text(quilist[0]["answer3"]),
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
  //★④ 前の画面から結果を受け取る
  //thisをつけて、このクラス内で使用する変数を作る
  AnswerPage(this._kekka);
  bool _kekka;

  @override
  _AnswerPageState createState() => _AnswerPageState();
}

class _AnswerPageState extends State<AnswerPage> {
// ---------------関数--------------
  //★⑥ if文で判定して、Widgetをreturnで返す
  //----- 正解不正解表示　-----
  Widget _kekkaText() {
    if (widget._kekka) {
      return Text('正解です');
    } else {
      return Text('不正解です');
    }
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
            const SizedBox(height: 8),
            //★⑤ 正解不正解の文字列を切り替える
            //widget内でDartプログラクラムを書くことができない　関数を作る
            //Text('結果表示'), を削除
            _kekkaText(),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {},
              child: Text('次の問題'),
            ),
          ],
        ),
      ),
    );
  }
}
```

#### **【結果】**  

- [ ] 回答ボタンを押した時、結果画面に遷移する

![結果](img/05-1_result.png)
![結果](img/05-2_result.png)
