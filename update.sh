#!/usr/bin/env bash

set -ex

wget https://download.tiny.cloud/tinymce/community/languagepacks/7/langs.zip -O langs7.zip
# wget https://download.tiny.cloud/tinymce/community/languagepacks/6/langs.zip -O langs6.zip
#wget https://download.tiny.cloud/tinymce/community/languagepacks/5/langs.zip -O langs5.zip
wget https://www.tiny.cloud/tinymce-services-azure/1/i18n/download?langs=ar,az,bg_BG,bn_BD,ca,cs,cy,da,de,dv,el,eo,es,es_,es_ES,es_MX,et,eu,fa,fa_IR,fi,fr_FR,ga,gl,he_IL,hi,hr,hu_HU,hy,id,is_IS,it,it_IT,ja,kab,kk,ko_KR,ku,lt,lv,nb_NO,ne,nl,nl_BE,oc,pl,pt_BR,pt_PT,ro,ro_RO,ru,ru_RU,sk,sl,sl_SI,sq,sr,sv_SE,ta,ta_IN,tg,th_TH,tr,tr_TR,ug,uk,vi,zh-Hans,zh_CN,zh_TW -O langs5.zip
wget https://download.tiny.cloud/tinymce/community/languagepacks/4/langs.zip -O langs4.zip

npm install

rm -rf ./langs
rm -rf ./langs5
# rm -rf ./langs6
rm -rf ./langs7
rm -rf ./langs8

unzip -q langs7.zip
mv langs langs7
./node_modules/.bin/js-beautify -q langs7/*

# langs8 - for now, fallback to langs 7 with new names
cp -r langs7 langs8

# Use correct sed syntax for Linux vs macOS
if [[ "$OSTYPE" == "darwin"* ]]; then
  SED="sed -i ''"
else
  SED="sed -i"
fi

# Fix file content and rename files with underscores
for file in langs8/*_*; do
  [ -e "$file" ] || continue

  dashed="${file//_/-}"

  # change the id of the lang in the file
  $SED 's/_/-/g' "$file"

  # update the filename
  if [[ "$file" != "$dashed" ]]; then
    mv "$file" "$dashed"
    echo "Renamed: $file → $dashed"
  fi
done

# Fix macOS mistake: remove '' from filenames
for file in langs8/*\'\'; do
  [ -e "$file" ] || continue

  fixed="${file//\'\'}"
  mv "$file" "$fixed"
  echo "Fixed extra quotes: $file → $fixed"
done

# Remove _ versions if - version exists
for file in langs8/*_*; do
  [ -e "$file" ] || continue

  dashed="${file//_/-}"
  [ -e "$dashed" ] && rm "$file" && echo "Removed duplicate: $file"
done

# langs6 - disabled due to mismatch with langs7
# unzip -q langs6.zip
# mv langs langs6
# ./node_modules/.bin/js-beautify -q langs6/*

# langs5
unzip -q langs5.zip
mv langs langs5

# langs4
unzip -q langs4.zip

git apply patches/*
jq ".version = \"`date +%y.%-m.%-d`\"" package.json > tmp.$$.json && mv tmp.$$.json package.json
jq ".version = \"`date +%y.%-m.%-d`\"" composer.json > tmp.$$.json && mv tmp.$$.json composer.json
npm install
