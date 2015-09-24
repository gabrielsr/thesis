\NeedsTeXFormat{LaTeX2e}[1994/12/01]
\ProvidesClass{quali}[2006/12/19  classe para qualificação CIC/UnB]
\RequirePackage{ifthen}
\ProcessOptions
\LoadClass[a4paper,12pt]{article}


\def\prof{\@ifnextchar[%
             {\@prof@}%
             {\@prof}}

\def\@prof@[#1]#2{\setbox0=\hbox{\scriptsize \b{a}}%
                  \setbox1=\hbox{r}%
                  Prof\hskip.05em\raise\ht1\hbox{\usebox0}\kern-\wd0. #2}

\def\@prof#1{Prof. #1}

\def\dr{\@ifnextchar[%
             {\@dra@}%
             {\@dr}}

\def\@dra@[#1]#2{\setbox0=\hbox{\scriptsize \b{a}}%
                  \setbox1=\hbox{r}%
                  Dr\hskip.05em\raise\ht1\hbox{\usebox0}\kern-\wd0. #2}

\def\@dr#1{Dr. #1}


\newcommand\logo{%% desenha o logo da UnB 
\setlength{\unitlength}{2.5mm}
\begin{picture}(10,4)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% canto superior esquerdo
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\thinlines
\qbezier(0,3.5)(2.25,2)(4,2)
\put(4,2){\line(0,1){2}}
\put(4,4){\line(-1,0){4}}
\put(0,4){\line(0,-1){0.5}}
%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% canto inferior esquerdo
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\qbezier(0,3.3)(2.25,1.8)(4,1.8)
\put(4,1.8){\line(0,-1){1.8}}
\put(4,0){\line(-1,0){4}}
\put(0,0){\line(0,1){3.3}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% canto inferior direito
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\qbezier(8.2,3.3)(6.45,1.8)(4.2,1.8)
\put(4.2,1.8){\line(0,-1){1.8}}
\put(4.2,0){\line(1,0){4}}
\put(8.2,0){\line(0,1){3.3}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% canto superior direito
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\qbezier(8.2,3.5)(6.45,2)(4.2,2)
\put(8.2,3.5){\line(0,1){0.5}}
\put(8.2,4){\line(-1,0){4}}
\put(4.2,4){\line(0,-1){2}}
\end{picture}}


\newcommand\capa{%
  \begin{paginatitulo}%
       \begin{center}\vspace*{-3truecm}%
           \logo\\
           \vspace{.5\baselineskip}
           {\Large Universidade de Bras\'{\i}lia}\\[.5\baselineskip]
           {\Large Instituto de Ci\^encias Exatas}\\[.5\baselineskip]
           {\Large Departamento de Ci\^encia da Computa\c{c}\~ao}\\[2truecm]
           \null\vfill%
           \textbf{\Large \@title} \par%
             \vfill%
             {\large \@author}%
             \vfill%
             {Documento apresentado para exame de qualifica\c{c}\~{a}o
             do Curso de Mestrado em Inform\'{a}tica}
            \vfill%
            {\@sexoorientador\\ \@nomeorientador\\%
             \ifthenelse{\boolean{co@ori@}}%
                 {\vskip 1cm\@sexocoorientador\\%
                  \@nomecoorientador}%
                 {\relax}}%ramo else
            \vfill%
            {\large Bras\'{\i}lia}\\
            {\large \@ano}%
       \end{center}%
  \end{paginatitulo}%
}


\def\figuras{\listoffigures}
\def\tabelas{\listoftables}
\def\sumario{\thispagestyle{empty}\tableofcontents}


\newenvironment{paginatitulo}
    {\cleardoublepage%
      \if@twocolumn
        \@restonecoltrue\onecolumn
      \else
        \@restonecolfalse\newpage
      \fi
      \thispagestyle{empty}%
      %\addtocounter{page}\@ne%descomente esta linha pra contar de 3
      %%%%%%%%%%%%%%%%%%%%%%%%%em 3!
    }%
    {\if@restonecol\twocolumn \else \newpage \fi
     \if@twoside\else 
        %\addtocounter{page}\@ne% VIDE ACIMA
     \fi
    }


\renewenvironment{abstract}
   {\begin{paginatitulo}\null\vspace{1cm}%
       \begin{center}  \bfseries\itshape \LARGE \abstractname
       \end{center}}
       {\vskip 15pt\noindent\textbf{Keywords:}\ \@keywords%
    \end{paginatitulo}}

\def\@keywords#1{\gdef\@@engkeys{#1}\par\vfil\null}
\def\@@engkeys#1{\noexpand\@keywords{#1}}
\def\keywords#1{\gdef\@keywords{#1}}


\newenvironment{resumo}
   {\begin{paginatitulo}\null\vspace{1cm}%
       \begin{center}  \bfseries\itshape \LARGE \abstractname
       \end{center}}
       {\vskip 15pt\noindent\textbf{Palavras-chave:}\ \@palavraschave%
 \setcounter{page}{0}%
    \end{paginatitulo}}

\def\@palavraschave#1{\gdef\@@keys{#1}\par\vfil\null}
\def\@@keys#1{\noexpand\@palavraschave{#1}}
\def\palavraschave#1{\gdef\@palavraschave{#1}}
\let\palavraschaves=\palavraschave


\newboolean{co@ori@}\setboolean{co@ori@}{false}

\def\coorientador{\setboolean{co@ori@}{true}%
           \@ifnextchar[%]
              {\at@coorienta}%Se primeiro argumento opcional chama esta
              {\at@cooriento}}%senao chama esta rotina

\def\at@coorienta[#1]#2#3{\def\@sexocoorientador{Coorientador#1}%
                        \def\@nomecoorientador{{#2}}%
                        \def\@filicoorientador{{#3}}}

\def\at@cooriento#1#2{\def\@sexocoorientador{Coorientador}%
                        \def\@nomecoorientador{#1}%
                        \def\@filicoorientador{#2}}



\def\orientador{\@ifnextchar[%
              {\at@orienta}%Se primeiro argumento opcional chama esta
              {\at@oriento}}%senao chama esta rotina

\def\at@orienta[#1]#2#3{\def\@sexoorientador{Orientador#1}%
                        \def\@nomeorientador{{#2}}%
                        \def\@filiorientador{{#3}}}

\def\at@oriento#1#2{\def\@sexoorientador{Orientador}%
                        \def\@nomeorientador{#1}%
                        \def\@filiorientador{#2}}


\def\diamesano#1#2#3{\def\@mes{#2}%
                     \def\@ano{#3}%
                     \def\@dia{#1}}




\newcommand{\bibliografia}[2]%
   {\addcontentsline{toc}{section}{Refer\^{e}ncias}%
   \let\bibname=\refname
    \bibliography{#1}%%
    \bibliographystyle{#2}}



%%
%% EOF: quali.cls
%%
