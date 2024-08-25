TEX := pdflatex
BIB := bibtex
FILE := example
LINK := https://marcfranquesa.github.io/minimalist-resume/$(FILE).pdf

all: pdf clean

image: *pdf
	@magick -quality 100 -density 200 -colorspace sRGB "$(FILE).pdf" -flatten docs/$(FILE).jpg

pdf: *.tex *.cls
	$(TEX) $(FILE)
	@make image

index:
	@touch index.html
	@echo "<!DOCTYPE html>" > index.html
	@echo "<html lang=\"en\">" >> index.html
	@echo "<head><meta charset="UTF-8"/>" >> index.html
	@echo "<meta http-equiv=\"refresh\" content=0; url=\"$(LINK)\" />" >> index.html
	@echo "<script type=\"text/javascript\"> window.location.href = \"$(LINK)\"; </script>" >> index.html
	@echo "</head>" >> index.html
	@echo "<body>" >> index.html
	@echo "If you are not redirected automatically, follow this <a href=\"$(LINK)\" aria-label=\"Redirect to example\">link</a>." >> index.html
	@echo "</body>" >> index.html
	@echo "</html>" >> index.html

build: all index
	@mkdir build
	@cp $(FILE).pdf build/$(FILE).pdf
	@mv index.html build

clean:
	@rm -rf *.aux *.fls *.fdb_latexmk *.fls *.log *.out *.toc *.bbl *.bcf *.xml *.gz *blx.bib *blg build