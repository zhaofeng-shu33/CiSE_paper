BUILD_DIR = ./build

.PHONY: all

all: $(BUILD_DIR)/exportlist.bib $(BUILD_DIR)/CsMag_main.pdf

$(BUILD_DIR)/exportlist.bib: exportlist.bib
	mkdir -p $(BUILD_DIR)
	cp exportlist.bib $(BUILD_DIR)/


$(BUILD_DIR)/CsMag_main.pdf: CsMag_main.tex $(BUILD_DIR)/exportlist.bib
	mkdir -p $(BUILD_DIR)
	pdflatex -output-directory=$(BUILD_DIR) CsMag_main.tex
	cd $(BUILD_DIR) && bibtex CsMag_main.aux && cd ..
	pdflatex -output-directory=$(BUILD_DIR) CsMag_main.tex
	pdflatex -output-directory=$(BUILD_DIR) CsMag_main.tex