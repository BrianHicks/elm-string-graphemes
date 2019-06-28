data/GraphemeBreakProperty.txt:
	@mkdir -p $(@D)
	curl https://www.unicode.org/Public/12.1.0/ucd/auxiliary/GraphemeBreakProperty.txt > $@
	curl https://unicode.org/Public/emoji/12.0/emoji-data.txt >> $@

data/GraphemeBreakProperty.json: data/GraphemeBreakProperty.txt script/ucd_to_json.py
	@mkdir -p $(@D)
	python script/ucd_to_json.py < $< > $@

src/String/Segmentation/Matchers/%.elm: data/GraphemeBreakProperty.json
	@mkdir -p $(@D)
	python script/generate-matcher.py $@ < $<
	# elm-format --yes $@
