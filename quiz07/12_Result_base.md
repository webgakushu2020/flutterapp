# **クイズアプリを作ろう 12**

## **結果発表ページを表示しよう ResultPage.class**

<br>

① 「次の問題」と「結果発表」の飛び先を切り替える  
② 問題数と正解数を引数で渡す  
③ ResultPageで引数データを受け取る  
④ 表示の枠を作る

<br>

#### **【ソースコード】**

```dart
// answerSelect関数内

void answerSelect() async {
    int _quizlistCnt = quizlist.length;
    int _quizlistEndIndex = quizlist.length - 1;

    if (quizlist[_listIndex]["correct"] == _selectButton) {
      _kekkaText = "正解！";
      _correctCount++; //正解数をカウント
    } else {
      _kekkaText = "ざんねん・・・";
    }

    if (_listIndex == _quizlistEndIndex) {
      _nextText = "結果発表";
    } else {
      _nextText = "次の問題";
    }

    final rtext = await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text(_kekkaText), //表示文字列
        actions: [
          TextButton(
            onPressed: () {
              // ★① 最終問題のとき
              if (_listIndex == _quizlistEndIndex) {
                //結果ページに飛ぶ
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      // ★② 問題数と正解数を引数で渡す
                      return ResultPage(_quizlistCnt, _correctCount);
                    },
                  ),
                );
              } else {
                //一つ前に戻る
                Navigator.pop(context, _kekkaText);
              }
            },
            child: Text(_nextText), //ボタン
          )
        ],
      ),
    );
    if (rtext != null) {
      setState(() {
        _listIndex++;
        _selectButton = 0;
      });
    }
  }

```

```dart
// ResultPage関数内

class ResultPage extends StatefulWidget {
  // ★③ 引数を受け取る　const ResultPage({super.key});を書き換える
  ResultPage(this._quizlistCnt, this._correctcnt); // thisで受け取る
  int _quizlistCnt; //データの型を指定
  int _correctcnt; //データの型を指定

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('結果表示'),
      ),
      body: Center(
        // ★④ 表示の枠を作る　コピペOK ↓ここから
        child: Column(
          children: [
            const SizedBox(height: 10),
            Text(
              "何問中何問正解",
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            const SizedBox(height: 10),
            //画像を表示
            const SizedBox(height: 10),
            ElevatedButton(
              child: Text("もう一回"),
              style: ElevatedButton.styleFrom(
                primary: Colors.orange,
                onPrimary: Colors.white,
                fixedSize: Size(200, 50),
              ),
              onPressed: () {},
            ),
          ],
        ),
        // ★ ↑ここまで
      ),
    );
  }
}
```
