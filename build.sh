#!/usr/bin/env bash
set -e

rm -rf quartz
git clone https://github.com/jackyzha0/quartz.git quartz

rm -rf quartz/content/*
cp -R aws computing development devops networking tools whitepapers attachments quartz/content/

# home page
cat > quartz/content/index.md <<'EOF'
---
title: aslamnotes
---

# aslamnotes
EOF

# Quartz v4 config (working)
cat > quartz/quartz.config.ts <<'EOF'
import { QuartzConfig } from "./quartz.config"

const config: QuartzConfig = {
  configuration: {
    pageTitle: "aslamnotes",
  },
  plugins: {
    transformers: [],
    filters: [],
    emitters: [],
  },
}

export default config
EOF

cd quartz
npm ci
npx quartz build
