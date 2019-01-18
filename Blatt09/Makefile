LATEXMK=latexmk
INKSCAPE=inkscape

all: StateMachine.eps Transitionen.eps FlipFlop.eps MooreSM.eps Schaltung.eps TransitionenMoore.eps main.tex
	$(LATEXMK) -pdf main.tex

Transitionen.eps: Transitionen.svg
	$(INKSCAPE) --export-eps=Transitionen.eps Transitionen.svg

StateMachine.eps: StateMachine.svg
	$(INKSCAPE) --export-eps=StateMachine.eps StateMachine.svg

FlipFlop.eps: FlipFlop.svg
	$(INKSCAPE) --export-eps=FlipFlop.eps FlipFlop.svg

MooreSM.eps: MooreSM.svg
	$(INKSCAPE) --export-eps=MooreSM.eps MooreSM.svg

Schaltung.eps: Schaltung.svg
	$(INKSCAPE) --export-eps=Schaltung.eps Schaltung.svg

TransitionenMoore.eps: TransitionenMoore.svg
	$(INKSCAPE) --export-eps=TransitionenMoore.eps TransitionenMoore.svg

clean:
	$(LATEXMK) -c
	rm *.pdf
	rm *.eps
