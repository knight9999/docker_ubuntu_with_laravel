# 使い方

## イメージファイルの作成

`git clone`したディレクトリ(Dockerfileが存在するディレクトリ)に移動して、以下を実行します。

```
$ docker build -t ubuntu_with_laravel . --no-cache=true
```

## コンテナの起動(Mac)

```
$ docker run --privileged -d --name python_server -v `pwd`/work:/mnt/work/ -it ubuntu_with_python
```



## History
