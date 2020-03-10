LF?=
CF?=-c

EDITOR?=gvim

VIEWER?=evince

.PHONY = all, eng, fra, ita, clean, clean-eng, clean-fra, clean-ita, view, view-eng, view-fra, view-ita, open, open-eng, open-fra, open-ita

all: eng fra ita
eng:
	@echo "Compiling CV_ENG"
	@cd CV_ENG && latexmk $(LF) && cd ..
fra:
	@echo "Compiling CV_FRA"
	@cd CV_FRA && latexmk $(LF) && cd ..
ita:
	@echo "Compiling CV_ITA"
	@cd CV_ITA && latexmk $(LF) && cd ..

clean: clean-eng clean-fra clean-ita
clean-eng:
	@echo "Cleaning CV_ENG"
	@cd CV_ENG && latexmk $(CF) -quiet && cd ..
clean-fra:
	@echo "Cleaning CV_FRA"
	@cd CV_FRA && latexmk $(CF) -quiet && cd ..
clean-ita:
	@echo "Cleaning CV_ITA"
	@cd CV_ITA && latexmk $(CF) -quiet && cd ..

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
