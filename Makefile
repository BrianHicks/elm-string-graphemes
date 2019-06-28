data/GraphemeBreakProperty.txt: ucd_version.txt
	@mkdir -p $(@D)
	curl -o $@ https://www.unicode.org/Public/$$(cat ucd_version.txt)/ucd/auxiliary/GraphemeBreakProperty.txt

data/GraphemeBreakProperty.json: data/GraphemeBreakProperty.txt script/ucd_to_json.py
	@mkdir -p $(@D)
	python script/ucd_to_json.py < $< > $@
