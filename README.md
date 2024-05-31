# atcoder_docker
AtCoder用docker.  
`atcoder-library(acc)` `online-judge-tools(oj)` `cpp-dump(dump)` を使うことができます。
- acc https://github.com/Tatamo/atcoder-clid
- oj https://github.com/online-judge-tools/oj
- dump https://github.com/philip82148/cpp-dump

## 事前準備
docker が使える状態を想定しています。

## 使い方

`acc` `oj` の使い方は説明しないので適宜リファレンスを参照してください。

### 1. 環境構築
~~~sh
$ docker compose up
$ docker compose exec atcoder bash # or any way you like. (e.g. vscode)
~~~

### 2. ログイン
`acc` と `oj` で atcoder にログインします。
~~~sh
$ acc login
$ oj login https://atcoder.jp/
~~~

### 3. 問題を解く

#### 問題のダウンロード
~~~sh
$ acc new <contest-id> --template <template-dir-name>
$ acc new abc321 --template cpp # example
~~~

#### 問題を解く  
`main.cpp` ファイル内で `dump` 関数を用いて変数の中身を簡単に出力することができます。（詳しくは、https://github.com/philip82148/cpp-dump を参照のこと）
~~~cpp
...
int main() {
    int N; cin >> N;
    vector<int> A(N); for(int i=0; i<N; i++) cin>>A[i];
    dump(A); // A の中身が出力される
}
...
~~~

#### コンパイル
`gd`コマンドを用いてコンパイルすることで`dump`を用いた出力が実行されます。
~~~sh
$ gd <filename>
$ gd main.cpp # example
~~~
`g`コマンドを用いると`dump`を用いた出力はスルーされます。
~~~sh
$ g <filename>
$ g main.cpp
~~~
`gd` `g`は`Dockerfile`で設定されるエイリアスです。
~~~Dockerfile
RUN echo 'alias g="g++ -std=c++20 -Wall -Wextra -Wshadow -Wfloat-equal -ftrapv -fsanitize=undefined,address -fno-omit-frame-pointer -fno-sanitize-recover -g -I /work/ac-library"' >> /home/${USERNAME}/.bashrc
RUN echo 'alias gd="g++ -DDEBUG -std=c++20 -Wall -Wextra -Wshadow -Wfloat-equal -ftrapv -fsanitize=undefined,address -fno-omit-frame-pointer -fno-sanitize-recover -g -I /work/ac-library"' >> /home/${USERNAME}/.bashrc
~~~

#### テスト
~~~sh
$ oj t # == oj test
$ gd main.cpp && oj t # コンパイルしたのちテスト
~~~

### 提出
~~~sh
$ acc s # == acc submit
~~~

## Reference
### atcoder-library
- Tatamo. atcoder-cli. https://github.com/Tatamo/atcoder-cli.

### online-judge-tools
- koba-e964. oj. https://github.com/online-judge-tools/oj.

### cpp-dump
- sassan.【C++】あらゆる変数をprintするdump関数を本気で作ってみた. https://zenn.dev/sassan/articles/19db660e4da0a4.
- philip82184. cpp-dump. https://github.com/philip82148/cpp-dump.