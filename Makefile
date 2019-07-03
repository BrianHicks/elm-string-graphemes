# modules

.PHONY: all
all: generated

.PHONY: test
test: generated
	elm-verify-examples
	elm-test

.PHONY: ci
ci: test size-benchmarks/report.txt
	test -z "$(shell git diff)"

.PHONY: generated
generated: $(foreach class,CR LF Control Prepend Regional_Indicator L V T LV LVT Extended_Pictographic Extend SpacingMark ZWJ,src/String/Graphemes/Data/$(class).elm) tests/GraphemeBreakTest.elm

src/String/Graphemes/Data/%.elm: data/GraphemeBreakProperty.json script/generate-matcher.py
	@mkdir -p $(@D)
	python script/generate-matcher.py $@ < $<

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

# benchmarks

size-benchmarks/report.txt: generated $(shell find src size-benchmarks -name '*.elm') size-benchmarks/stats.py
	cd $(@D); ./stats.py > $(@F)

size-benchmarks/names-in-%.txt: size-benchmarks/%.js size-benchmarks/report.txt
	grep -E '^var .+ =' $< | cut -f 2 -d ' ' | sort > $@

size-benchmarks/new-names.txt: size-benchmarks/names-in-withoutSegmentation.txt size-benchmarks/names-in-withSegmentation.txt
	grep -v size-benchmarks/names-in-withoutSegmentation.txt size-benchmarks/names-in-withSegmentation.txt > $@

benchmarks/benchmark.html: generated $(shell find src benchmarks -name '*.elm')
	cd $(@D); elm make --output=$(@F) src/Main.elm
