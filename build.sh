#!/usr/bin/env bash
set -e

rm -rf quartz
git clone https://github.com/jackyzha0/quartz.git quartz

cp -R \
  index.md attachments aws cloud-security computing development devops networking tools whitepapers \
  quartz/content/

cd quartz
npm ci
npx quartz build
