LATEXMK=latexmk
INKSCAPE=inkscape
DOT=dot

all: main.tex automat.pdf
	$(LATEXMK) -pdf main.tex

automat.pdf: automat.dot
	$(DOT) -Tpdf -o automat.pdf automat.dot

clean:
	$(LATEXMK) -c
	rm *.pdf
	rm *.eps
