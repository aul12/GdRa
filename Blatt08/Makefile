LATEXMK=latexmk
INKSCAPE=inkscape

all: Scheibe.eps main.tex
	$(LATEXMK) -pdf main.tex

Scheibe.eps: Scheibe.svg
	$(INKSCAPE) --export-eps=Scheibe.eps Scheibe.svg

clean:
	$(LATEXMK) -c
	rm *.pdf
	rm *.eps
