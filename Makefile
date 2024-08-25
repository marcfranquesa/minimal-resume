DIR := src
TEX := pdflatex
BIB := bibtex
FILE := example
LINK := https://marcfranquesa.github.io/minimalist-resume/$(FILE).pdf

all: pdf image clean

image: $(DIR)/*.pdf
	@magick -quality 100 -density 200 -colorspace sRGB "$(DIR)/$(FILE).pdf" -flatten docs/$(FILE).jpg

pdf: $(DIR)/*.tex $(DIR)/*.cls
	cd $(DIR) && $(TEX) $(FILE)

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

build: pdf index clean
	@mkdir build
	@cp $(DIR)/$(FILE).pdf build/$(FILE).pdf
	@mv index.html build

clean:
	@rm -rf $(DIR)/*.aux $(DIR)/*.fls $(DIR)/*.fdb_latexmk $(DIR)/*.fls $(DIR)/*.log $(DIR)/*.out $(DIR)/*.toc $(DIR)/*.bbl $(DIR)/*.bcf $(DIR)/*.xml $(DIR)/*.gz $(DIR)/*blx.bib $(DIR)/*blg
	@rm -rf build