#!/usr/bin/env sh

wget \
	"https://www.tiny.cloud/tinymce-services-azure/1/i18n/download?langs="`
	`"af_ZA,"`
	`"ar,"`
	`"az,"`
	`"eu,"`
	`"be,"`
	`"bn_BD,"`
	`"bg_BG,"`
	`"ca,"`
	`"zh_CN,"`
	`"zh_TW,"`
	`"hr,"`
	`"cs,"`
	`"cs_CZ,"`
	`"da,"`
	`"dv,"`
	`"nl,"`
	`"en_CA,"`
	`"en_GB,"`
	`"et,"`
	`"fi,"`
	`"fr_FR,"`
	`"gl,"`
	`"ka_GE,"`
	`"de,"`
	`"de_AT,"`
	`"el,"`
	`"he_IL,"`
	`"hu_HU,"`
	`"id,"`
	`"ga,"`
	`"it,"`
	`"ja,"`
	`"kab,"`
	`"kk,"`
	`"km_KH,"`
	`"ko_KR,"`
	`"lv,"`
	`"lt,"`
	`"nb_NO,"`
	`"fa_IR,"`
	`"pl,"`
	`"pt_BR,"`
	`"pt_PT,"`
	`"ro,"`
	`"ru,"`
	`"sr,"`
	`"sk,"`
	`"sl_SI,"`
	`"es,"`
	`"es_MX,"`
	`"sv_SE,"`
	`"ta,"`
	`"ta_IN,"`
	`"th_TH,"`
	`"tr,"`
	`"tr_TR,"`
	`"ug,"`
	`"uk,"`
	`"uk_UA,"`
	`"uz,"`
	`"vi_VN,"`
	`"cy" \
	-O langs.zip

mv ./langs ./langs4

rm -r ./langs5
unzip langs.zip
mv ./langs ./langs5

mv ./langs4 ./langs

jq ".version = \"`date +%y.%-m.%-d`\"" package.json > tmp.$$.json && mv tmp.$$.json package.json
jq ".version = \"`date +%y.%-m.%-d`\"" composer.json > tmp.$$.json && mv tmp.$$.json composer.json
