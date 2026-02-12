# Makefile for building CV, Resume, and Publications with xelatex
# Usage:
#   make          - build CV and clean auxiliary files
#   make resume   - build Resume and clean auxiliary files
#   make pubs     - build Publications list and clean auxiliary files
#   make all-docs - build all documents
#   make debug    - build CV and keep auxiliary files
#   make clean    - remove all generated files
#   make view     - build CV and open PDF

CV = DanBrenner_CV
RESUME = DanBrenner_Resume
PUBS = DanBrenner_Publications
LATEX = xelatex -interaction=nonstopmode -halt-on-error
BIBTEX = bibtex

CV_AUX = $(CV).aux $(CV).bbl $(CV).blg $(CV).log $(CV).out
RESUME_AUX = $(RESUME).aux $(RESUME).bbl $(RESUME).blg $(RESUME).log $(RESUME).out
PUBS_AUX = $(PUBS).aux $(PUBS).bbl $(PUBS).blg $(PUBS).log $(PUBS).out
ALL_AUX = $(CV_AUX) $(RESUME_AUX) $(PUBS_AUX)

.PHONY: all debug clean view resume pubs all-docs

all: $(CV).pdf
	@rm -f $(CV_AUX)
	@echo "CV build complete. Auxiliary files cleaned."

resume: $(RESUME).pdf
	@rm -f $(RESUME_AUX)
	@echo "Resume build complete. Auxiliary files cleaned."

pubs: $(PUBS).pdf
	@rm -f $(PUBS_AUX)
	@echo "Publications build complete. Auxiliary files cleaned."

all-docs: all resume pubs
	@echo "All documents built successfully."

debug: $(CV).pdf
	@echo "Build complete. Auxiliary files retained for debugging."

$(CV).pdf: $(CV).tex sections/*.tex
	$(LATEX) $(CV)
	$(BIBTEX) $(CV)
	$(LATEX) $(CV)
	$(LATEX) $(CV)

$(RESUME).pdf: $(RESUME).tex sections/*.tex
	$(LATEX) $(RESUME)
	$(BIBTEX) $(RESUME)
	$(LATEX) $(RESUME)
	$(LATEX) $(RESUME)

$(PUBS).pdf: $(PUBS).tex sections/*.tex
	$(LATEX) $(PUBS)
	$(BIBTEX) $(PUBS)
	$(LATEX) $(PUBS)
	$(LATEX) $(PUBS)

clean:
	rm -f $(ALL_AUX) $(CV).pdf $(RESUME).pdf $(PUBS).pdf
	@echo "All generated files removed."

view: all
	evince $(CV).pdf &
