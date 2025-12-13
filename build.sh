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
    baseUrl: "notes.aslamcodes.in",
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
# Remove old content
rm -rf .quartz/content
mkdir -p .quartz/content

# Copy files and directories, excluding what we don't want
for item in *; do
  case "$item" in
    .quartz|.git|.obsidian|public|node_modules|build.sh|vercel.json|.gitignore)
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
- [Computing](computing/)
- [Development](development/)
- [Networking](networking/)
- [DevOps](devops/)
- [Tools](tools/)

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
