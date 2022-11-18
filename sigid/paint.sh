#!/usr/bin/env bash

convert \
  -background White \
  -gravity Center \
  -pointsize 100 \
  label:'Part #1 flag\{b2e2b3877aad4108\}' \
  -rotate 270 \
  -extent x1550 \
  -background Black \
  -extent 256x \
  paint.png
