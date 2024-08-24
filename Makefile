TEX := pdflatex
BIB := bibtex
FILE := example

all: pdf clean

pdf: *.tex *.cls
	$(TEX) $(FILE)
	magick -quality 100 -density 200 -colorspace sRGB "$(FILE).pdf" -flatten docs/$(FILE).jpg

clean:
	@rm -f *.aux *.fls *.fdb_latexmk *.fls *.log *.out *.toc *.bbl *.bcf *.xml *.gz *blx.bib *blg