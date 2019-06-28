data/GraphemeBreakProperty.txt: ucd_version.txt
	@mkdir -p $(@D)
	curl -o $@ https://www.unicode.org/Public/$$(cat ucd_version.txt)/ucd/auxiliary/GraphemeBreakProperty.txt
