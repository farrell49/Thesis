TEX_SRC = $(wildcard src/*.tex)
FIG_SRC = $(wildcard fig/*.tex)
# DOT_SRC = $(patsubst %.dot, %.tex, $(wildcard fig/*.dot))

.PHONY: all
all: final

# %.tex : %.dot
# 	dot2tex -ftikz --figonly --autosize --nominsize $< > $@

final: $(TEX_SRC) $(FIG_SRC)
	latexmk -pdf -bibtex -pdflatex='pdflatex -shell-escape -interaction=nonstopmode' -use-make src/root.tex

draft: $(TEX_SRC) $(FIG_SRC)
		latexmk -pdf -bibtex -pdflatex='pdflatex -shell-escape -interaction=nonstopmode "\def\isdraft{1} \input{%S}"' -use-make src/root.tex

optimized: root.pdf
	ghostscript -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/printer -dNOPAUSE -dQUIET -dBATCH -sOutputFile=root_opt.pdf root.pdf

clean:
	latexmk -CA root.pdf
	$(RM) root_opt.pdf
