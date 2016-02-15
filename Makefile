MAINFILE := report
TEXSOURCES := $(wildcard *.tex) $(wildcard */*.tex)
BIBSOURCES := $(wildcard *.bib) $(wildcard */*.bib) 
BBLFILES := $(subst bib,bbl,$(BIBSOURCES))

all: $(MAINFILE).pdf

clean:
	find . | egrep ".*(\.(aux|idx|ind|ilg|log|blg|bbl|toc|lof|lot|dvi|tlf|tlt|out|run\.xml|bcf))$$" | xargs rm

$(MAINFILE).pdf: $(MAINFILE).tex $(TEXSOURCES) $(BBLFILES)
	pdflatex $(MAINFILE)

$(BBLFILES): %.bbl: %.bib
	pdflatex $(MAINFILE)
	biber $(MAINFILE)