#!/usr/bin/env sh

wget https://download.tiny.cloud/tinymce/community/languagepacks/6/langs.zip -O langs6.zip
#wget https://download.tiny.cloud/tinymce/community/languagepacks/5/langs.zip -O langs5.zip
wget https://www.tiny.cloud/tinymce-services-azure/1/i18n/download?langs=ar,hy,eu,bn_BD,bg_BG,ca,zh_CN,zh_TW,hr,cs,da,nl,eo,et,fi,fr_FR,gl,de,el,he_IL,hu_HU,id,it,it_IT,ja,kab,kk,ko_KR,ku,lt,nb_NO,fa,fa_IR,pl,pt_BR,pt_PT,ro,ro_RO,ru,ru_RU,sk,sl,sl_SI,es,es_,es_ES,sv_SE,ta,ta_IN,th_TH,tr,tr_TR,uk,vi,cy -O langs5.zip
wget https://download.tiny.cloud/tinymce/community/languagepacks/4/langs.zip -O langs4.zip

rm -rf ./langs ./langs5 ./langs6

unzip -q langs6.zip
mv langs langs6

unzip -q langs5.zip
mv langs langs5

unzip -q langs4.zip

git apply patches/*

jq ".version = \"`date +%y.%-m.%-d`\"" package.json > tmp.$$.json && mv tmp.$$.json package.json
jq ".version = \"`date +%y.%-m.%-d`\"" composer.json > tmp.$$.json && mv tmp.$$.json composer.json
