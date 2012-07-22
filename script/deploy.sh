#!/bin/bash

URL="http://192.168.0.108:3000"
mkdir deploy_tmp
cd deploy_tmp
curl $URL -o index.html
mkdir assets
cd assets
curl "$URL/assets/{application,print,bootstrap_and_overrides}.css" -o "#1.css"
curl "$URL/assets/fontawesome-webfont.{eot,svg,ttf,woff}" -o "fontawesome-webfont.#1"
curl "$URL/assets/twitter/bootstrap/{glyphicons-halflings,glyphicons-halflings-white}.png" -o "#1.png"
cd ..
perl -i -pe 's{/assets(/twitter/bootstrap)?}{/cv/assets}'g index.html assets/bootstrap_and_overrides.css
cd ..
rsync -avz deploy_tmp/ owl@vegetable.org.uk:richd.me/cv/
rm -r deploy_tmp
