DOCFILE= dissertacao
DOCNAME= "dissertacao"
RM= rm -rf
LATEX= latex
DVIPDF= dvipdfm
DVIPS= dvips

VIEWDVI= xdvi
VIEWPDF= evince
VIEWPS= gv
PCTMAKER= mkpct

TODAY=`date +"%Y-%m-%d"`

.PHONY: core dvi ps pdf clean superclean snapshot pack all images

core:
	${LATEX} ${DOCFILE}.tex
	${LATEX} ${DOCFILE}.tex

dvi:
	make core
	${VIEWDVI} ${DOCFILE}.dvi

ps:
	make core
	${DVIPS} -o ${DOCNAME}.ps ${DOCFILE}.dvi
	${VIEWPS} ${DOCNAME}.ps
	
pdf:
	make core
	${DVIPDF} -p a4 -o ${DOCNAME}.pdf ${DOCFILE}.dvi
	${VIEWPDF} ${DOCNAME}.pdf
	

clean:
	${RM} *.aux *.blg *.dvi *.lof *.log *.pgn *.tex~ *.backup *.toc *~ *.out *.brf
	${RM} conteudo/*aux conteudo/*blg conteudo/*dvi conteudo/*lof conteudo/*log conteudo/*pgn conteudo/*tex~ conteudo/*backup conteudo/*toc conteudo/*~


