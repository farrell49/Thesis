TEX_SRC = $(wildcard src/*.tex)
FIG_SRC = $(wildcard fig/*.tex)
# DOT_SRC = $(patsubst %.dot, %.tex, $(wildcard fig/*.dot))

.PHONY: all
all: final

# %.tex : %.dot
# 	dot2tex -ftikz --figonly --autosize --nominsize $< > $@

final: $(TEX_SRC) $(FIG_SRC)
	latexmk -pdf -bibtex -pdflatex='pdflatex -shell-escape -interaction=nonstopmode' -use-make src/cyclic_cycloids.tex

draft: $(TEX_SRC) $(FIG_SRC)
		latexmk -pdf -bibtex -pdflatex='pdflatex -shell-escape -interaction=nonstopmode "\def\isdraft{1} \input{%S}"' -use-make src/cyclic_cycloids.tex

optimized: cyclic_cycloids.pdf
	ghostscript -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/printer -dNOPAUSE -dQUIET -dBATCH -sOutputFile=cyclic_cycloids_opt.pdf cyclic_cycloids.pdf

clean:
	latexmk -CA cyclic_cycloids.pdf
	$(RM) cyclic_cycloids_opt.pdf
