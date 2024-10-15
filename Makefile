LF?=
CF?=-c

EDITOR?=gvim

VIEWER?=evince

.PHONY = all, eng, fra, ita, clean, clean-eng, clean-fra, clean-ita, view, view-eng, view-fra, view-ita, edit, edit-eng, edit-fra, edit-ita

all: eng fra ita
eng:
	@echo "Compiling CV_ENG"
	@echo
	@cd CV_ENG && latexmk $(LF) CV_ENG.tex && cd ..
	@echo
	@echo "ENG done"
fra:
	@echo "Compiling CV_FRA"
	@echo
	@cd CV_FRA && latexmk $(LF) CV_FRA.tex && cd ..
	@echo
	@echo "FRA done"
ita:
	@echo "Compiling CV_ITA"
	@echo
	@cd CV_ITA && latexmk $(LF) CV_ITA.tex && cd ..
	@echo
	@echo "ITA done"

clean: clean-eng clean-fra clean-ita
clean-eng:
	@echo "Cleaning CV_ENG (option: $(CF))"
	@echo -n "  "
	@cd CV_ENG && latexmk $(CF) -quiet CV_ENG.tex && cd ..
clean-fra:
	@echo "Cleaning CV_FRA (option: $(CF))"
	@echo -n "  "
	@cd CV_FRA && latexmk $(CF) -quiet CV_FRA.tex && cd ..
clean-ita:
	@echo "Cleaning CV_ITA (option: $(CF))"
	@echo -n "  "
	@cd CV_ITA && latexmk $(CF) -quiet CV_ITA.tex && cd ..

view: view-eng view-fra view-ita
view-eng:
	@$(VIEWER) CV_ENG/CV_ENG.pdf &
view-fra:
	@$(VIEWER) CV_FRA/CV_FRA.pdf &
view-ita:
	@$(VIEWER) CV_ITA/CV_ITA.pdf &

edit:
	@gvim -O3 CV_ENG/CV_ENG.tex CV_FRA/CV_FRA.tex CV_ITA/CV_ITA.tex
edit-eng:
	@$(EDITOR) CV_ENG/CV_ENG.tex
edit-fra:
	@$(EDITOR) CV_FRA/CV_FRA.tex
edit-ita:
	@$(EDITOR) CV_ITA/CV_ITA.tex
