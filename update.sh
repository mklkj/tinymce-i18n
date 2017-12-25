#!/usr/bin/env sh

wget \
	"https://tinymce-services.azurewebsites.net/1/i18n/download?langs="`
	`"af_ZA,"`
	`"ar,"`
	`"be,"`
	`"bg_BG,"`
	`"ca,"`
	`"zh_CN,"`
	`"zh_TW,"`
	`"hr,"`
	`"cs,"`
	`"da,"`
	`"dv,"`
	`"nl,"`
	`"en_CA,"`
	`"en_GB,"`
	`"et,"`
	`"fr_FR,"`
	`"gl,"`
	`"ka_GE,"`
	`"de,"`
	`"de_AT,"`
	`"el,"`
	`"he_IL,"`
	`"hu_HU,"`
	`"ga,"`
	`"it,"`
	`"ja,"`
	`"kab,"`
	`"kk,"`
	`"km_KH,"`
	`"ko_KR,"`
	`"lv,"`
	`"nb_NO,"`
	`"fa_IR,"`
	`"pl,"`
	`"pt_BR,"`
	`"pt_PT,"`
	`"ro,"`
	`"ru,"`
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
	`"uk,"`
	`"uk_UA,"`
	`"uz,"`
	`"vi_VN,"`
	`"cy" \
	-O langs.zip

rm -r ./langs/

unzip langs.zip

jq ".version = \"`date +%y.%m.%d`\"" package.json > tmp.$$.json && mv tmp.$$.json package.json
jq ".version = \"`date +%y.%m.%d`\"" composer.json > tmp.$$.json && mv tmp.$$.json composer.json
