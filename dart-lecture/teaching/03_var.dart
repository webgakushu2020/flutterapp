/*----------------------------------
  03_変数
----------------------------------

①varで作る「変数」
②constで作る「定数」
③finalで作る「定数」

＊ポイント＊
・データを入れる†領域†を作るよ
・型を決めてから作ることもできるし、おまかせすることもできるよ

----------------------------------

①varで作る「変数」

【コード】
void main() {
  var number = 5;
  print(number);

  // 値（データ）を入れ替えることができる！
  number = 1;
  print(number);
}

【出力結果】
5
1

＊ポイント＊
・var 名前 = 値;
・= ⇦「代入演算子」と呼ぶ ※1+2 = 3の比較に使う=とは違うよ！
・名前は「半角英数字」でつける

----------------------------------

②constで作る「定数」

【コード】
void main() {
  const String animal = '猫'; // 「文字列の型」と指定するとこうなる
  print(animal);

  // 値（データ）を入れ替えることはできない…
  animal = '犬'; // エラーが出るよ
  print(inu); // エラーが出るよ
}


【出力結果】
猫

＊ポイント＊
・constで作った†領域†は書き換えることができない…
・↑のことを「再代入」という

----------------------------------

③finalで作る「変数」

【コード】
void main() {
  final neko;
  neko = 1;
  print(neko);

  // 再代入することはできない…
  neko = 2; // エラーが出るよ
  print(neko); // エラーが出るよ
}


【出力結果】
1

＊ポイント＊
・†領域†を作るだけ作っておくことができる!
・1回入れたら、そのあと再代入はできない…

----------------------------------
  実際に書いてみよう！
----------------------------------*/

void main() {
  // ここに書いてね
}
