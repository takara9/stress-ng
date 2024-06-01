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



## 参照資料
-- https://github.com/ColinIanKing/stress-ng