# Ruby gRPC Sample

gRPC、Protocol BuffersをRubyで扱ってみたサンプルコード

# How to use

1. 前提条件

  - `grpc_tools_ruby_protoc`が使えること
    - Protocol Buffers: https://github.com/protocolbuffers/protobuf
    - Ruby用プラグイン: https://github.com/grpc/grpc/blob/master/src/ruby/tools/bin/grpc_tools_ruby_protoc
      - Ubuntuなら`sudo apt install ruby-grpc-tools`で入れられる

1. gemのインストール

  ```bash
  $ bundle config --local path ./vendor/bundle
  $ bundle install
  ```

1. `.protoc`のシリアライズ

  - `simple_vtuber.proto` (RPCなし)

    ```bash
    $ grpc_tools_ruby_protoc --ruby_out=. simple_vtuber.proto
    ```

  - `vtuber.proto` (RPCあり)

    ```bash
    $ grpc_tools_ruby_protoc --ruby_out=. --grpc_out=. vtuber.proto
    ```

1. サンプルコードの実行

  - RPCなし

    ```bash
    $ bundle exec ruby SimpleProtobuff.rb
    ```

  - RPCあり

    - gRPCサーバの起動
    ```bash
    $ bundle exec ruby Server.rb
    ```

    - リクエストの実行

      もう一つターミナルを開いて`Client.rb`を実行する
      ```bash
      $ bundle exec ruby Client.rb
      ```
