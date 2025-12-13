#!/bin/bash
set -e

echo "📦 Setting up Quartz..."

# Clone Quartz if not present
if [ ! -d ".quartz" ]; then
    echo "Cloning Quartz..."
    git clone https://github.com/jackyzha0/quartz.git .quartz
    cd .quartz
    npm install
    cd ..

    echo "📝 Configuring..."
    # Update baseUrl in the config (edit after first deploy)
    cat > .quartz/quartz.config.ts << 'EOF'
import { QuartzConfig } from "./quartz/cfg"
import * as Plugin from "./quartz/plugins"

const config: QuartzConfig = {
  configuration: {
    pageTitle: "aslamnotes",
    enableSPA: true,
    enablePopovers: true,
    baseUrl: "your-site.vercel.app",
    ignorePatterns: ["private", ".obsidian", ".quartz"],
    defaultDateType: "created",
    theme: {
      fontOrigin: "googleFonts",
      cdnCaching: true,
      typography: {
        header: "Schibsted Grotesk",
        body: "Source Sans Pro",
        code: "IBM Plex Mono",
      },
      colors: {
        lightMode: {
          light: "#faf8f8",
          lightgray: "#e5e5e5",
          gray: "#b8b8b8",
          darkgray: "#4e4e4e",
          dark: "#2b2b2b",
          secondary: "#284b63",
          tertiary: "#84a59d",
          highlight: "rgba(143, 159, 169, 0.15)",
        },
        darkMode: {
          light: "#161618",
          lightgray: "#393639",
          gray: "#646464",
          darkgray: "#d4d4d4",
          dark: "#ebebec",
          secondary: "#7b97aa",
          tertiary: "#84a59d",
          highlight: "rgba(143, 159, 169, 0.15)",
        },
      },
    },
  },
  plugins: {
    transformers: [
      Plugin.FrontMatter(),
      Plugin.CreatedModifiedDate(),
      Plugin.SyntaxHighlighting(),
      Plugin.ObsidianFlavoredMarkdown(),
      Plugin.GitHubFlavoredMarkdown(),
      Plugin.TableOfContents(),
      Plugin.CrawlLinks({ markdownLinkResolution: "shortest" }),
      Plugin.Description(),
      Plugin.Latex({ renderEngine: "katex" }),
    ],
    filters: [Plugin.RemoveDrafts()],
    emitters: [
      Plugin.AliasRedirects(),
      Plugin.ComponentResources(),
      Plugin.ContentPage(),
      Plugin.FolderPage(),
      Plugin.TagPage(),
      Plugin.ContentIndex({
        enableSiteMap: true,
        enableRSS: true,
      }),
      Plugin.Assets(),
      Plugin.Static(),
      Plugin.NotFoundPage(),
    ],
  },
}

export default config
EOF
fi

echo "🔗 Syncing content..."
# Remove default content
rm -rf .quartz/content

# Copy entire repo structure to content
cp -R . .quartz/content/

# Remove unwanted directories from content
rm -rf .quartz/content/.quartz
rm -rf .quartz/content/.git
rm -rf .quartz/content/.obsidian
rm -rf .quartz/content/public
rm -rf .quartz/content/node_modules
rm -f .quartz/content/.DS_Store
rm -f .quartz/content/build.sh
rm -f .quartz/content/vercel.json

echo "📊 Content synced. Files in content directory:"
find .quartz/content -type f -name "*.md" | wc -l
echo "markdown files copied"

# Create index.md if it doesn't exist
if [ ! -f ".quartz/content/index.md" ]; then
    echo "📄 Creating index.md..."
    cat > .quartz/content/index.md << 'INDEXEOF'
# Welcome to My Notes

Browse my notes using the explorer on the left or search above.

## Topics

- [AWS](aws/)
- [Computing](computing/)
- [Development](development/)
- [Networking](networking/)
- [DevOps](devops/)
- [Tools](tools/)

INDEXEOF
fi

echo "🔨 Building site..."
cd .quartz
npx quartz build
cd ..

# Move output to root for Vercel
rm -rf public
mv .quartz/public ./public

echo "✅ Build complete! Output in ./public"
