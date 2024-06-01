# stress-ng 


## ビルド
```
docker build -t stress-ng .
```


## 実行
```
docker run stress-ng --cpu 2 --malloc-bytes 300M --malloc-zerofree
```

## 参考資料
-- https://github.com/ColinIanKing/stress-ng