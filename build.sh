#!/usr/bin/env bash
set -e

# fresh quartz
rm -rf quartz
git clone https://github.com/jackyzha0/quartz.git quartz

# copy notes (explicit, no recursion)
rm -rf quartz/content/*
cp -R aws computing development devops networking tools whitepapers attachments quartz/content/

# runtime home page + title
cat > quartz/content/index.md <<'EOF'
---
title: aslamnotes
---

# aslamnotes
EOF

cd quartz
npm ci
npx quartz build
