#!/bin/zsh

curl -s https://xkcd.com/info.0.json > xkcd.json

cat xkcd.json | jq .title -r
IMG_PATH="$(cat xkcd.json | jq .img -r)"
kitten icat --align left $IMG_PATH
cat xkcd.json | jq .alt -r
