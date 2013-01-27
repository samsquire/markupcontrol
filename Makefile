ARTICLES=$(wildcard *.md)
MCFILES=$(filter-out "README.md",$(ARTICLES))
DEPENDENCIES=$($ARTICLES:%.md=%.md.d)
GENERATED=$(filter-out "README.html, $(ARTICLES:%.md=./generated/%.html))

.SECONDARY:

-include $(DEPENDENCIES)
.PHONY: clean build all

all: $(GENERATED)

./%.md.d: ./%.md
	echo "Saving dependencies for $< in $@"
	./mcdeps.sh "$<" > ./$@

.SECONDARY:
all: ./generated/%.html: %.md.d 
	./extractfile.sh $(subst .md.d,.md,$<)

build: ./generated/%.html: %.md.d 
	echo "Creating output to $< $@ $(word 3,$^)"
	# ./join.sh $(subst .md.d,.md,$<)
	# pandoc -f markdown -t html5 -o $@ "./merged/$(subst .md.d,.md,$<)"

.PRECIOUS:
build: $(GENERATED)

clean:	
	rm ./output/* && rm ./sections/* && mv ./merged/file . && rm ./merged/* && mv file ./merged	&& rm ./generated/*.html
