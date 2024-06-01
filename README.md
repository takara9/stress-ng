# 負荷テスト用コマンド　stress-ng 


## ビルド
```
docker build -t stress-ng .
```


## 実行例
２CPUを使用率100%にして、300Mバイトのメモリを使用する。

```
docker run stress-ng --cpu 2 --malloc-bytes 300M --malloc-zerofree
```


## GitHubでのリリース方法
メインブランチへ移動してコードを最新化する。そして、ブランチを削除

```
$ git checkout main
$ git pull
$ git branch -d update_branch
```


リリースするTAGを設定する。
ここで付与するTAGはコンテナイメージのタグになるので、リポジトリを確認して、タグ名を決めること。

```
TAG=1.x
$ git tag -a $TAG -m "version $TAG"
$ git push origin $TAG
```


## 参照資料
-- https://github.com/ColinIanKing/stress-ng