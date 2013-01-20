DEPENDENCIES=.deps
ARTICLES=$(wildcard *.md)

all: $(ARTICLES:.md=.html)

%.html: %.md
	./mcdeps.sh $< > $(subst .md,.d,$<) 
	./join.sh $<
	pandoc -f markdown -t html5 -o ./generated/$@ ./merged/$<

-include $(ARTICLES:.md=.d)
