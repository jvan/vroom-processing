#!/bin/bash

SRC_DIR=$(dirname "$0")

cd "$SRC_DIR"

mkdir -p ../library

javac -cp ./rabbitmq-client.jar -d . *.java
jar -cf vroom.jar vroom/
cp vroom.jar rabbitmq-client.jar ../library
