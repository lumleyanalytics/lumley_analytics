# instructions on how to set up GitHub pages hosting for dbt docs are here
# https://medium.com/dbt-local-taiwan/host-dbt-documentation-site-with-github-pages-in-5-minutes-7b80e8b62feb

echo delete local and remote gh-pages branches
git branch -D gh-pages
git push origin --delete gh-pages

echo re-create branch
git checkout main
# at main branch
git checkout --orphan gh-pages

# Generate documentations, models will be parsed to files under target directory
dbt docs generate
git add -f target

# This command only commits the files under target directory
git commit -m 'your commit messages' target

# This command only push files under target directory
git subtree push --prefix target origin gh-pages

# Checkout to main
git checkout main

echo All done!