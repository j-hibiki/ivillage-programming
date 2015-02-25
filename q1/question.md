# 問題１

簡易版treeコマンドの作成。

```
ruby my_command.rb directory
```
のように実行すると、指定したディレクトリから2階層下までをツリー上に出力する。

### 実行例

- カレントディレクトリにはdirectoryというディレクトリのみがある。
- directoryの中には、hoge.rbというファイルと、barとabcというディレクトリがある。
- barの中にはbaz.txtがあり、abcの中にはaとbとcがある。

という状態で先ほどのコマンドを実行すると、以下のように出力される。

```
directory
|-- hoge.rb
|-- bar
|   |-- baz.txt
|-- abc
    |-- a
    |-- b
    |-- c
```

また、`ruby my_command.rb .`と実行すると、以下のように出力される。

```
.
|-- directory
    |-- hoge.rb
    |-- bar
    |-- abc
```
