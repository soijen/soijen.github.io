#!/bin/bash

echo "🛠️ Building Jekyll site..."
bundle exec jekyll build

echo "🚀 Deploying to gh-pages branch..."

cd _site

if [ ! -d ".git" ]; then
  git init
  git checkout -b gh-pages
else
  git checkout gh-pages
fi

git remote get-url origin &>/dev/null || git remote add origin git@github-soijen:soijen/soijen.github.io.git

git add .
git commit -m "Deploy: $(date '+%Y-%m-%d %H:%M:%S')"
git push -f origin gh-pages

cd ..

echo "✅ Deployed to GitHub Pages!"
