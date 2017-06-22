#!/bin/sh
read
input=""
date
while IFS= read -r line; do
    input="$input\n$line"
    echo "."
done
echo "intput: '$input'"
echo "$input" | gpg --clearsign --armor
tail -f /dev/null

echo "exited..."
