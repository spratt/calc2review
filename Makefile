TEX	= pdflatex
TEXOPTS	= -halt-on-error

THEORY	= theory.pdf

REVIEW	= review.pdf

TARGETS = ${THEORY} ${REVIEW}

FIGURES	= 

.PHONY = review theory all open_${THEORY} open_${REVIEW} clean
.INTERMEDIATE: %.aux %.log %.dvi

review: ${REVIEW} open_${REVIEW}

theory:	${THEORY} open_${THEORY}

all: open_${THEORY} open_${REVIEW}

open_%: %
	gnome-open $< || open $<

%.pdf:	%.tex ${FIGURES}
	${TEX} ${TEXOPTS} $<
	${TEX} ${TEXOPTS} $<

clean:
	rm -f *.log *.aux *.dvi ${REVIEW} ${THEORY}
