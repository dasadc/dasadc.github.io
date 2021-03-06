# DAシンポジウム2018 アルゴリズムデザインコンテスト

このサイトでは、[DAシンポジウム2018](http://www.sig-sldm.org/das/)で行うアルゴリズムデザインコンテスト(ADC)の参加者向け解説、およびコンテスト内にて使用する「自動運営システム」についての解説を行います。

## ←→ DAシンポジウム2018 [ADC問題コンテスト](https://dasadc.github.io/adc2018/exam.html)

## 最新情報

- 2018-10    開催結果を掲載
- 2018-07-16 [解答チェックツール(nlcheck.py)](https://dasadc.github.io/adc2018/nlcheck.html)を更新しました
- 2018-06-12 2018年は解答者側だけでなく、[出題者側の「ADC問題コンテスト」](https://dasadc.github.io/adc2018/exam.html)も実施致します
- 2018-05-07 2018年の解の品質の式を公開しました
- 2018-04-27 初版を公開しました

## 概要

DAシンポジウムでは、2012年よりデザインコンテストを開催しております。コンテスト参加者の皆様には、あらかじめ出題される課題に対して解法を工夫していただき、解法を実現するプログラムを作成していただきます。DAシンポジウム会期中に行われるADCセッションでは、参加チームの間でコンペティションを行っていただき、審査によって、下記の賞を授与いたします。

- 最優秀賞
  - 規定時間内で最高得点を獲得したチームに授与します。同点の場合は、最も早くその点数を獲得したチームに授与します。
  - 運営側参加チームは対象外とします。
- 特別賞
  - 方式のオリジナリティやコストパフォーマンス等の観点で独創性を持った手段を用いたチームに授与します。開催当日のポスターセッションの内容と競技の得点によって審査します。

## コンテスト参加方法

ADCへの参加を希望する方は、DAシンポジウム2018の発表申込フォームより申し込みください。
[論文募集ページ](http://www.sig-sldm.org/das/CFP.html)（申し込み締切 ~~2018年6月17日~~ 2018年7月8日）

<!---- なお、コンテスト参加者は、DAシンポジウム2018への参加申し込み（申し込みフォームは6月中に開設予定）も必須となります。よろしくお願いいたします。 --->
なお、コンテスト参加者は、DAシンポジウム2018への参加申し込みも必須となります。よろしくお願いいたします。

## 2018年度 ADC 競技内容：3次元IC接続、ビア位置指定なし

2018年のテーマは、昨年に引き続き、「ナンバーリンク」の解を、自動で求めるシステムのデザイン(設計)です。ナンバーリンクとは、マス目内に数字が配置され、同じ数字の間を、縦横の線で重ならないように結ぶパズルであり、電子回路の自動配線と非常に親和性が高い問題です。

2015年には、「解の品質」を導入し、複数の解がある場合に、もっとも品質のよい解を求めることを目指しました。

<!---    （解の品質） ＝ １／（（線長の合計）＋（線が曲がった回数）） --->

2016年には、3D配線問題を模した形式に拡張しました。その際、盤面間を接続するマス
(ビアと呼ぶ)の位置は予め指定されていました。

2017年には、ビアの位置を指定せず、自由に選べるようにしました(線の端点が直接ビアに接続されるのも可)。また、盤面サイズの最大値を36X36から72X72に拡大しました。

![theme](images/image1.gif "theme")

2017年のADCでは、残念ながら全問正解するチームはありませんでした。そこで、2018年は、基本的なルールおよび問題サイズは2017年を踏襲するものとします。ただし、解の品質に関して、以下の評価項目を付け加えます。

    Z平面において、縦方向（Y方向）、横方向（X方向）に5マス以上、他の線と隣接している境界の数が少ないこと

![neighbor](images/rule-neighbor3.png "neighbor")

上図(1)、上図(3)は線長の合計と線が曲った回数は同じですが、5マス以上隣接している境界の数が19と0で異なります。(3)の方が品質がよいものとします。
上図(2)のLINE1とLINE2のように、一旦離れて再度隣接した場合は合計でカウントします。

この制約は、LSIチップにおけるクロストーク問題の影響をできるだけ小さくするため、ある2つの配線が平行して通る長さを短くするように配線することを意識した指標です。また、この評価指標は、Z方向の各配線層内のみで適用するものとします。異なるZ平面で配線が隣接していてもカウントしません。

これに合わせて、2018年の解の品質の式は、以下のようになります。

    （解の品質） ＝ １／（（線長の合計）＋（線が曲がった回数）＋ ａ×（隣接配線境界数））
    2018年は係数ａ＝１／３

## ルールの詳細

- [ルールの詳細](rule.md)

## 参考情報

- [ソルバー作成に参考になる情報](ref.md)

## 自動運営システム

- [自動運営システム](conmgr.md)

## 開催結果

- [結果PDF](ADC2018_result.pdf)
- [問題](Questions_2018.zip)
- [解答例](Answers_2018.zip)

---
※ 「ナンバーリンク」は株式会社ニコリの登録商標です。

Copyright (c) 2018 DAシンポジウム実行委員会
