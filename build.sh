#!/usr/bin/env bash
set -e

ROOT="$(pwd)"

rm -rf quartz-build
git clone https://github.com/jackyzha0/quartz.git quartz-build

rm -rf quartz-build/content/*
cp -R "$ROOT"/* quartz-build/content/

# cleanup
rm -rf quartz-build/content/quartz-build
rm -f  quartz-build/content/build.sh

# runtime index
cat > quartz-build/content/index.md <<'EOF'
---
title: Home
---

# Notes
EOF

# Quartz v4 config
cat > quartz-build/quartz.config.ts <<'EOF'
import { defineConfig } from "./quartz.config.shared"

export default defineConfig({
  site: {
    title: "aslamnotes",
  },
})
EOF

cd quartz-build
npm ci
npx quartz build
