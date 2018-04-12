if [ -n "$GITHUB_API_KEY" ]; then
  cd "$TRAVIS_BUILD_DIR"
  git clone -b gh-pages https://karllhughes:$GITHUB_API_KEY@github.com/karllhughes/side-project-checklist
  cd side-project-checklist
  npm install
  AIRTABLE_API_KEY=$AIRTABLE_API_KEY AIRTABLE_BASE_ID=$AIRTABLE_BASE_ID node scripts/generate-products
  AIRTABLE_API_KEY=$AIRTABLE_API_KEY AIRTABLE_BASE_ID=$AIRTABLE_BASE_ID node scripts/generate-checklists
  git add -A
  git -c user.name='travis' -c user.email='travis' commit -m init
  git push -f -q https://karllhughes:$GITHUB_API_KEY@github.com/karllhughes/side-project-checklist gh-pages &2>/dev/null
  cd "$TRAVIS_BUILD_DIR"
  echo "Build and push complete."
fi
echo "Script complete."
