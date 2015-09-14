DOCFILE= dissertacao
DOCNAME= "dissertacao"
RM= rm -rf
LATEX= pdflatex -interaction=nonstopmode
#-shell-escape  -file-line-error
BIBTEX= bibtex
VIEWPDF= okular

TODAY=`date +"%Y-%m-%d"`

.PHONY: core pdf clean

core:
	${LATEX} ${DOCFILE}
	${LATEX} ${DOCFILE}

bib:
	${BIBTEX} ${DOCFILE}

pdf:
	make core
	make bib
	${LATEX} ${DOCFILE}
	${VIEWPDF} ${DOCNAME}.pdf

clean:
	${RM} *.aux *.blg *.dvi *.lof *.log *.pgn *.tex~ *.backup *.toc *~ *.out *.brf
	${RM} conteudo/*aux conteudo/*blg conteudo/*dvi conteudo/*lof conteudo/*log conteudo/*pgn conteudo/*tex~ conteudo/*backup conteudo/*toc conteudo/*~
