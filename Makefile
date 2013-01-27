ARTICLES=$(wildcard *.md)
MCFILES=$(filter-out "README.md",$(ARTICLES))
DEPENDENCIES=$($ARTICLES:%.md=%.md.d)
GENERATED=$(filter-out "README.html, $(ARTICLES:%.md=./generated/%.html))

-include $(DEPENDENCIES)

.SECONDARY:
./%.md.d: ./%.md
	echo "Saving dependencies for $< in $@"
	./mcdeps.sh "$<" > ./$@

.SECONDARY:
./generated/%.html: %.md.d 
	./extractfile.sh $(subst .md.d,.md,$<)
	./join.sh $(subst .md.d,.md,$<)
	pandoc -f markdown -t html5 -o $@ "./merged/$(subst .md.d,.md,$<)"

./generated/index.html: $(GENERATED)

.PRECIOUS:
all: $(GENERATED)

.PHONY: clean
clean:	
	rm ./output/* && rm ./sections/* && mv ./merged/file . && rm ./merged/* && mv file ./merged	&& rm ./generated/*.html
