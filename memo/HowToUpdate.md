# DAシンポジウムADCのWebページ更新手順

[DAシンポジウム](http://www.sig-sldm.org/das/)内で開催している[ADC](https://dasadc.github.io)のWebページは www.sig-sldm.org とは別のURLである dasadc.github.io にて公開されている。その更新手順について述べる。

# 概要
[ADC](https://dasadc.github.io)のWebページはGitHub Pagesという機能を使って構成されている。GitHub Pagesとは、
> GitHub のリポジトリから HTML、CSS、および JavaScript ファイル を直接取得し、任意でビルドプロセスを通じてファイルを実行し、ウェブサイトを公開できる静的なサイトホスティングサービス

である([githubページ](https://docs.github.com/ja/pages/getting-started-with-github-pages/about-github-pages#github-pages-%E3%81%AB%E3%81%A4%E3%81%84%E3%81%A6)より)。つまり、[dasadcリポジトリ](https://github.com/dasadc/dasadc.github.io)を更新すれば、[ADC](https://dasadc.github.io)のWebページが更新される。リポジトリ上でMarkdown形式でテキストを記述すれば、GitHub Pagesの機能でHTMLに変換される。

GitHub上で更新するため、gitリポジトリを更新できる程度の知識が更新者に求められる。また、Markdown形式からHTMLへの変換が意図した通りなのかをプレビューするための環境も用意できることが望ましい。

# 更新手順
複数の手順が考えられるが、更新履歴を見る限り以下の手順で行っているようである。更新を繰り返す際は4から7を繰り返す。

1. https://github.com/dasadc/ の管理者権限を取得する
2. git clone する
3. 更新用のブランチを作成する。例えば adc2023dev
4. 必要なファイルを配置し、Markdown形式でテキストを記述する
5. プレビューで確認する
6. github.com へ push する
7. github上でpull requestを作ってmasterブランチへマージする

[こちら](./HowToPreviewLocally.html) の後半では、gitコマンドも含めた更新手順が記載されている。

# プレビュー
## 環境構築
Markdown形式をHTMLに変換する処理にはJekyllが使われている。プレビュー手順も様々な方法が考えられる。ローカルなマシンが[MacOS X 10.12.5の場合](./HowToPreviewLocally.html)、[Ubuntu 20.04.02の場合](./ubuntu-20.04.2_LTS.html)にそれぞれインストールする方法が記載されている。ここではdockerを使ってJekyllを使える環境を構築する方法を述べる。

git cloneからはじめて、以下のようにする。
```sh
git clone https://github.com/dasadc/dasadc.github.io
cd dasadc.github.io
```
ここに、以下の内容のGemfileというファイルを作る。
```
source 'https://rubygems.org'
gem "github-pages", group: :jekyll_plugins
```
引き続き以下のコマンドを実行する。
```sh
docker pull jekyll/jekyll
docker run --name adc -v `pwd`:/srv/jekyll:Z -it -p 127.0.0.1:4000:4000 jekyll/jekyll /bin/bash
```
Dockerコンテナ上で以下を実行する。
```sh
jekyll build
exit
```
これで環境構築は終了である。

## プレビュー手順
プレビューする際は、以下を実行する。
```sh
docker start adc
docker exec adc jekyll serve
```

このあとブラウザでhttp://127.0.0.1:4000/を開けばプレビューできる。

プレビューした際の表示は、dasadc.github.ioのページとは以下の点で表示が異なっている。
- ページの上部に "View on GitHub" というリンクがある
- ページの下部に "dasadc.github.io is maintained by dasadc." という表示がある

これらはローカルでのプレビュー時にのみ表示され、dasadc.github.ioで公開した際には表示されない。

