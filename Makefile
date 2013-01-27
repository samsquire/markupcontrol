ARTICLES=$(wildcard *.md)
MCFILES=$(filter-out "README.md",$(ARTICLES))
DEPENDENCIES=$($ARTICLES:%.md=%.md.d)
GENERATED=$(filter-out "README.html, $(ARTICLES:%.md=./generated/%.html))
MERGED=$(ARTICLES:%.md=./merged/%.md)

.SECONDARY:

.PHONY: clean build all

%.md.d: %.md
	echo "Saving dependencies for $< in $@"
	./mcdeps.sh "$<" > ./$@
	echo "extracting $<"
	./extractfile.sh $<

.PRECIOUS:
extract: $(DEPENDENCIES)
merge: $(MERGED)
build: $(GENERATED)


.SECONDARY:
./merged/%.md: ./%.md.d
	 ./join.sh $(subst .md.d,.md,$<)

./generated/%.html: ./merged/%.md 
	echo "${MERGED}"
	# pandoc -f markdown -t html5 -o $@ "./merged/$(subst .md.d,.md,$<)"

-include $(DEPENDENCIES)

clean:	
	-rm sections/*
	-mv merged/file . && rm merged/* && mv file ./merged
	-rm generated/*.html
	-rm output/* 
