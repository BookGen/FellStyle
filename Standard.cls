% This style requires Junicode and the IM Fell Types.

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{Standard}

%%  Class loading and defaults:  %%

\LoadClass[a5paper, 12pt, openany, twoside, extrafontsizes]{memoir}

\RequireXeTeX

%%  Initial packages:  %%

\RequirePackage[usenames,dvipsnames,svgnames,table]{xcolor}
\RequirePackage{calc, metalogo, amsmath, graphicx}

%%  Font and language setup:  %%

\RequirePackage{fontspec, polyglossia}
\defaultfontfeatures{Mapping={tex-text}}
\setmainlanguage[variant=uk,ordinalmonthday=false]{english}
\setmainfont{Junicode}[UprightFeatures={StylisticSet={18}, Numbers={OldStyle}},ItalicFeatures={StylisticSet={18}, Numbers={OldStyle}},BoldFeatures={StylisticSet={18}, Numbers={OldStyle}}]
\newfontfamily{\vanillafont}{Junicode}
\newfontfamily{\IMlargefont}{IM FELL DW Pica PRO}
\newfontfamily{\IMLargefont}{IM FELL English PRO}
\newfontfamily{\IMLARGEfont}{IM FELL Great Primer PRO}
\newfontfamily{\IMhugefont}{IM FELL Double Pica PRO}
\newfontfamily{\IMHUGEfont}{IM FELL French Canon PRO}
\newfontface{\bigmin}{Junicode}[StylisticSet={6}]
\newfontface{\insular}{Junicode}[StylisticSet={2},Ligatures={NoCommon}]
\newfontface{\IMLARGEswshfont}{IM FELL Great Primer PRO Italic}[Style={Swash}]
\newfontface{\initials}{IM FELL THREE LINE PICA PRO}
\newfontface{\IMFlowerfontA}{IM FELL FLOWERS 1}
\newfontface{\IMFlowerfontB}{IM FELL FLOWERS 2}
\newcommand{\IMlarge}{\IMlargefont\large}
\newcommand{\IMLarge}{\IMLargefont\Large}
\newcommand{\IMLARGE}{\IMLARGEfont\LARGE}
\newcommand{\IMLARGEswash}{\IMLARGEswshfont\LARGE}
\newcommand{\IMhuge}{\IMhugefont\huge}
\newcommand{\IMHuge}{\IMhugefont\Huge}
\newcommand{\IMHUGE}{\IMHUGEfont\HUGE}
\newcommand{\smallbig}{\small\bigmin}
\newcommand{\scriptbig}{\scriptsize\bigmin}
\newcommand{\tinybig}{\tiny\bigmin}
\newcommand{\textvanilla}[1]{{\vanillafont #1}}
\newcommand{\fellpattern}[1]{\raisebox{.35em}{\IMFlowerfontA #1}}
\newcommand{\fellflower}[1]{{\IMFlowerfontB #1}}
\newcommand{\subs}[1]{\raisebox{-.35ex}{\scriptbig #1}}
\newcommand{\supers}[1]{\raisebox{.7ex}{\scriptbig #1}}

\RequirePackage{newunicodechar}
\newunicodechar{ʼ}{’}

%%  Page geometry:  %%

\settypeblocksize{432.5pt}{311pt}{*}  %  This height gives 30 lines per page, which is doable. (I actually prefer 28, but this is untenable with a 6:9 page without enormous margins.)
\setlrmargins{54pt}{*}{*}  %  This gives us at least .75in on the edge, always.
\setulmargins{60pt}{*}{*}  %  This creates a top:bottom ratio of almost exactly 4:7, which looks very nice
\setheadfoot{\baselineskip}{24pt}
\setheaderspaces{*}{12pt}{*}
% \setstocksize{11in}{8.5in}  %  This sets the page up on letter stock
% \setpagecc{\paperheight}{\paperwidth}{*}  %  This centers the page on the stock
\checkandfixthelayout[nearest]
\newlength{\topheight}
\setlength{\topheight}{121.5pt}  %  This is the amount of top padding needed to make the resultant text box square.
\newlength{\smallheight}
\newlength{\smallwidth}
\setlength{\smallheight}{387.5pt}  %  This height creates a faux-centered (actually about a quarter-inch closer to the top) small page.
\setlength{\smallwidth}{274pt}  %  This mimics the 1/sqrt(2) ratio of the page

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
\setfootins{20pt plus 12pt minus 8pt}{16pt}
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
\renewcommand{\printchaptertitle}[1]{\centering\parbox[m][\topheight][t]{\smallwidth}{\centering\begin{vplace}[2]\chaptitlefont ##1\end{vplace}}\par}
\renewcommand*{\afterchaptertitle}{\vspace{0pt plus 6pt minus 2pt}}
\renewcommand*{\chapnamefont}{}
\renewcommand*{\chapnumfont}{}
\renewcommand*{\chaptitlefont}{\IMLARGE}
}
\makechapterstyle{7c}{
\renewcommand*{\chapterheadstart}{}
\renewcommand*{\printchaptername}{}
\renewcommand*{\chapternamenum}{}
\renewcommand*{\printchapternum}{}
\renewcommand*{\afterchapternum}{}
\renewcommand*{\printchapternonum}{}
\renewcommand{\printchaptertitle}[1]{\centering\parbox[m][\topheight][b]{\smallwidth}{\noindent\llap{\makebox[32pt][l]{\chapnumfont \arabic{chapter}}}{\chaptitlefont\enquote*{##1}}\par\vspace{16pt}}\par}  %  The box size of the chapter number was chosen to align the left edge with the left edge of the typeblock. Note 30pt is roughly the maximum the width of 3 \IMLARGE numerals (numeral size varies)---thus, there is 2pt padding for a large 3-digit number.
\renewcommand*{\afterchaptertitle}{\vspace{0pt plus 6pt minus 2pt}}
\renewcommand*{\chapnamefont}{}
\renewcommand*{\chapnumfont}{\IMLARGE}
\renewcommand*{\chaptitlefont}{\IMLARGEswash}
}
\makechapterstyle{verbose7c}{
\renewcommand*{\chapterheadstart}{}
\renewcommand*{\printchaptername}{}
\renewcommand*{\chapternamenum}{}
\renewcommand*{\printchapternum}{}
\renewcommand*{\afterchapternum}{}
\renewcommand*{\printchapternonum}{}
\renewcommand{\printchaptertitle}[1]{\centering\parbox[m][\topheight][b]{\smallwidth}{{\centering {\IMlarge \seriesinfo}\par\medskip {\IMLARGE \fellpattern{a} \titleinfo{} \fellpattern{c}}\par\rule[.35em]{\smallwidth}{1pt}\par}\vfill\noindent\llap{\makebox[32pt][l]{\chapnumfont \arabic{chapter}}}{\chaptitlefont\enquote*{##1}}\par\vspace{16pt}}\par}  %  The box size of the chapter number was chosen to align the left edge with the left edge of the typeblock. Note 30pt is roughly the maximum the width of 3 \IMLARGE numerals (numeral size varies)---thus, there is 2pt padding for a large 3-digit number.
\renewcommand*{\afterchaptertitle}{\vspace{0pt plus 6pt minus 2pt}}
\renewcommand*{\chapnamefont}{}
\renewcommand*{\chapnumfont}{\IMLARGE}
\renewcommand*{\chaptitlefont}{\IMLARGEswash}
}

\setlength{\prechapterprecisshift}{0pt}
\newlength{\postchapterprecisshift}
\setlength{\postchapterprecisshift}{16pt plus 5pt minus 3pt}
\renewcommand{\prechapterprecis}{\vspace*{\prechapterprecisshift}\hfill\begin{minipage}[t]{\smallwidth}\precisfont}
\renewcommand{\postchapterprecis}{\end{minipage}\vspace*{\postchapterprecisshift}\noindent{}}
\renewcommand*{\precisfont}{\smallbig\raggedleft}

\copypagestyle{chapter}{plain}
\makeevenhead{chapter}{}{\copyrightinfo}{}
\makeoddhead{chapter}{}{\copyrightinfo}{}

%%  Head styles:  %%

\renewcommand{\thesection}{\arabic{section}}
\newcommand{\secheadfmt}[1]{\noindent\hfill\parbox[t]{\smallwidth}{\centering#1}\hfill}
\sethangfrom{\noindent #1}
\makeheadstyles{classical}{
\nobookblankpage
\renewcommand*{\beforebookskip}{\begin{titlingpage*}\parindent0pt\centering\begin{minipage}[m][96pt][c]{\smallwidth}\vfill\vfill}
\renewcommand*{\afterbookskip}{\vfill\end{minipage}\end{titlingpage*}}
\renewcommand{\printbookname}{}
\renewcommand{\booknamenum}{}
\renewcommand{\printbooknum}{}
\renewcommand{\booktitlefont}{\centering\IMHuge}
\nopartblankpage
\renewcommand*{\beforepartskip}{\begin{titlingpage*}\parindent0pt\centering\begin{minipage}[m][96pt][c]{\smallwidth}\vfill\vfill}
\renewcommand*{\afterpartskip}{\vfill\end{minipage}\end{titlingpage*}}
\renewcommand{\printpartname}{}
\renewcommand{\partnamenum}{}
\renewcommand{\printpartnum}{{\partnumfont ·\enspace\thepart\enspace ·}}
\renewcommand{\partnumfont}{\centering\IMLarge}
\renewcommand{\parttitlefont}{\centering\IMLARGEswash}
\chapterstyle{IMextra}
\setbeforesecskip{-16pt plus 3pt minus 5pt}
\setaftersecskip{16pt plus 5pt minus 3pt}
\setsechook{\setsecnumformat{{\normalfont\upshape\bfseries\thesection}\par}}
\setsecheadstyle{\normalfont\itshape\secheadfmt}
}

%%  Small pages:  %%

\newenvironment{smallpage}[1]{\clearpage\null\vfill\begin{center}\begin{minipage}[t][\smallheight][t]{\smallwidth}\parindent=0pt\thispagestyle{empty}\IMlarge\parbox[m][\topheight][t]{\smallwidth}{\centering\IMLARGE\begin{vplace}[2]#1\end{vplace}\rule[.35em]{\smallwidth}{1pt}}\par\vspace{0pt plus 5pt minus 2.5pt}}{\end{minipage}\end{center}}

%%  Contents formatting:  %%

\setpnumwidth{23pt}  %  Max width of 4-digit italic number
\setrmarg{23pt}
\renewcommand{\aftertoctitle}{\thispagestyle{empty}}
\setlength{\cftbeforepartskip}{12pt}
\setlength{\cftpartnumwidth}{0pt}
\renewcommand{\cftpartfont}{\IMLarge}
\renewcommand{\partnumberline}[1]{}
\renewcommand{\cftpartdotsep}{\cftnodots}
\renewcommand*{\cftpartformatpnum}[1]{\hfill}
\setlength{\cftbeforechapterskip}{4pt}
\setlength{\cftchapterindent}{0pt}
\setlength{\cftchapternumwidth}{24.75pt}  %  Width of "000. "
\renewcommand{\cftchapterfont}{\IMlarge}
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
\setfootins{20pt plus 12pt minus 8pt}{16pt}
\feetbelowfloat
\renewcommand{\@makefntext}[1]{\makefootmark #1}
\renewcommand{\foottextfont}{\scriptsize}

%%  Lettrines:  %%

\RequirePackage{lettrine}
\setcounter{DefaultLines}{2}
\setlength{\DefaultFindent}{0pt}
\setlength{\DefaultNindent}{2pt}
\LettrineRealHeighttrue
\renewcommand*{\DefaultLoversize}{.25}
\renewcommand*{\DefaultLhang}{.6}
\renewcommand{\LettrineFontHook}{\initials}

%%  Breaks:  %%

\setlength{\pfbreakskip}{32pt}
\renewcommand*{\pfbreakdisplay}{\bigskip·\quad ·\quad ·\quad ·\quad ·\bigskip}

%%  The title:  %%
\renewcommand{\maketitle}{\pagestyle{empty}\begin{smallpage}{{\IMlarge \seriesinfo}\par\bigskip{\IMHuge \fellpattern{a} \titleinfo{} \fellpattern{c}}}

\descriptioninfo

\end{smallpage}
\clearpage\null\cleartorecto\centering
\parindent0pt

%  Note the following Junicode font metrics:
%
%  Cap height: .7em
%  Ascent: .8em
%  Descent: .2em
%
%  Consequently, adjustments need to be made in order to give letters the appearance of centering.
%
%  The above *have not* been recalculated for the various IM FELL fonts but are fairly standard and should also apply.

\fbox{\parbox[c][384.5pt][t]{263pt}{
\centering

\rule[.35em]{192pt}{1pt}

\vspace{3.6pt}  %  Compensates for descent being larger than ascent

{\IMHUGE \MakeUppercase{\titleinfo}}

\rule[.35em]{192pt}{1pt}

\vspace{14.6pt}  %  16pt - 1.4pt

\textsc{\IMlarge being a story of}

\vspace{7.2pt}  %  12pt - 2.8pt - 2pt

{\IMLARGEswash \seriesinfo}

\vspace{10.3pt}  %  16pt - 4pt - 1.7pt

\textsc{\IMLarge as recorded by}

\vspace{6.1pt}  %  12pt - 3.4pt - 2.5pt

{\IMhuge \authorinfo}

\vspace{11pt}  %  16pt - 5pt

\vspace{.45em}  %  Matches the spacing at the top of a \rule

{\huge\fellpattern{FQOH}}

\vfill

{\IMLarge \fellflower{K} \publisherinfo{} \fellflower{J}}

}}

\clearpage\null}

%%  The copyright:  %%

\newcommand{\makecopyright}{\vfill

\begin{minipage}[t][\smallheight][t]{\smallwidth}
\parindent0pt
\tinybig

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
Body text is set in 12pt Junicode, a font inspired by the early eighteenth-century Oxford University Press.
More information about this font and its origins can be found on its website, \url{https://junicode.sourceforge.net/}.

\medskip

Headings are set in the closely-related Fell Types in various cuts and sizes—as are certain spans of text, for effect.
The Fell Types are digitally reproduced by Igino Marini. \url{https://iginomarini.com/}.

\bigskip

\vfill

\end{minipage}}

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
\newcommand{\atendtext}{\centering\par\vfill\pagebreak[1]\null\vfill\parbox[b]{\smallwidth}{\tinybig \detailsinfo\nolinebreak\qquad \copyrightinfo Text design by the KIBI Gô. This work was formatted via \XeLaTeX{}, and this draft was compiled \today{} at \printtime{}.\nolinebreak\qquad Body text has been set in 12pt Junicode, a font inspired by the early eighteenth­‑century Oxford University Press. More information about this font and its origins can be found on its website, \url{https://junicode.sourceforge.net/}.\nolinebreak\qquad Headings have been set in the closely­‑related Fell Types in various cuts and sizes—as are certain spans of text, for effect. The Fell Types are digitally reproduced by Igino Marini. \url{https://iginomarini.com/}.\nolinebreak\qquad This has been the \ordinalstring{chapter} chapter of \seriesinfo{} – \titleinfo{}. Thank you for reading.\lastlinerulefill}}
\tolerance=5000

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