.PHONY = all, eng, fra, ita, clean, clean-eng, clean-fra, clean-ita 

all: eng fra ita
eng:
	cd CV_ENG && latexmk && cd ..
fra:
	cd CV_FRA && latexmk && cd ..
ita:
	cd CV_ITA && latexmk && cd ..

clean: clean-eng clean-fra clean-ita
clean-eng:
	@echo "Cleaning CV_ENG"
	@cd CV_ENG && latexmk -c -quiet && cd ..
clean-fra:
	@echo "Cleaning CV_FRA"
	@cd CV_FRA && latexmk -c -quiet && cd ..
clean-ita:
	@echo "Cleaning CV_ITA"
	@cd CV_ITA && latexmk -c -quiet && cd ..
