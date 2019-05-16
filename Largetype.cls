% This style requires Charis SIL and the IM Fell Types.

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{Largetype}

%%  Class loading and defaults:  %%

\LoadClass[a5paper, 17pt, openany, twoside, extrafontsizes]{memoir}

\RequireXeTeX

%%  Initial packages:  %%

\RequirePackage[usenames,dvipsnames,svgnames,table]{xcolor}
\RequirePackage{calc, metalogo, amsmath, graphicx}

%%  Font and language setup:  %%

\RequirePackage{fontspec, polyglossia}
\defaultfontfeatures{Mapping={tex-text}}
\setmainlanguage[variant=uk,ordinalmonthday=false]{english}
\setmainfont{Charis SIL}
\newfontfamily{\vanillafont}{Charis SIL}
\newfontface{\initials}{IM FELL THREE LINE PICA PRO}
\newfontface{\IMFlowerfontA}{IM FELL FLOWERS 1}
\newfontface{\IMFlowerfontB}{IM FELL FLOWERS 2}
\newcommand{\textvanilla}[1]{{\vanillafont #1}}
\newcommand{\fellpattern}[1]{\raisebox{.35em}{\IMFlowerfontA #1}}
\newcommand{\fellflower}[1]{{\IMFlowerfontB #1}}
\newcommand{\subs}[1]{\raisebox{-.35ex}{\scriptsize #1}}
\newcommand{\supers}[1]{\raisebox{.7ex}{\scriptsize #1}}

%%  Page geometry:  %%

\settypeblocksize{432.5pt}{311pt}{*} % This typeblock is set to match Standard. %
\setlrmargins{54pt}{*}{*}  %  This gives us at least .75in on the edge, always.
\setulmargins{60pt}{*}{*}  %  This creates a top:bottom ratio of almost exactly 4:7, which looks very nice
\setheadfoot{\baselineskip}{24pt}
\setheaderspaces{*}{17pt}{*}
% \setstocksize{11in}{8.5in}  %  This sets the page up on letter stock
% \setpagecc{\paperheight}{\paperwidth}{*}  %  This centers the page on the stock
\checkandfixthelayout[nearest]
\newlength{\topheight}
\setlength{\topheight}{121.5pt}

%%  Empty last page:  %%

\AtEndDocument{\atendtext\cleartoevenpage[\null\thispagestyle{empty}]\null\pagestyle{empty}}

%%  Frame formatting:  %%

\setlength{\fboxrule}{1pt}
\setlength{\fboxsep}{23pt}

%%  List formatting:  %%

\RequirePackage[inline]{enumitem}

%%  Date/time setup:  %%

\RequirePackage[english, cleanlook]{isodate}

%%  Quotation setup:  %%

\RequirePackage[style=french,french=guillemets]{csquotes}
\DeclareQuoteStyle[guillemets]{french}{« }[» ]{ »}{« }[» ]{ »}


%%  Footnote formatting:  %%

\footmarkstyle{#1.\hfill}
\setlength{\footmarkwidth}{1.7em}
\setlength{\footmarksep}{-1.7em}
\setlength{\footparindent}{1.7em}
\setlength{\footnotesep}{\onelineskip}
\setfootins{28pt plus 17pt minus 12pt}{22pt}
\feetbelowfloat
\renewcommand{\@makefntext}[1]{\makefootmark #1}
\renewcommand{\foottextfont}{\scriptsize}

%%  Chapter formatting:  %%

\makechapterstyle{IMextra}{
\renewcommand*{\chapterheadstart}{}
\renewcommand*{\printchaptername}{}
\renewcommand*{\chapternamenum}{}
\renewcommand*{\printchapternum}{}
\renewcommand*{\afterchapternum}{}
\renewcommand*{\printchapternonum}{}
\renewcommand{\printchaptertitle}[1]{\centering\parbox[m][\topheight][t]{\textwidth}{\centering\begin{vplace}[2]\chaptitlefont ##1\end{vplace}}\par}
\renewcommand*{\afterchaptertitle}{\vspace{0pt plus 9pt minus 3pt}}
\renewcommand*{\chapnamefont}{}
\renewcommand*{\chapnumfont}{}
\renewcommand*{\chaptitlefont}{\LARGE}
}
\makechapterstyle{7c}{
\renewcommand*{\chapterheadstart}{}
\renewcommand*{\printchaptername}{}
\renewcommand*{\chapternamenum}{}
\renewcommand*{\printchapternum}{}
\renewcommand*{\afterchapternum}{}
\renewcommand*{\printchapternonum}{}
\renewcommand{\printchaptertitle}[1]{\centering\parbox[m][\topheight][b]{274pt}{\noindent\llap{\makebox[32pt][l]{\chapnumfont \arabic{chapter}}}{\chaptitlefont\enquote*{##1}}\par\vspace{22pt}}\par}
\renewcommand*{\afterchaptertitle}{\vspace{0pt plus 9pt minus 3pt}}
\renewcommand*{\chapnamefont}{}
\renewcommand*{\chapnumfont}{\LARGE}
\renewcommand*{\chaptitlefont}{\LARGE\itshape}
}
\makechapterstyle{verbose7c}{
\renewcommand*{\chapterheadstart}{}
\renewcommand*{\printchaptername}{}
\renewcommand*{\chapternamenum}{}
\renewcommand*{\printchapternum}{}
\renewcommand*{\afterchapternum}{}
\renewcommand*{\printchapternonum}{}
\renewcommand{\printchaptertitle}[1]{\centering\parbox[m][\topheight][b]{274pt}{{\centering {\small \seriesinfo}\par\medskip {\large \fellpattern{a} \titleinfo{} \fellpattern{c}}\par\rule[.35em]{274pt}{1pt}\par}\vfill\noindent\llap{\makebox[32pt][l]{\chapnumfont \arabic{chapter}}}{\chaptitlefont\enquote*{##1}}\par\vspace{22pt}}\par}
\renewcommand*{\afterchaptertitle}{\vspace{0pt plus 9pt minus 3pt}}
\renewcommand*{\chapnamefont}{}
\renewcommand*{\chapnumfont}{\LARGE}
\renewcommand*{\chaptitlefont}{\LARGE\itshape}
}

\setlength{\prechapterprecisshift}{0pt}
\newlength{\postchapterprecisshift}
\setlength{\postchapterprecisshift}{22pt plus 7pt minus 4pt}
\renewcommand{\prechapterprecis}{\vspace*{\prechapterprecisshift}\hfill\begin{minipage}[t]{\textwidth}\precisfont}
\renewcommand{\postchapterprecis}{\end{minipage}\vspace*{\postchapterprecisshift}\noindent{}}
\renewcommand*{\precisfont}{\small\raggedleft}

\copypagestyle{chapter}{plain}
\makeevenhead{chapter}{}{\scriptsize\copyrightinfo}{}
\makeoddhead{chapter}{}{\scriptsize\copyrightinfo}{}

%%  Head styles:  %%

\renewcommand{\thesection}{\arabic{section}}
\newcommand{\secheadfmt}[1]{\noindent\hfill\parbox[t]{\textwidth}{\centering#1}\hfill}
\sethangfrom{\noindent #1}
\makeheadstyles{classical}{
\nobookblankpage
\renewcommand*{\beforebookskip}{\begin{titlingpage*}\parindent0pt\centering\begin{minipage}[m][96pt][c]{\textwidth}\vfill\vfill}
\renewcommand*{\afterbookskip}{\vfill\end{minipage}\end{titlingpage*}}
\renewcommand{\printbookname}{}
\renewcommand{\booknamenum}{}
\renewcommand{\printbooknum}{}
\renewcommand{\booktitlefont}{\centering\Huge}
\nopartblankpage
\renewcommand*{\beforepartskip}{\begin{titlingpage*}\parindent0pt\centering\begin{minipage}[m][96pt][c]{\textwidth}\vfill\vfill}
\renewcommand*{\afterpartskip}{\vfill\end{minipage}\end{titlingpage*}}
\renewcommand{\printpartname}{}
\renewcommand{\partnamenum}{}
\renewcommand{\printpartnum}{{\partnumfont ·\enspace\thepart\enspace ·}}
\renewcommand{\partnumfont}{\centering\Large\bfseries}
\renewcommand{\parttitlefont}{\centering\LARGE\itshape}
\chapterstyle{IMextra}
\setbeforesecskip{-22pt plus 4pt minus 7pt}
\setaftersecskip{22pt plus 7pt minus 4pt}
\setsechook{\setsecnumformat{{\normalfont\upshape\bfseries\thesection}\par}}
\setsecheadstyle{\normalfont\itshape\secheadfmt}
}

%%  Contents formatting:  %%

\setpnumwidth{32pt}
\setrmarg{32pt}
\renewcommand{\aftertoctitle}{\thispagestyle{empty}}
\setlength{\cftbeforepartskip}{17pt}
\setlength{\cftpartnumwidth}{0pt}
\renewcommand{\cftpartfont}{\Large\bfseries}
\renewcommand{\partnumberline}[1]{}
\renewcommand{\cftpartdotsep}{\cftnodots}
\renewcommand*{\cftpartformatpnum}[1]{\hfill}
\setlength{\cftbeforechapterskip}{6pt}
\setlength{\cftchapterindent}{0pt}
\setlength{\cftchapternumwidth}{40pt}
\renewcommand{\cftchapterfont}{\large}
\renewcommand{\cftchapteraftersnum}{.}
\renewcommand{\cftchapterdotsep}{1.9292}
\renewcommand{\cftchapterleader}{\hspace{2.57227pt}\cftdotfill{\cftchapterdotsep}}
\renewcommand{\cftchapterpagefont}{\itshape}
\setcounter{tocdepth}{0}

%%  Footnote formatting:  %%

\footmarkstyle{#1.\hfill}
\setlength{\footmarkwidth}{1.7em}
\setlength{\footmarksep}{-1.7em}
\setlength{\footparindent}{1.7em}
\setlength{\footnotesep}{\onelineskip}
\setfootins{28pt plus 17pt minus 12pt}{22pt}
\feetbelowfloat
\renewcommand{\@makefntext}[1]{\makefootmark #1}
\renewcommand{\foottextfont}{\scriptsize}

%%  Lettrines:  %%

\RequirePackage{lettrine}
\setcounter{DefaultLines}{2}
\setlength{\DefaultFindent}{1pt}
\setlength{\DefaultNindent}{3pt}
\LettrineRealHeighttrue
\renewcommand*{\DefaultLoversize}{.25}
\renewcommand*{\DefaultLhang}{.6}
\renewcommand{\LettrineFontHook}{\initials}

%%  Breaks:  %%

\setlength{\pfbreakskip}{45pt}
\renewcommand*{\pfbreakdisplay}{\bigskip·\quad ·\quad ·\quad ·\quad ·\bigskip}

%%  The title:  %%
\renewcommand{\maketitle}{\pagestyle{empty}\clearpage\null\vfill\parindent=0pt\large\parbox[m][\topheight][t]{\textwidth}{\centering\LARGE\begin{vplace}[2]{\large \seriesinfo}\par\bigskip{\Huge \fellpattern{a} \titleinfo{} \fellpattern{c}}\end{vplace}\rule[.35em]{\textwidth}{1pt}}\par\vspace{0pt plus 7pt minus 3.5pt}\descriptioninfo{}

\clearpage\null\cleartorecto\begin{center}
\parindent0pt

\fbox{\parbox[c][384.5pt][t]{263pt}{
\centering

\rule[.35em]{192pt}{1pt}

\vspace{5pt}

{\HUGE \MakeUppercase{\titleinfo}}

\rule[.35em]{192pt}{1pt}

\vspace{20.75pt}

\textsc{\large being a story of}

\vspace{10.2pt}

{\LARGE\itshape \seriesinfo}

\vspace{14.5pt}

\textsc{\Large as recorded by}

\vspace{8.75pt}

{\huge \authorinfo}

\vfill

{\huge\fellpattern{FQOH}}

\vfill

{\Large \fellflower{K} \publisherinfo{} \fellflower{J}}

}}

\end{center}

\clearpage\null}

%%  The copyright:  %%

\newcommand{\makecopyright}{\vfill

\parindent0pt
\tiny

\detailsinfo

\bigskip

\copyrightinfo

\medskip

This draft compiled \today{} at \printtime.

\editioninfo{} Edition, \draftinfo{}.

\bigskip

Book design by the KIBI Gô.

\medskip

This work is formatted via \XeLaTeX{}.
Body text has been set in 17pt Charis SIL, a font specially designed to make long texts easier to read.
More information about this font and its design can be found on its website, \url{https://software.sil.org/charis/}.

\medskip

Text ornaments and drop caps have been set in the Fell Types, digitally reproduced by Igino Marini. \url{https://iginomarini.com/}.

\bigskip

\vfill}

%%  Option handling:  %%

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{memoir}}

\ProcessOptions\relax

%%  Defaults:  %%

\RequirePackage{fmtcount}
\setsecnumdepth{chapter}
\pagenumbering{arabic}
\openany
\pagestyle{simple}
\headstyles{classical}
\chapterstyle{verbose7c}
\newcommand{\atendtext}{\centering\par\vfill\pagebreak[1]\null\vfill\parbox[b]{\textwidth}{\tiny \detailsinfo\nolinebreak\qquad \copyrightinfo Text design by the KIBI Gô. This work was formatted via \XeLaTeX{}, and this draft was compiled \today{} at \printtime{}.\nolinebreak\qquad Body text has been set in 17pt Charis SIL, a font specially designed to make long texts easier to read. More information about this font and its design can be found on its website, \url{https://software.sil.com/charis/}.\nolinebreak\qquad Text ornaments and drop caps have been set in the Fell Types, digitally reproduced by Igino Marini. \url{https://iginomarini.com/}.\nolinebreak\qquad This has been the \ordinalstring{chapter} chapter of \seriesinfo{} – \titleinfo{}. Thank you for reading.\lastlinerulefill}}
\tolerance=9999

%%  Matter handling:  %%

\newcounter{lastfmpage}
\renewcommand{\frontmatter}{
    \cleardoublepage
    \openright
    \pagenumbering{roman}
    \pagestyle{simple}
    \chapterstyle{IMextra}
    \makeevenhead{chapter}{}{}{}
    \makeoddhead{chapter}{}{}{}
    \renewcommand{\atendtext}{}
}
\renewcommand{\mainmatter}{
    \cleardoublepage
    \setcounter{lastfmpage}{\value{page}}
    \pagenumbering{arabic}
    \openany
    \pagestyle{simple}
    \setcounter{chapter}{0}
    \chapterstyle{7c}
    \makeevenhead{chapter}{}{}{}
    \makeoddhead{chapter}{}{}{}
}
\renewcommand{\backmatter}{
    \cleardoublepage
    \pagenumbering{roman}
    \setcounter{page}{\value{lastfmpage}}
    \openright
    \addtocontents{toc}{\vspace{12pt}}
    \chapterstyle{IMextra}
    \makeevenhead{chapter}{}{}{}
    \makeoddhead{chapter}{}{}{}
}