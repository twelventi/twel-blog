#!/bin/sh

### I acknowledge that this isn't going to be 1000 lines, but this is a meme about a different project I once contributed to
### This file generates an rss feed from the blog posts in this repo 
### Requires yq

echo '<?xml version="1.0" encoding="UTF-8" ?>' > feed.rss
echo '<rss version="2.0">' >> feed.rss
echo '<channel>' >> feed.rss


for FILENAME in $(dirname $BASH_SOURCE)/*.markdown; do
    LINENUM=$(grep -e '---' $FILENAME -n | head -n 2 | tail -n 1 | sed -e "s/\([0-9]*\).*/\1/g")

    TEMP_F=$(mktemp)
    #output the file primed for yq
    cat $FILENAME | head -n $LINENUM | sed -e "s/\(---\).*//g" | sed -e "s/\(\#.*\)//g" > $TEMP_F
    RAW_FILE=$(echo $FILENAME | sed -e "s/.*\/\(.*\\)\..*/\1/g")
    TITLE=$(cat $TEMP_F | yq .title)
    AUTHOR=$(cat $TEMP_F | yq .author)
    DATE=$(cat $TEMP_F | yq .date)
  
    echo "<item>" >> feed.rss
    echo "  <title>" $TITLE "</title>" >> feed.rss
    echo "  <author>" $AUTHOR "</author>" >> feed.rss
    echo "  <pubDate>" $DATE "</pubDate>" >> feed.rss
    echo "  <link>" "https://twelventi.com/blog/${RAW_FILE}" "</link>" >> feed.rss
    echo "</item>" >> feed.rss    

    rm $TEMP_F
done

echo '</channel>' >> feed.rss
echo '</rss>' >> feed.rss
