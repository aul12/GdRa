LATEXMK=latexmk
INKSCAPE=inkscape

all: main.tex
	$(LATEXMK) -pdf main.tex

clean:
	$(LATEXMK) -c
	rm *.pdf
	rm *.eps
