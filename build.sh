#!/usr/bin/env bash
set -e

rm -rf quartz
git clone https://github.com/jackyzha0/quartz.git quartz

rm -rf quartz/content/*
cp -R aws computing development devops networking tools whitepapers attachments quartz/content/

cat > quartz/content/index.md <<'EOF'
---
title: aslamnotes
---

# aslamnotes
EOF

# Quartz v4 config (correct)
cat > quartz/quartz.config.ts <<'EOF'
import { QuartzConfig } from "./quartz/config"

const config: QuartzConfig = {
  site: {
    title: "aslamnotes",
  },
}

export default config
EOF

cd quartz
npm ci
npx quartz build
