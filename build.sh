#!/bin/bash
set -e

echo "📦 Setting up Quartz..."

rm -rf .quartz public

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
    baseUrl: "notes.aslamcodes.in",
    ignorePatterns: ["private", ".obsidian", ".quartz"],
    defaultDateType: "created",
    theme: {
      fontOrigin: "googleFonts",
      cdnCaching: true,
      typography: {
        header: "Inter",
        body: "Inter",
        code: "JetBrains Mono",
      },
      colors: {
        lightMode: {
          light: "#ffffff",
          lightgray: "#e5e7eb",
          gray: "#9ca3af",
          darkgray: "#374151",
          dark: "#000000",
          secondary: "#000000",
          tertiary: "#000000",
          highlight: "rgba(0,0,0,0.05)",
        },
        darkMode: {
          light: "#000000",        // background
          lightgray: "#0a0a0a",    // panels
          gray: "#b3b3b3",         // muted text
          darkgray: "#d1d5db",     // normal text
          dark: "#ffffff",        // headings
          secondary: "#ffffff",
          tertiary: "#e5e7eb",
          highlight: "rgba(255,255,255,0.08)",
        },
      },
    }
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
# Remove old content
rm -rf .quartz/content
mkdir -p .quartz/content

# Copy files and directories, excluding what we don't want
for item in *; do
  case "$item" in
    .quartz|.git|.obsidian|public|templates|node_modules|build.sh|vercel.json|.gitignore)
      echo "Skipping $item"
      ;;
    *)
      echo "Copying $item"
      cp -R "$item" .quartz/content/
      ;;
  esac
done

# Also copy hidden files we want (like .md files that might start with .)
# But skip the ones we explicitly don't want

echo "📊 Content synced. Markdown files:"
find .quartz/content -type f -name "*.md" | wc -l

# Create index.md if it doesn't exist
if [ ! -f ".quartz/content/index.md" ]; then
    echo "📄 Creating index.md..."
    cat > .quartz/content/index.md << 'INDEXEOF'
# Welcome to My Notes

Browse my notes using the explorer on the left or search above.

## Topics

- [AWS](aws/)
- [Cloud Security](cloud-security/)
- [Computing](computing/)
- [Development](development/)
- [DevOps](devops/)
- [Networking](networking/)
- [Projects](projects/)
- [Tools](tools/)
- [Whitepapers](whitepapers/)
- [Attachments](attachments/)

INDEXEOF
fi

rm -rf .quartz/node_modules .quartz/package-lock.json
cd .quartz
npm install
npx quartz build --output public

cd ..
rm -rf public
mv .quartz/public ./public

echo "✅ Build complete! Output in ./public"
