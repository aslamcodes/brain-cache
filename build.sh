#!/usr/bin/env bash
set -e

rm -rf quartz public
git clone https://github.com/jackyzha0/quartz.git quartz

rm -rf quartz/content/*
shopt -s extglob

cp -R !(quartz|.git|.github|node_modules|quartz.content.ts) quartz/content/
cp quartz.config.ts quartz/

cd quartz
npm ci
npx quartz build
cd ..

mv quartz/public ./public
