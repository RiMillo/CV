LF?=
CF?=-c

EDITOR?=gvim

VIEWER?=evince

.PHONY = all, eng, fra, ita, clean, clean-eng, clean-fra, clean-ita, view, view-eng, view-fra, view-ita, open, open-eng, open-fra, open-ita

all: eng fra ita
eng:
	@echo "Compiling CV_ENG"
	@echo
	@latexmk -cd CV_ENG/CV_ENG.tex $(LF)
	@echo
	@echo "ENG done"
fra:
	@echo "Compiling CV_FRA"
	@echo
	@latexmk -cd CV_FRA/CV_FRA.tex $(LF)
	@echo
	@echo "FRA done"
ita:
	@echo "Compiling CV_ITA"
	@echo
	@latexmk -cd CV_ITA/CV_ITA.tex $(LF)
	@echo
	@echo "ITA done"

clean: clean-eng clean-fra clean-ita
clean-eng:
	@echo "Cleaning CV_ENG (option: $(CF))"
	@latexmk $(CF) -quiet -cd CV_ENG/CV_ENG.tex
clean-fra:
	@echo "Cleaning CV_FRA (option: $(CF))"
	@latexmk $(CF) -quiet -cd CV_FRA/CV_FRA.tex
clean-ita:
	@echo "Cleaning CV_ITA (option: $(CF))"
	@latexmk $(CF) -quiet -cd CV_ITA/CV_ITA.tex

view: view-eng view-fra view-ita
view-eng:
	@$(VIEWER) CV_ENG/CV_ENG.pdf &
view-fra:
	@$(VIEWER) CV_FRA/CV_FRA.pdf &
view-ita:
	@$(VIEWER) CV_ITA/CV_ITA.pdf &

open:
	@gvim -O3 CV_ENG/CV_ENG.tex CV_FRA/CV_FRA.tex CV_ITA/CV_ITA.tex 
open-eng:
	@$(EDITOR) CV_ENG/CV_ENG.tex
open-fra:
	@$(EDITOR) CV_FRA/CV_FRA.tex
open-ita:
	@$(EDITOR) CV_ITA/CV_ITA.tex
