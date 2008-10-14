CONF_FILES = dissdefs.tex
EXP_FILES = exp_aufbau.tex\
	exp_bulk.tex\
	exp_film.tex\
	exp_film-cr.tex\
	exp_substrate.tex
THEO_FILES = theo_helium_filme.tex\
	theo_zweikomponenten.tex\
	theo_electrons_on_helium.tex\
	theo_cavity.tex\
	theo_magnetfeld.tex\
	theo_phasendiagramm.tex\
	stand_der_forschung.tex
APP_FILES = app_symbole.tex\
	app_elektronik.tex
BIB_FILES = bib/Paper.bib\
	bib/Literatur.bib\

INPUTFILES= $(CONF_FILES) $(EXP_FILES) $(THEO_FILES) $(APP_FILES) $(BIB_FILES) \
	main.bbl

all: subdirs main.pdf

subdirs: 
	make -C exp_aufbau
	make -C exp_bulk
	make -C exp_film
	make -C exp_film-cr
	make -C exp_kelvin
	make -C exp_substrate
	make -C stand_der_forschung
	make -C theo_cavity
	make -C theo_helium_filme
	make -C theo_magnetfeld
	make -C theo_phasendiagramm
	make -C theo_zweikomponenten

main.pdf: main.tex $(INPUTFILES)
	pdflatex main
	pdflatex main

main.bbl: $(BIBFILES) main.aux main.tex
	pdflatex main.tex
	bibtex main

main.aux: main.tex
	pdflatex main
	
clean: subdirs_clean
	rm -f *.log *.pdf *.aux *.lof *.toc *.ps *.dvi *.bbl *.blg *.brf

subdirs_clean:
	make -C exp_aufbau clean
	make -C exp_bulk clean
	make -C exp_film clean
	make -C exp_film-cr clean
	make -C exp_kelvin clean
	make -C exp_substrate clean
	make -C stand_der_forschung clean
	make -C theo_cavity clean
	make -C theo_helium_filme clean
	make -C theo_magnetfeld clean
	make -C theo_phasendiagramm clean
	make -C theo_zweikomponenten clean
