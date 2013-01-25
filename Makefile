ARTICLES=$(wildcard *.md)
MCFILES=$(filter-out "README.md",$(ARTICLES))
DEPENDENCIES=$($ARTICLES:%.md=%.md.d)
GENERATED=$(filter-out "README.html, $(ARTICLES:%.md=./generated/%.html))

.SECONDARY:
./%.md.d: ./%.md
	echo "Saving dependencies for $< in $@"
	./mcdeps.sh "$<" > ./$@

.SECONDARY:
./generated/%.html: %.md.d
	./join.sh $(subst .md.d,.md,$<)
	pandoc -f markdown --strict -t html5 -o $@ "./merged/$(subst .md.d,.md,$<)"
	echo "generated"

-include $(DEPENDENCIES)

.PRECIOUS:
all: $(GENERATED)
