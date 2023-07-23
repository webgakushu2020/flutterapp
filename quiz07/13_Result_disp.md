# **クイズアプリを作ろう 13**

## **正解率により表示を切り替える ResultPage.class**

<br>

① 何問中何問正解を表示  
② Widget関数「imagepass」を呼び出す（画像Widgetが返ってくる）  
③ 正解率により表示を切り替える処理を作る　imagepass関数内  
④ 「もう一回」ボタンが押された時の処理を追加


<br>

#### **【ソースコード】**

```dart
class _ResultPageState extends State<ResultPage> {
  // ★③ 正解率により画像を切り替える
  Widget imagepass() {
    var imagepath; //画像ファイルのパスを代入

    //正解率を求める
    var rate = widget._correctcnt / widget._quizlistCnt * 100;

    if (rate == 100) {
      imagepath = "images/yeah.png";
    } else {
      imagepath = "images/yeah2.png";
    }

    // 画像Widgetとして返す
    return Image.asset(
      imagepath,
      width: 300,
      height: 300,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('結果表示'),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 10),
            // ★① 結果表示
            Text(
              "${widget._quizlistCnt}問中${widget._correctcnt}問正解です",
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            const SizedBox(height: 10),
            // ★② 画像表示関数を呼び出し
            imagepass(),
            const SizedBox(height: 10),
            ElevatedButton(
              child: Text("もう一回"),
              style: ElevatedButton.styleFrom(
                primary: Colors.orange,
                onPrimary: Colors.white,
                fixedSize: Size(200, 50),
              ),
              onPressed: () {
                // ★④ 一番初めのページまで戻る
                Navigator.of(context).popUntil((route) => route.isFirst);
              },
            ),
          ],
        ),
      ),
    );
  }
}

```
