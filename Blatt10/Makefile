LATEXMK=latexmk
INKSCAPE=inkscape

all: 3BitAdder.eps 3BitKrassesDing.eps main.tex
	$(LATEXMK) -pdf main.tex

3BitAdder.eps: 3BitAdder.svg
	$(INKSCAPE) --export-eps=3BitAdder.eps 3BitAdder.svg

3BitKrassesDing.eps: 3BitKrassesDing.svg
	$(INKSCAPE) --export-eps=3BitKrassesDing.eps 3BitKrassesDing.svg

clean:
	$(LATEXMK) -c
	rm *.pdf
	rm *.eps
