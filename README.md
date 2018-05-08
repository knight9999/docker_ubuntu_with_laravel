# 使い方

## イメージファイルの作成

`git clone`したディレクトリ(Dockerfileが存在するディレクトリ)に移動して、以下を実行します。

```
$ docker build -t ubuntu_with_laravel . --no-cache=true
```

## コンテナの起動(Mac)

ワークディレクトリの下で以下を実行

```
$ docker run --privileged -d --name python_server -p 8080:80 -p 13306:3306 -v `pwd`/../project:/home/client/work/project -v `pwd`/../etc:/mnt/etc -it ubuntu_with_python
```



## History
