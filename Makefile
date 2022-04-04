all: main.pdf

TEXFILES = main.tex macros.tex skeleton.tex

main.pdf: $(TEXFILES)
	latexmk -pdf -synctex=1 main

fcs.pdf: fcs.tex ref.bib
	latexmk -pdf fcs

fast:
	pdflatex main
	bibtex main
	cp main.pdf temp.pdf

clean:
	latexmk -C main
	ocamlbuild -clean
	rm -f *.vo *.glob


cleanall: clean
	latexmk -c main
	rm -f *.bbl

skel:
	latexmk -pdf -synctex=1 skeleton
