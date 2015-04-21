rm -rf ../tmp
mkdir ../tmp
jekyll build --destination ../tmp
cp -r ../tmp/* ../bitbucket-pages
