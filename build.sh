#!/bin/bash
set -e

echo "📦 Setting up Quartz..."

# Install Quartz if needed
if [ ! -d "node_modules/quartz" ]; then
    npm install quartz@latest
fi

echo "🔨 Building site..."
npx quartz build

echo "✅ Build complete!"
