LATEXMK=latexmk
INKSCAPE=inkscape

all: StateMachine.eps Transitionen.eps main.tex
	$(LATEXMK) -pdf main.tex

Transitionen.eps: Transitionen.svg
	$(INKSCAPE) --export-eps=Transitionen.eps Transitionen.svg

StateMachine.eps: StateMachine.svg
	$(INKSCAPE) --export-eps=StateMachine.eps StateMachine.svg

clean:
	$(LATEXMK) -c
	rm *.pdf
	rm *.eps
