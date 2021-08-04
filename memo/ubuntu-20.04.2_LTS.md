2021-07-14 Ubuntu 20.04.2 LTS メモ
=================================

まず、`dasadc`projectを、git cloneする

``` bash
git clone git@github.com:dasadc/dasadc.github.io.git

```

### Jekyllをインストールする

公式ドキュメント  
https://jekyllrb.com/docs/

1. rubyとruby-devをインストールしておいてから
2. jekyllをインストール。

``` bash
sudo apt install ruby ruby-dev

mkdir ~/ruby
gem install -i ~/ruby/ jekyll bundler
```


以下のような内容のファイル`..../dasadc.github.io/Gemfile`を作る

```
source 'https://rubygems.org'

gem "jekyll"
gem "jekyll-theme-cayman"
gem "github-pages", group: :jekyll_plugins
```

環境変数を設定する

``` bash
export GEM_HOME=$HOME/ruby
export PATH=$HOME/ruby/bin:$PATH
```

Jekyllを実行する

``` bash
cd ..../dasadc.github.io/

bundle install

bundle exec jekyll serve
```
