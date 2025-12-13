#!/usr/bin/env bash
set -e

# clone quartz
rm -rf quartz
git clone https://github.com/jackyzha0/quartz.git quartz

# replace content with your notes (only folders you care about)
rm -rf quartz/content/*
cp -R aws computing development devops networking tools whitepapers attachments quartz/content/

# create index.md
cat > quartz/content/index.md <<'EOF'
---
title: Home
---

# Notes
EOF

# quartz v4 config
cat > quartz/quartz.config.ts <<'EOF'
import { defineConfig } from "./quartz.config.shared"

export default defineConfig({
  site: {
    title: "aslamnotes",
  },
})
EOF

cd quartz
npm ci
npx quartz build
