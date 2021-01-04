#!/bin/bash

wget https://www.htw-berlin.de/coronavirus -O coronavirus-index.html

for faq in \
     faq-fuer-studierende \
     faq-fuer-bewerber-innen \
     faq-fuer-lehrende faq-fuer-beschaeftigte \
     corona-infektionsmeldung-und-nachverfolgung \
     gebaeude-zugang-mit-karte \
     ; do
  echo $faq
  wget https://www.htw-berlin.de/coronavirus/$faq/
  if [ $(uname -s) == "Darwin" ]; then
    # needs gnu-sed on mac, brew install gnu-sed
    echo "Mac"
    gsed  's/>/>\n/g' index.html > $faq.html
  else
    echo "not a Mac"
    sed  's/>/>\n/g' index.html > $faq.html
  fi
  rm index.html
done
git add .
git commit -m "update $(date +%Y-%m-%d---%H-%M-%S)"
git push origin main

touch logs/tick-$(date +%Y-%m-%d---%H-%M-%S)
