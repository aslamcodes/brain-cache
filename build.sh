#!/usr/bin/env bash
set -e

rm -rf quartz
git clone https://github.com/jackyzha0/quartz.git quartz

rm -rf quartz/content/*
cp -R notes-repo/* quartz/content/

# create index.md at runtime
cat > quartz/content/index.md <<'EOF'
---
title: Home
---

# Notes

Welcome.
EOF

cd quartz
npm ci
npx quartz build
