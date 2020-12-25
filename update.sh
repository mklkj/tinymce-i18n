#!/usr/bin/env sh

wget \
	"https://www.tiny.cloud/tinymce-services-azure/1/i18n/download?langs="`
	`"ar,"`
	`"hy,"`
	`"eu,"`
	`"bn_BD,"`
	`"bg_BG,"`
	`"ca,"`
	`"zh_CN,"`
	`"zh_TW,"`
	`"hr,"`
	`"cs,"`
	`"da,"`
	`"nl,"`
	`"eo,"`
	`"et,"`
	`"fi,"`
	`"fr_FR,"`
	`"gl,"`
	`"de,"`
	`"el,"`
	`"he_IL,"`
	`"hu_HU,"`
	`"id,"`
	`"it,"`
	`"it_IT,"`
	`"ja,"`
	`"kab,"`
	`"kk,"`
	`"ko_KR,"`
	`"ku,"`
	`"lt,"`
	`"nb_NO,"`
	`"fa,"`
	`"fa_IR,"`
	`"pl,"`
	`"pt_BR,"`
	`"pt_PT,"`
	`"ro,"`
	`"ro_RO,"`
	`"ru,"`
	`"ru_RU,"`
	`"sk,"`
	`"sl,"`
	`"sl_SI,"`
	`"es,"`
	`"es_MX,"`
	`"es_ES,"`
	`"sv_SE,"`
	`"ta,"`
	`"ta_IN,"`
	`"th_TH,"`
	`"tr,"`
	`"tr_TR,"`
	`"uk,"`
	`"vi,"`
	`"cy" \
	-O langs.zip

mv ./langs ./langs4

rm -r ./langs5
unzip langs.zip
mv ./langs ./langs5

mv ./langs4 ./langs

jq ".version = \"`date +%y.%-m.%-d`\"" package.json > tmp.$$.json && mv tmp.$$.json package.json
jq ".version = \"`date +%y.%-m.%-d`\"" composer.json > tmp.$$.json && mv tmp.$$.json composer.json
