#!/bin/bash -xe

HOME_PATH=$PWD
TARGET_PATH=$PWD/build
OS_PATH=$TARGET_PATH/wasabi
APP_NAME="saba"
MAKEFILE_PATH=$HOME_PATH/Makefile
APP_BIN_PATH=$HOME_PATH/target/x86_64-unknown-none/release/$APP_NAME

# buildディレクトリを作成する
if [ -d $TARGET_PATH ]; then
  echo "$TARGET_PATH exists"
else
  echo "$TARGET_PATH doesn't exist"
  mkdir $TARGET_PATH
fi

# WasabiOSをダウンロード・更新
if [ -d $OS_PATH ]; then
  echo "$OS_PATH exists"
  echo "pulling new changes..."
  cd $OS_PATH
  git pull origin for_saba
else
  echo "$OS_PATH doesn't exist"
  echo "cloning wasabi project..."
  cd $TARGET_PATH
  git clone --branch for_saba git@github.com:hikalium/wasabi.git
fi

# アプリケーションのトップディレクトリに移動
cd $HOME_PATH

# Makefileをダウンロード
if [ ! -f $MAKEFILE_PATH ]; then
  echo "downloading Makefile..."
  wget https://raw.githubusercontent.com/hikalium/wasabi/for_saba/external_app_template/Makefile -O $MAKEFILE_PATH
fi

# ビルド
make build

# saba を Wasabi が認識できる場所にコピー
if [ -f $APP_BIN_PATH ]; then
  echo "Copying $APP_NAME to Wasabi directories..."
  cp $APP_BIN_PATH $OS_PATH/generated/bin/$APP_NAME
  cp $APP_BIN_PATH $OS_PATH/mnt/$APP_NAME
else
  echo "ERROR: $APP_BIN_PATH not found. Build may have failed."
  exit 1
fi

# 実行
$OS_PATH/scripts/run_with_app.sh $APP_BIN_PATH