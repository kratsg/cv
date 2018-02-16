SOURCES=$(wildcard ./moderncv/*.sty)

all: cv_GiordonStark.pdf

%.pdf: %.tex $(SOURCES)
				pdflatex -interaction=nonstopmode -halt-on-error $(basename $@)
				bibtex papers
				bibtex talks
				pdflatex -interaction=nonstopmode -halt-on-error $(basename $@)
				pdflatex -interaction=nonstopmode -halt-on-error $(basename $@)
				make cleanpartial

cleanpartial:
				-@rm *.aux *.bbl *.bcf *.blg *.dvi *.glg *.glo *.gls *.ist *.lof *.log *.lot *.out *.ps *.run.xml *.toc 2>/dev/null || true

clean: cleanpartial
				-@rm *.pdf 2>/dev/null || true
