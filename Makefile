HTML=$(wildcard **/*.html) $(wildcard *.html)
FORMS=$(wildcard agreement/*.md)
DOT_FLAGS=-Nfontname=Arial -Efontname=Arial -Gfontname=Arial

figures=$(wildcard figures/*.dot)

.PHONY: all

all: $(FORMS:.md=.odt) $(FORMS:.md=.docx) $(FORMS:.md=.pdf) logo-500.png logo-1000.png $(figures:.dot=.png) $(figures:.dot=.svg)
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

logo-%.png: logo.svg
	inkscape $< -w $* -e $@
