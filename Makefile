# Create paper from LaTeX source, stashing all temporary files in /tmp
paper.pdf : src/paper.tex
	latexmk --pdflatex --silent --auxdir=/tmp --outdir=/tmp $<
	cp --force /tmp/paper.pdf ./dist/$@

# Create slides from LaTeX source, stashing all temporary files in /tmp
slides-75mins.pdf : src/slides-75mins.tex
	latexmk --pdflatex --silent --auxdir=/tmp --outdir=/tmp $<
	cp --force /tmp/slides-75mins.pdf ./dist/$@
