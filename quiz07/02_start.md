# **クイズアプリを作ろう 02**

## **スタートページをつくろう　StartPage.class**

<br>

①〜③スタートボタンのベースを作る  
④「START」ボタン押下時の処理を完成させる  

<br>

#### **【ソースコード】**

```dart
// 省略

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('クイズアプリ'),
      ),
      body: Center(
        // ★①コピペOK ↓ここから
        child: Column(
          children: [
            ElevatedButton(
              child: ★★②★★,
              style: ElevatedButton.styleFrom(
                ★★③★★
              ),
              onPressed: () {
                ★★④★★
              },
            ),
          ],
        ),
        //↑ここまで
      ),
    );
  }
}

// 省略

```

#### ★★②★★の部分を下のコードに置き換えよう

ボタンの文字を設定

```dart
const Text('START'),
```

#### ★★③★★の部分を下のコードに置き換えよう

ボタンのデザイン（参考）

```dart
primary: Colors.pink,
onPrimary: Colors.white,
fixedSize: Size(200, 50),
```

#### ★★④★★の部分を下のコードに置き換えよう

ボタンが押された時の処理

```dart
Navigator.of(context).push(
  MaterialPageRoute(
    builder: (context) {
      return QuizListPage();
    },
  ),
);
```

#### **【完成コード】**

```dart
class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('クイズアプリ'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              child: const Text('START'),
              style: ElevatedButton.styleFrom(
                primary: Colors.pink,
                onPrimary: Colors.white,
              ),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return QuizListPage();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
```
