#!/usr/bin/env bash
set -e

git clone https://github.com/jackyzha0/quartz.git quartz
rm -rf quartz/content/*

cp -R \
  attachments aws cloud-security computing development devops networking templates tools whitepapers \
  quartz/content/

cd quartz
npm ci
npx quartz build
