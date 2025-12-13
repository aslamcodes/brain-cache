#!/usr/bin/env bash
set -e

ROOT="$(pwd)"

rm -rf .quartz
git clone https://github.com/jackyzha0/quartz.git .quartz

rm -rf .quartz/content/*
cp -R "$ROOT"/* .quartz/content/

# prevent recursion / junk
rm -rf .quartz/content/.quartz
rm -f  .quartz/content/build.sh

# runtime index.md
cat > .quartz/content/index.md <<'EOF'
---
title: Home
---

# Notes
EOF

# runtime quartz config
cat > .quartz/quartz.config.ts <<'EOF'
import { defineConfig } from "./quartz.config.shared"

export default defineConfig({
  site: {
    title: "aslamnotes",
  },
})
EOF

cd .quartz
npm ci
npx quartz build
