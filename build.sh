#!/usr/bin/env bash
set -e

git clone https://github.com/jackyzha0/quartz.git quartz
rm -rf quartz/content/*

cp -R \
  index.md attachments aws cloud-security computing development devops networking tools whitepapers \
  quartz/content/

cd quartz
npm ci
npx quartz build
