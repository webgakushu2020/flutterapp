# クイズアプリを作ろう 04

## 04_fontchange

### フォントを変更しよう

#### **【課題】**

- [ ] Google fontsにあるフォントを設定しよう
- [ ] // ★の部分を追加

#### **【ポイント】**

- Google fontsから好きなフォントをダウンロードしよう
- zipを展開したら「fonts」フォルダを作って、移動しよう
- pubspec.yamlの以下のコメントアウトを外し、設定しよう

```Dart

  fonts:
    - family: フォント名
      fonts:
        - asset: fonts/（.ttfファイルの名前）

```

- ①ライトテーマのフォントを変更
- ②ダークテーマのフォントを変更
- 閉じてから、もう一度F5でビルドしよう

#### **【ソースコード】**

```Dart

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.yellow,

          // ★①ライトテーマのフォントを変更
          fontFamily: "ZenMaru"),
      darkTheme: ThemeData(
          brightness: Brightness.dark,
          primarySwatch: Colors.yellow,

          // ★②ダークテーマのフォントを変更
          fontFamily: 'ZenMaru',
      ),
      home: StartPage(),
    );
  }
}

```

#### **【結果】**  

- [ ] フォントが変わる
