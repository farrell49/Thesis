# ICRA 2017 Submission #

You can build this document by simply typing `make` in the top level directory. 
This builds a PDF "root.pdf".
This will call `latexmk`, which calls `pdflatex` to compile the document.
Additionally, the makefile calls `ghostscript` to optimize the size of the output PDF.
This builds a PDF "root\_opt.pdf"

## Required Software ##

The following software is necessary to build the complete PDF.

* pdflatex
* latexmk
* ghostscript
* graphviz
* dot2tex