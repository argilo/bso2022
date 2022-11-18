#!/usr/bin/env bash

convert \
  -background White \
  -gravity Center \
  -pointsize 150 \
  label:'Part #1 flag\{b2e2b3877aad4108\}' \
  -rotate 270 \
  -extent x2300 \
  -background Black \
  -extent 256x \
  paint.png
