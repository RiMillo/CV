LF?=
CF?=-c

.PHONY = all, eng, fra, ita, clean, clean-eng, clean-fra, clean-ita 

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
