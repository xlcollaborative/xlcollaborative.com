HTML=$(wildcard **/*.html) $(wildcard *.html)

.PHONY: all

all:
	for file in $(HTML); do tidy -config tidy.config $$file | sponge $$file ; done
