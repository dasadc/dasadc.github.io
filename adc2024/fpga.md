<script type="text/x-mathjax-config">MathJax.Hub.Config({tex2jax:{inlineMath:[['\$','\$'],['\\(','\\)']],processEscapes:true},CommonHTML: {matchFontHeight:false}});</script>
<script type="text/javascript" async src="https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.1/MathJax.js?config=TeX-MML-AM_CHTML"></script>

# FPGA競技について

# 提供物
[model.tar.gz](adc2024/model.tar.gz)からダウンロードしてください。


# ソースファイルについて
- TOP_MODEL.v  
  最上位のwrapper
- test_top_model.v  
  TOP_MODELの実体。中でBOARD.vなどを呼び出す。
- ★ BOARD.v  
   board構造体。内部に9x9(x4bit)の数値を格納した状態で開始する。
- GETEMPTY.v  
  参考構造体。BOARD上に空(value=0)の位置を探し、その座標を返す。
- BOARDCHECK.v  
  参考構造体。Board上に{val,raw,col}を代入した場合、ナンバープレースの条件を満たしているかを確認する。

# 計測方法
- 自分の良いタイミングで、BOARDにアクセス開始してください。
- アクセス開始時にP_CONFIG_ONGOINGを0→1にしてください。終了時に1→0に落としてください。
- 1になっている区間のサイクル数を計測します。完了までにかかるサイクル数は評価の参考にいたします。
- 現在のBOARD構造体は1マスずつアクセスしております。このアクセス方法について改造はOKです。

# 提供方法
- 当日ポスターセッションに参加してください。
- 事前に予備評価用VHDL/verilogを提供(提供先:T.B.D)
- 各種状況に応じてご相談いたします。(連絡先はコチラへ、nakmura"at"jp.fujitsu.com。)
- 作品の提出締切は 2024年8月21日(水) です。
- 作品の提出を以ってコンテストへの参加申し込みと致します。
- das”at”sig-sldm.org へ作品提出をお願いします（”at”は@に変換してください）。
- メール本文には、名前もしくはチーム名を入れておいてください。

# データフォーマット
- NUM - 値、該当座標に登録されている数値を示す  
0 : 未登録を示す。例えばリセット直後は明示的にこの値である。 (利用参照可能)  
1-9 : その座標の値は該当数値に登録されている(利用参照可能)  
10-15 : エラー。(利用不可、参照不可)  
- ROW, COL - 座標を示す。  
0 : 未登録を示す 。リセット直後の値であったり、座標回答Failを意味する(利用参照可能)  
1-9 : その座標の値を示す(利用可能、参照可能)  
10-15 : 利用不可能、エラー
