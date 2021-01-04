#!/bin/bash

function split_lines_and_rename {
  if [ $(uname -s) == "Darwin" ]; then
    # needs gnu-sed on mac, brew install gnu-sed
    echo "Mac"
    gsed  's/>/>\n/g' index.html > $1.html
  else
    echo "not a Mac"
    sed  's/>/>\n/g' index.html > $1.html
  fi
  rm index.html
}

wget https://www.htw-berlin.de/coronavirus -O index.html
split_lines_and_rename coronavirus-index

for faq in \
     faq-fuer-studierende \
     faq-fuer-bewerber-innen \
     faq-fuer-lehrende faq-fuer-beschaeftigte \
     corona-infektionsmeldung-und-nachverfolgung \
     gebaeude-zugang-mit-karte \
     ; do
  wget https://www.htw-berlin.de/coronavirus/$faq/
  split_lines_and_rename $faq
done

git add .
git commit -m "update $(date +%Y-%m-%d---%H-%M-%S)"
git push origin main

touch logs/tick-$(date +%Y-%m-%d---%H-%M-%S)
