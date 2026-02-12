# db_cv

LaTeX source for my CV, resume, and publications list.

## Documents

- **DanBrenner_CV.pdf** - Full academic CV
- **DanBrenner_Resume.pdf** - 2-page resume (recent experience)
- **DanBrenner_Publications.pdf** - Publications list

## Build

Requires XeLaTeX, BibTeX, and Linux Libertine O font.

```bash
make          # Build CV
make resume   # Build resume
make pubs     # Build publications list
make all-docs # Build all documents
make clean    # Remove generated files
```

## Structure

Shared content lives in `sections/` and is included by each main document.
