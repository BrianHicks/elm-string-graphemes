# modules

.PHONY: all
all: generated

.PHONY: test
test: generated
	elm-test

.PHONY: generated
generated: $(foreach class,CR LF Control Prepend Regional_Indicator L V T LV LVT Extended_Pictographic Extend SpacingMark ZWJ,src/String/Segmentation/Data/$(class).elm) tests/GraphemeBreakTest.elm

src/String/Segmentation/Data/%.elm: data/GraphemeBreakProperty.json script/generate-matcher.py
	@mkdir -p $(@D)
	python script/generate-matcher.py $@ < $<
	elm-format --yes $@

tests/GraphemeBreakTest.elm: data/GraphemeBreakTest.txt script/generate-grapheme-break-test.py
	python script/generate-grapheme-break-test.py $@ < $<
	elm-format --yes $@

# data

data/GraphemeBreakProperty.txt:
	@mkdir -p $(@D)
	curl https://www.unicode.org/Public/12.1.0/ucd/auxiliary/GraphemeBreakProperty.txt > $@
	curl https://unicode.org/Public/emoji/12.0/emoji-data.txt >> $@

data/GraphemeBreakProperty.json: data/GraphemeBreakProperty.txt script/ucd_to_json.py
	@mkdir -p $(@D)
	python script/ucd_to_json.py < $< > $@

data/GraphemeBreakTest.txt:
	@mkdir -p $(@D)
	curl https://www.unicode.org/Public/12.1.0/ucd/auxiliary/GraphemeBreakTest.txt > $@
