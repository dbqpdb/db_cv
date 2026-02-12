# Makefile for building CV with xelatex
# Usage:
#   make          - build CV and clean auxiliary files
#   make debug    - build CV and keep auxiliary files
#   make clean    - remove all generated files
#   make view     - build and open PDF

DOCUMENT = DanBrenner_CV
LATEX = xelatex -interaction=nonstopmode -halt-on-error
BIBTEX = bibtex

AUX_FILES = $(DOCUMENT).aux $(DOCUMENT).bbl $(DOCUMENT).blg $(DOCUMENT).log $(DOCUMENT).out

.PHONY: all debug clean view

all: $(DOCUMENT).pdf
	@rm -f $(AUX_FILES)
	@echo "Build complete. Auxiliary files cleaned."

debug: $(DOCUMENT).pdf
	@echo "Build complete. Auxiliary files retained for debugging."

$(DOCUMENT).pdf: $(DOCUMENT).tex
	$(LATEX) $(DOCUMENT)
	$(BIBTEX) $(DOCUMENT)
	$(LATEX) $(DOCUMENT)
	$(LATEX) $(DOCUMENT)

clean:
	rm -f $(AUX_FILES) $(DOCUMENT).pdf
	@echo "All generated files removed."

view: all
	evince $(DOCUMENT).pdf &
