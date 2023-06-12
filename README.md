# Dockerコンテナにsshで入る環境を作る
## ざっくりした手順(rootでパスワードログインまで)
1. sshパッケージを入れる
2. sshd_configを編集する
3. chpasswdでrootユーザーのパスワード設定
4. service ssh startでsshdを起動させておく

## 使い道？
- sshサーバーの構築テスト
- Jenkinsのジョブのテスト(master-slave間はsshで通信する)

## 起動方法
~~~bash
docker-compose build --build-arg ROOT_PASS=hogehoge
docker-compose up
~~~

## その他
### sshログインできないトラブル
sshログインしようとして、こういうエラー？警告？が出ることがある
~~~
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@    WARNING: REMOTE HOST IDENTIFICATION HAS CHANGED!     @
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@   
~~~

ssh-keygen -Rで解決してあげる

### sshの設定
./ssh/sshd_configを/etc/ssh/sshd_configにマウントしている  
パスワードログインや、公開鍵認証の設定などはこのファイルで行う  
