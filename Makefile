# Create paper from LaTeX source, stashing all temporary files in ./build
paper : ./src/paper.tex
	latexmk --pdflatex --silent --auxdir=./build --outdir=./build $<
	cp --force ./build/$@.pdf ./dist/$@.pdf

# Create slides from LaTeX source, stashing all temporary files in ./build
slides-75mins : ./src/slides-75mins.tex
	latexmk --pdflatex --silent --auxdir=./build --outdir=./build $<
	cp --force ./build/$@.pdf ./dist/$@.pdf
