<script type="text/x-mathjax-config">MathJax.Hub.Config({tex2jax:{inlineMath:[['\$','\$'],['\\(','\\)']],processEscapes:true},CommonHTML: {matchFontHeight:false}});</script>
<script type="text/javascript" async src="https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.1/MathJax.js?config=TeX-MML-AM_CHTML"></script>


# プログラミング競技について

## 問題文
複数の「マインスイーパー」の盤面データが与えられます。各盤面データについて地雷がありそうなセルを予測しながら、地雷以外の全部のセルを選択することを目指します。以下の「ルール」に従って、可能な限り多くのセルを選択し、高いスコアを目指して下さい。

## サンプル盤面
「マインスイーパー」の遊び方イメージを以下のサイトで体感することができます。今回のコンテストの出題形式に似せて事務局で作成したもので、盤面の様子や進行方法などはオリジナルとは異なっています。スマートフォンからもアクセスできます。
- **[「マインスイーパー」をお試し実行できるページ](msprog/mssample.html)**

## 操作方法
1. **「ボード選択」** からボードを選びます。サンプルボードをいくつかご用意しています。盤面のテキストファイルを作成すればファイルから読み込むことも可能です。
2. **「盤面データ表示切替」** をトグルすると盤面データの参照ができます。
3. 盤面データには「０」から「９」までの数字が含まれています。「０」から「８」までの「数字」は **隣接する８個のセルに含まれる地雷の数** を表します。地雷が周囲に存在しない場合、盤面データは空白ではなく「０」となってます。
4. 盤面データ「９」が含まれるセルは **地雷が置かれた状態** を示します。周囲の地雷の数ではありません。
5. 盤面のセル座標 (X,Y) は横方向 X、縦方向 Y で、左上が (0,0)、右下に向かって座標が１つずつ増えます。
6. セルをひとつずつ選択していきます。地雷以外の **未選択セル** がなくなれば終了です。スコアが表示されます。
7. 盤面データ「０」のセルを選択した場合は、周囲に地雷は存在しないため、地雷に近くなるまで再帰的に周囲のセルが選択されます。
8. 地雷を除く未選択のセル数が **「残りセル数」** に表示されます。
9. 地雷がありそうな場所に **旗を立てて** 選択できないようにすることができます。**「旗を立てる」** を ON にしてから当該セルを選択します。旗を解除するには再度「旗を立てる」を ON にして当該セルを選択します。旗が無くなればセル選択が可能になります。
10. 旗が立っているセルは選択できなくなりますが、周囲に「０」のセルがある場合は再帰的に選択されて旗が消えることがあります。
11. 途中で終了したい場合、一番下にある **「ここで採点」** をクリックすればスコアが表示されて終了となります。

## ルール・得点
- スコアは選択した盤面データの **数字の合計** です。ただし、次の場合はペナルティとして減算されます。
- 地雷を選択してしまった場合は **「２０」** の減点です。**地雷を選択しても終了にはなりません**。そのまま継続することができます。終了したい場合は **「ここで採点」** により明示的に終了可能です。
- 途中で終了した場合は、地雷を除く **全ての未選択セル分** が減点されます。
- 減点された結果、マイナスになった場合の **最終スコアは「０」** になります。
- 旗の有無はスコアには関係ありません。
- 与えられた盤面データを参照すれば、地雷の位置が容易に判明してしまいます。「マインスイーパー」を解くプログラムにおいては **地雷の位置は分からないものとして** 実装していただくようお願い致します。選択済みの領域から得られている情報を元に次の座標を列挙することは問題ありません。また、地雷を選択してしまった後に、その位置情報を利用することも問題ありません。
- 地雷を選択した場合の継続選択や未選択セルがある状態での途中終了は自由に決定できます。
- プログラムは **[paiza.IO 環境<sup>※</sup>](https://paiza.io/ja/projects/new)** で実行いただきます。paiza 環境の仕様に従い、**実行時間の最大値は2秒** です。
- 開発いただくプログラムは **入力として盤面データ** を読み込み、**出力として選択したセルの座標リスト** を生成します。
- 複数の盤面が与えられます。2秒以内により多くの問題を解いていただき、他の参加者よりも **合計のスコアが高くなる** ことを目指して下さい。

  ※ paiza.IOは **ブラウザだけで** プログラミングが始められる **オンラインのプログラム実行環境** です。無料で使用できます。ユーザー登録も不要です。
  下記「paiza.IO の使い方」もご覧いただければと思います。

## プログラムの入力
- **盤面データ** がプログラムの入力となります。以下の形式に従ったテキストファイルです。
- ファイルの読み込み方法は自由です。標準入力に与えても構いません。
- ひとつのファイルには **複数の盤面データ** が入っています。各盤面には **名前** が付いていますので、この名前で盤面を識別するようにプログラム実装をいただければと思います。
- 一度の読み込みで複数の盤面データを読み込めますので、「マインスイーパー」を解く際は **盤面を選んで** 実行いただければと思います。ひとつの盤面の実行が終わりましたら、連続して他の盤面を解いて下さい。盤面を実行する順番は自由で、全ての盤面を解く必要はありません。paize 環境の実行時間の最大値は **2秒** ですので、**その時間内で可能な限り** 解いていただければと思います。
- この制限時間内に解くことが可能な盤面数については、まだデータが取れていません。盤面数が足りない場合はADC事務局までご連絡をいただければと思います。

```
6 4 board_name     <-- 左から Xサイズ(横)、Yサイズ(縦)、盤面の名前がスペースで区切られています
011100             <-- X個の盤面データ、これは1行目
019100             <-- X個の盤面データ、これは2行目
011211             <-- X個の盤面データ、これは3行目
000191             <-- X個の盤面データ、これは4行目、Y 行目でこの盤面データは終了
                   <-- 空行を挟みます
4 4 board2         <-- 次の盤面データ、この要領で複数の盤面データを連続して記述
0111
1291
1921
1110
```

## プログラムの出力
- 「マインスイーパー」を解く際に選択した **セルの座標 (X, Y) リスト** がプログラムの出力となります。以下の形式に従って生成して下さい。
- X は横方向、盤面データのXサイズ側に相当します。Y は縦方向、盤面データのYサイズ側に相当します。
- 座標の原点は左上が (0, 0) です。右下に向かって座標が1つずつ増えていきます。最も右下の座標は (Xサイズ-1, Yサイズ-1) です。
- 出力方法は自由です。標準出力をファイルに落としても構いません。
```
6 4 board_name     <-- 左から Xサイズ(横)、Yサイズ(縦)、盤面の名前をスペースで区切ります。入力データの1行目と同じです。
2 1                < X=2, Y=1 のセルを選択
2 2                < X=2, Y=2 のセルを選択
1 1                < X=1, Y=1 のセルを選択
...
                   <-- 空行を挟みます
4 4 board2         <-- 次の盤面データ、この要領で複数のセル選択リストを記述
0 1
3 3
2 1
1 1
...
```

## スコアのカウント方法
- **スコアをカウントできるサイト** をご用意する予定です（まだ準備中です）。**「マインスイーパー」をお試し実行できるページ** の仕組みを利用して実際の盤面を駆動してスコアをカウントできるようにしたいと考えております。
- 上記「 **プログラムの出力** 」をファイルに落としていただき、上記サイトに入力いただきますと、**スコアがカウント** されます。
- 得られたスコアを参考に、プログラムをブラッシュアップいただければと思います。

## プログラム実行結果の提出について
- 提出方法については確定しましたら、こちらにお知らせいたします。
- 現時点では未確定ですが、以下の 1. 2. 3. のようなデータを **自己申告制** にて **ADC事務局に提出** いただく方向で検討中です。
- 上記の「スコアをカウントするサイト」が完成しましたら、そのサイトでスコアをカウントいただきますとスコアがわかりますので、最も良い結果を生成したプログラムに関して以下のデータを取得しておいていただければと思います。
1. paize サイトで実行した際の **実行時間**（paize 実行画面・右下に表示された値）
2. １の実行時間において解けた全問題の **合計スコア**
3. ２のスコア算出で使用した **プログラムの出力結果** （盤面ごとのセル選択座標リスト） 

## paize.IO の使い方
- **[paize.IO](https://paiza.io/ja/projects/new)** の詳細はサイトが提供する **[利用ガイド](https://paiza.io/help)** に記載がございます。以下は簡単な仕様の抜粋です。

  |項目|paizaの仕様|
  |---|---|
  |言語|33言語|
  |実行時間制限|2秒|
  |メモリ制限|512MB|
  |ソースコードサイズ制限|？(記載なし) |

  - ソースコードサイズについて、事務局では数MByte のコード(print 文を大量に記述したもの)について実行ができることは確認しています。
  
- 以下にサンプル画面とウィンドウ操作について簡単に説明します。

#### 言語を選ぶ
![言語選択画面例](images/paiza_view_1.PNG)

#### プログラムの実行
![実行画面例](images/paiza_view_2.PNG)
![ファイル入力画面例](images/paiza_view_3.PNG)

#### プログラムの実行時間
![実行時間表示画面例](images/paiza_view_4.PNG)
- 鍵マークはコードの公開・非公開を切り替えることができます。公開コードはすべての人の一覧に表示されますが、非公開コードはURLを知っている人だけがアクセスできます。例えば、公開はしたくないが何人かに知らせたい場合、非公開にしてURLのみ連絡することができます。非公開にしたからと言ってコードが見えなくなるわけではありません。URLを知っている人ならばだれでもアクセスが可能です。

#### セッション ID について
![セッションID表示画面例](images/paiza_view_5.PNG)
![セッションID削除画面例](images/paiza_view_6.PNG)

## 問い合わせ先
サイトがうまく動作しない、データが足りない、などお困りの場合やその他ご不明点等がございましたらお気軽に das”at”sig-sldm.org より、ADC 事務局あてご連絡をいただければと思います。（”at”は@に変換してください）。事務局メンバーより返信させていただきます。どうぞよろしくお願いいたします。
