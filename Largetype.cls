% This style requires Charis SIL and the IM Fell Types.

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{style}

%%  Class loading and defaults:  %%

\LoadClass[a4paper, 17pt, openany, twoside, extrafontsizes, showtrims]{memoir}

\RequireXeTeX

%%  Custom metadata:  %%

\newcommand{\draftinfo}{} % Default to empty
\newcommand{\detailsinfo}{}

%%  Initial packages:  %%

\RequirePackage[usenames,dvipsnames,svgnames,table]{xcolor}

%%  Checking if empty:  %%
\RequirePackage{ifmtarg}
\newcommand{\ifexpandsnotmt}[2]{\expandafter\@ifnotmtarg\expandafter{#1}{#2}}

%%  Font and language setup:  %%

\RequirePackage{fontspec, polyglossia}
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

\RequirePackage{metalogo}

\RequirePackage{soul} % Used in title

%%  Page geometry:  %%

\settypeblocksize{608.4pt}{370.25pt}{*} % This gives 28 lines per page, which is my preferred text height; the page width is set to match \smallwidth (see below) for shorter, more readable line widths
\setlrmargins{*}{*}{1} % Equal horizontal margins
\setulmargins{85pt}{*}{*} % This creates a top:bottom ratio of almost exactly 4:7, which looks very nice
\setheadfoot{\baselineskip}{34pt}
\setheaderspaces{*}{17pt}{*}
% \setstocksize{11in}{8.5in} % This sets the page up on letter stock
% \settrimmedsize{11in}{*}{0.7} % A4 paper is taller than letter, so we need to scale it down
% \setpagecc{\paperheight}{\paperwidth}{*}  %  This centres the page on the stock
% \trimFrame
\showtrimsoff
\checkandfixthelayout[nearest]
\newlength{\topheight}
\setlength{\topheight}{118.4pt} % This is the amount of top padding needed to make the resultant text box square
\newlength{\smallheight}
\newlength{\smallwidth}
\setlength{\smallheight}{523.75pt} % This height creates a faux-centered (actually about a quarter-inch closer to the top) small page
\setlength{\smallwidth}{370.25pt} % This mimics the 1/sqrt(2) ratio of the page

%%  Empty last page:  %%

\AtEndDocument{\atendtext\cleartoevenpage[\null\thispagestyle{cleared}]\null\pagestyle{cleared}}

%%  Frame formatting:  %%

\setlength{\fboxrule}{1pt}
\setlength{\fboxsep}{33pt}

%%  List formatting:  %%

\RequirePackage[inline]{enumitem}

%%  Date/time setup:  %%

\RequirePackage[english, cleanlook]{isodate}

%%  Quotation setup:  %%

\RequirePackage[style=french,french=guillemets]{csquotes}
\DeclareQuoteStyle[guillemets]{french}{« }[» ]{ »}{« }[» ]{ »}

%%  Verse formatting:  %%

\setlength{\vleftmargin}{0.5\vgap}

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
	\renewcommand{\printchaptertitle}[1]{
		\begin{center}
			\parbox[m][\topheight][t]{\smallwidth}{
				\centering\begin{vplace}[2]\chaptitlefont ##1\end{vplace}
			}
		\end{center}
	}
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
	\renewcommand{\printchaptertitle}[1]{
		\begin{center}
			\parbox[m][\topheight][b]{\smallwidth}{
				\noindent\llap{\makebox[45pt][l]{\chapnumfont \thechapter}}{
					\chaptitlefont\enquote*{##1}
				}\par\vspace{22pt}
			}
		\end{center}
	}
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
	\renewcommand{\printchaptertitle}[1]{
		\begin{center}
			\parbox[m][\topheight][b]{\smallwidth}{
				\begin{center}
					{\large \seriesinfo}
					\par\medskip
					\par{\LARGE \fellpattern{a} \caps{\MakeUppercase{\titleinfo}} \fellpattern{c}}
					\par\rule[.35em]{\smallwidth}{1pt}
				\end{center}
				\vfill\noindent\llap{\makebox[45pt][l]{\chapnumfont \thechapter}}{
					\chaptitlefont\enquote*{##1}
				}\par\vspace{22pt}
			}
		\end{center}
	}
	\renewcommand*{\afterchaptertitle}{\vspace{0pt plus 9pt minus 3pt}}
	\renewcommand*{\chapnamefont}{}
	\renewcommand*{\chapnumfont}{\LARGE}
	\renewcommand*{\chaptitlefont}{\LARGE\itshape}
}

\setlength{\prechapterprecisshift}{0pt}
\newlength{\postchapterprecisshift}
\setlength{\postchapterprecisshift}{22pt plus 7pt minus 4pt}
\renewcommand{\prechapterprecis}{\vspace*{\prechapterprecisshift}\hfill\begin{minipage}[t]{\smallwidth}\precisfont}
\renewcommand{\postchapterprecis}{\end{minipage}\vspace*{\postchapterprecisshift}\noindent{}}
\renewcommand*{\precisfont}{\small\raggedleft}

\copypagestyle{chapter}{plain}
\makeevenhead{chapter}{}{\scriptsize\thecopyright}{}
\makeoddhead{chapter}{}{\scriptsize\thecopyright}{}

%%  Head styles:  %%

\renewcommand{\thesection}{\arabic{section}}
\newcommand{\secheadfmt}[1]{\noindent\hfill\parbox[t]{\smallwidth}{\centering#1}\hfill}
\sethangfrom{\noindent #1}
\makeheadstyles{classical}{
	\nobookblankpage
	\renewcommand*{\beforebookskip}{\begin{titlingpage*}\parindent0pt\centering\begin{minipage}[m][\topheight][c]{\smallwidth}\vfill\vfill}
	\renewcommand*{\afterbookskip}{\vfill\end{minipage}\end{titlingpage*}}
	\renewcommand{\printbookname}{}
	\renewcommand{\booknamenum}{}
	\renewcommand{\printbooknum}{}
	\renewcommand{\booktitlefont}{\centering\Huge}
	\nopartblankpage
	\renewcommand*{\beforepartskip}{\begin{titlingpage*}\parindent0pt\centering\begin{minipage}[m][\topheight][c]{\smallwidth}\vfill\vfill}
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

%%  Small pages:  %%

\newenvironment{smallpage}[1]{
	\clearpage\null\vfill
	\begin{center}\begin{minipage}[t][\smallheight][t]{\smallwidth}
		\parindent=0pt\thispagestyle{empty}
		\large\parbox[m][\topheight][t]{\smallwidth}{
			\centering\LARGE\begin{vplace}[2]#1\end{vplace}\rule[.35em]{\smallwidth}{1pt}
		}
		\par\vspace{0pt plus 7pt minus 3.5pt}
}{\end{minipage}\end{center}}

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
\setlength{\cftchapternumwidth}{35pt}
\renewcommand{\cftchapterfont}{\large}
\renewcommand{\cftchapteraftersnum}{.}
\renewcommand{\cftchapterdotsep}{2.75}
\renewcommand{\cftchapterleader}{\hspace{3.64286pt}\cftdotfill{\cftchapterdotsep}}
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
\renewcommand{\maketitle}{
	\pagestyle{empty}
	\begin{smallpage}
		{ % Throws an error if this isnʼt wrapped—for some reason
			\ifexpandsnotmt{\seriesinfo}{{\large \seriesinfo}\par}
			\null\bigskip\par
			{\Huge \fellpattern{a} \titleinfo{} \fellpattern{c}}\par
			\ifexpandsnotmt{\descriptioninfo}{\descriptioninfo}
		}
	\end{smallpage}
	\clearpage\null\cleartorecto
	\begin{center}
		\parindent0pt
		\fbox{\parbox[c][\dimexpr \smallheight-\fboxrule-\fboxrule-\fboxsep-\fboxsep][t]{\dimexpr \smallwidth-\fboxrule-\fboxrule-\fboxsep-\fboxsep}{
			\centering
			\rule[.35em]{\dimexpr (\smallwidth * 3) / 5}{1pt}
			\par\vspace{5pt}
			\par{\HUGE \caps{\MakeUppercase{\titleinfo}}}
			\rule[.35em]{\dimexpr (\smallwidth * 3) / 5}{1pt}
			\par\vspace{20.75pt}
			\ifexpandsnotmt{\seriesinfo}{\par\textsc{\large being a story of}
			\par\vspace{10.2pt}
			\par{\LARGE\itshape \seriesinfo}
			\par\vspace{14.5pt}}
			\par\textsc{\Large as recorded by}
			\par\vspace{8.75pt}
			\par{\huge \authorinfo}
			\par\vspace{.45em}  %  Matches the spacing at the top of a \rule
			\par{\huge\fellpattern{FQOH}}
			\par\vfill
			\ifexpandsnotmt{\publisherinfo}{\par{\Large \fellflower{K} \publisherinfo{} \fellflower{J}}}
		}}
	\end{center}
	\clearpage\null
}

%%  The copyright:  %%

\newcommand{\makecopyright}{
	\vfill
	\begin{center}
		\begin{minipage}[t][\smallheight][t]{\smallwidth}
			\parindent0pt\tiny
			\ifexpandsnotmt{\detailsinfo}{\detailsinfo
			\par\bigskip
			\par}\thecopyright
			\par\medskip
			\par This draft compiled \today{} at \printtime.
			\par\styleinfo{} Edition\ifexpandsnotmt{\draftinfo}{, draft \draftinfo{}}.
			\par\bigskip
			\par Book design by the KIBI Gô.
			\par\medskip
			\par This work is formatted via \XeLaTeX{}.
			Body text has been set in 17pt Charis SIL, a font specially designed to make long texts easier to read.
			More information about this font and its design can be found on its website, \url{https://software.sil.org/charis/}.
			\par\medskip
			\par Text ornaments and drop caps have been set in the Fell Types, digitally reproduced by Igino Marini. \url{https://iginomarini.com/}.
			\par\bigskip
			\par\vfill
		\end{minipage}
	\end{center}
}

%%  Option handling:  %%

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{memoir}}

\ProcessOptions\relax

%%  Defaults:  %%

\setsecnumdepth{chapter}
\pagenumbering{arabic}
\openany
\pagestyle{simple}
\headstyles{classical}
\chapterstyle{verbose7c}
\newcommand{\mainchapterstyle}{verbose7c}
\newcommand{\atendtext}{\par\vfill\centering\pagebreak[1]\null\vfill\parbox[b]{\smallwidth}{\tiny\ifexpandsnotmt{\detailsinfo}{\leavevmode\detailsinfo\nolinebreak\qquad}\thecopyright{} Text design by the KIBI Gô. This work was formatted via \XeLaTeX{}, and this draft was compiled \today{} at \printtime{}.\nolinebreak\qquad Body text has been set in 17pt Charis SIL, a font specially designed to make long texts easier to read. More information about this font and its design can be found on its website, \url{https://software.sil.com/charis/}.\nolinebreak\qquad Text ornaments and drop caps have been set in the Fell Types, digitally reproduced by Igino Marini. \url{https://iginomarini.com/}.\nolinebreak\qquad This has been the \ordinaltoname{\value{chapter}} chapter of \ifexpandsnotmt{\seriesinfo}{\seriesinfo{} – }\titleinfo{}. Thank you for reading.\lastlinerulefill}}
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
    \renewcommand{\mainchapterstyle}{7c}
}
\renewcommand{\mainmatter}{
    \cleardoublepage
    \setcounter{lastfmpage}{\value{page}}
    \pagenumbering{arabic}
    \openany
    \pagestyle{simple}
    \setcounter{chapter}{0}
    \chapterstyle{\mainchapterstyle}
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