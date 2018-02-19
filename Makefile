SOURCES=$(wildcard ./resume.cls ./*.bib ./env.tex)

all: cv_GiordonStark.pdf

%.pdf: %.tex $(SOURCES)
				xelatex -interaction=nonstopmode -halt-on-error $(basename $@)
				bibtex papers
				bibtex talks
				xelatex -interaction=nonstopmode -halt-on-error $(basename $@)
				xelatex -interaction=nonstopmode -halt-on-error $(basename $@)
				make cleanpartial

cleanpartial:
				-@rm *.aux *.bbl *.bcf *.blg *.dvi *.glg *.glo *.gls *.ist *.lof *.log *.lot *.out *.ps *.run.xml *.toc 2>/dev/null || true

clean: cleanpartial
				-@rm *.pdf 2>/dev/null || true
