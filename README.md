# Rails アプリを AWS ECS で公開する手順

* Ruby version
2.6.3

* Rails version
6.1.4

* DatabaseAdapter
PostgreSQL 

# 前提条件・前提知識

* AWSにアクセスできるIAMユーザーが作成できている

* aws cli が導入できている

* Docker Desktop アプリが入っている

# ローカル環境での実行方法

Develop環境 Docker ビルドコマンド

```
$ docker build .
```

```
$ docker-compoose up
```

http://localhost:3000 へアクセス

# AWSのリソース作成手順

https://www.notion.so/AWS-ECR-ECS-Rails-7b2fcbc04a4940ecb4668c7debac207b

```
$ git clone https://github.com/xhackjp1/docker-rails-postgres.git
```

