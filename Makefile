HTML=$(wildcard **/*.html) $(wildcard *.html)
VERSIONS=$(wildcard agreement/*.md)
DOT_FLAGS=-Nfontname=Arial -Efontname=Arial -Gfontname=Arial

figures=$(wildcard figures/*.dot)

.PHONY: all

all: $(VERSIONS:.md=.odt) $(VERSIONS:.md=.docx) $(VERSIONS:.md=.pdf) $(figures:.dot=.png) $(figures:.dot=.svg)
	for file in $(HTML); do tidy -config tidy.config $$file | sponge $$file ; done

%.odt: %.md
	pandoc -o $@ $<

%.docx: %.md
	pandoc -o $@ $<

%.pdf: %.md
	pandoc --variable fontsize=11pt -o $@ $<

%.png: %.dot
	dot -Tpng $(DOT_FLAGS) < $< > $@

%.svg: %.dot
	dot -Tsvg $(DOT_FLAGS) < $< > $@
