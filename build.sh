#!/usr/bin/env bash
set -e

rm -rf quartz
git clone https://github.com/jackyzha0/quartz.git quartz

rm -rf quartz/content/*
cp -R notes-repo/* quartz/content/

# runtime index.md
cat > quartz/content/index.md <<'EOF'
---
title: Home
---

# Notes
EOF

# runtime quartz.config.ts
cat > quartz/quartz.config.ts <<'EOF'
export default {
  siteTitle: "aslamnotes",
}
EOF

cd quartz
npm ci
npx quartz build
