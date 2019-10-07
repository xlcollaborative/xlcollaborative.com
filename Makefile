HTML=$(wildcard **/*.html) $(wildcard *.html)
VERSIONS=$(wildcard agreement/*.md)

.PHONY: all

all: $(VERSIONS:.md=.odt) $(VERSIONS:.md=.docx)
	for file in $(HTML); do tidy -config tidy.config $$file | sponge $$file ; done

%.odt: %.md
	pandoc -o $@ $<

%.docx: %.md
	pandoc -o $@ $<
