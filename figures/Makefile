inputs=$(wildcard *.dot)
FLAGS=-Nfontname=Arial -Efontname=Arial -Gfontname=Arial

all: $(inputs:.dot=.png) $(inputs:.dot=.svg)

%.png: %.dot
	dot -Tpng $(FLAGS) < $< > $@

%.svg: %.dot
	dot -Tsvg $(FLAGS) < $< > $@
