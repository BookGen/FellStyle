\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{Largetype}

%%  Class loading and defaults:  %%

\LoadClass[ebook, 14pt, openany, twoside, extrafontsizes]{memoir}

\RequireXeTeX

%%  Initial packages:  %%

\RequirePackage[usenames,dvipsnames,svgnames,table]{xcolor}

%%  Font and language setup:  %%

\RequirePackage{fontspec, polyglossia}
\setmainlanguage[variant=uk,ordinalmonthday=false]{english}
\setmainfont{Palatino}
\newfontfamily{\vanillafont}{Palatino}
\newcommand{\textvanilla}[1]{{\vanillafont #1}}
\newcommand{\subs}[1]{\raisebox{-.35ex}{\scriptsize #1}}
\newcommand{\supers}[1]{\raisebox{.7ex}{\scriptsize #1}}

\RequirePackage{metalogo}

\RequirePackage{soul} % Used in title

\RequirePackage{newunicodechar}
\newunicodechar{ʼ}{’} % Not in Palatino
\newunicodechar{⸺}{\textemdash\textemdash} % This is a safe substitution in Palatino
\newunicodechar{⁓}{\scalebox{1.7}[1.35]{\textasciitilde}} % Not in Palatino

%%  Page geometry:  %%

\settypeblocksize{486.9pt}{295pt}{*} % This gives 28 lines per page which is my preferred text height
\setlrmargins{*}{*}{1} % Equal horizontal margins
\setulmargins{*}{*}{1} % Equal vertical margins
\setheadfoot{\baselineskip}{28pt}
\setheaderspaces{*}{14pt}{*}
% \setstocksize{11in}{8.5in} % This sets the page up on letter stock
% \setpagecc{\paperheight}{\paperwidth}{*} % This centres the page on the stock
\checkandfixthelayout[nearest]
\newlength{\topheight}
\setlength{\topheight}{93.5pt} % This is the amount of top padding needed to make the resultant text box 4:3

%%  Empty last page:  %%

\AtEndDocument{\atendtext\cleartoevenpage[\null\thispagestyle{cleared}]\null\pagestyle{cleared}}

%%  Frame formatting:  %%

\setlength{\fboxrule}{1pt}
\setlength{\fboxsep}{27pt}

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
\setfootins{24pt plus 14pt minus 9pt}{19pt}
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
			\parbox[m][\topheight][t]{\textwidth}{
				\centering\begin{vplace}[2]\chaptitlefont ##1\end{vplace}
			}
		\end{center}
	}
	\renewcommand*{\afterchaptertitle}{\vspace{0pt plus 7pt minus 2.25pt}}
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
		\parbox[m][\topheight][b]{\textwidth}{
			\noindent\makebox[38pt][l]{\chapnumfont \thechapter}
				\chaptitlefont\enquote*{##1}\par\vspace{19pt}
		}
	}
	\renewcommand*{\afterchaptertitle}{\vspace{0pt plus 7pt minus 2.25pt}}
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
		\parbox[m][\topheight][b]{\textwidth}{
			\begin{center}
				{\large \seriesinfo}
				\par\medskip
				\par{\LARGE · \caps{\MakeUppercase{\titleinfo}} ·}
				\par\rule[.35em]{\textwidth}{1pt}
			\end{center}
			\vfill\noindent\makebox[38pt][l]{\chapnumfont \thechapter}
				\chaptitlefont\enquote*{##1}\par\vspace{19pt}
		}
	}
	\renewcommand*{\afterchaptertitle}{\vspace{0pt plus 7pt minus 2.25pt}}
	\renewcommand*{\chapnamefont}{}
	\renewcommand*{\chapnumfont}{\LARGE}
	\renewcommand*{\chaptitlefont}{\LARGE\itshape}
}

\setlength{\prechapterprecisshift}{0pt}
\newlength{\postchapterprecisshift}
\setlength{\postchapterprecisshift}{19pt plus 5.75pt minus 3.5pt}
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
	\renewcommand*{\beforebookskip}{\begin{titlingpage*}\parindent0pt\centering\begin{minipage}[m][\topheight][c]{\textwidth}\vfill\vfill}
	\renewcommand*{\afterbookskip}{\vfill\end{minipage}\end{titlingpage*}}
	\renewcommand{\printbookname}{}
	\renewcommand{\booknamenum}{}
	\renewcommand{\printbooknum}{}
	\renewcommand{\booktitlefont}{\centering\Huge}
	\nopartblankpage
	\renewcommand*{\beforepartskip}{\begin{titlingpage*}\parindent0pt\centering\begin{minipage}[m][\topheight][c]{\textwidth}\vfill\vfill}
	\renewcommand*{\afterpartskip}{\vfill\end{minipage}\end{titlingpage*}}
	\renewcommand{\printpartname}{}
	\renewcommand{\partnamenum}{}
	\renewcommand{\printpartnum}{{\partnumfont ·\enspace\thepart\enspace ·}}
	\renewcommand{\partnumfont}{\centering\Large\bfseries}
	\renewcommand{\parttitlefont}{\centering\LARGE\itshape}
	\chapterstyle{IMextra}
	\setbeforesecskip{-19pt plus 3.5pt minus 5.75pt}
	\setaftersecskip{19pt plus 5.75pt minus 3.5pt}
	\setsechook{\setsecnumformat{{\normalfont\upshape\bfseries\thesection}\par}}
	\setsecheadstyle{\normalfont\itshape\secheadfmt}
}

%%  Small pages:  %%

\newenvironment{smallpage}[1]{
	\clearpage\null\parindent=0pt\thispagestyle{empty}
	\large\parbox[m][\topheight][t]{\textwidth}{
		\centering\LARGE\begin{vplace}[2]#1\end{vplace}\rule[.35em]{\textwidth}{1pt}
	}
	\par\vspace{0pt plus 5.75pt minus 3pt}
}{}

%%  Contents formatting:  %%

\setpnumwidth{27pt}
\setrmarg{27pt}
\renewcommand{\aftertoctitle}{\thispagestyle{empty}}
\setlength{\cftbeforepartskip}{14pt}
\setlength{\cftpartnumwidth}{0pt}
\renewcommand{\cftpartfont}{\Large\bfseries}
\renewcommand{\partnumberline}[1]{}
\renewcommand{\cftpartdotsep}{\cftnodots}
\renewcommand*{\cftpartformatpnum}[1]{\hfill}
\setlength{\cftbeforechapterskip}{7pt}
\setlength{\cftchapterindent}{0pt}
\setlength{\cftchapternumwidth}{29pt}
\renewcommand{\cftchapterfont}{\large}
\renewcommand{\cftchapteraftersnum}{.}
\renewcommand{\cftchapterdotsep}{2.25}
\renewcommand{\cftchapterleader}{\hspace{3pt}\cftdotfill{\cftchapterdotsep}}
\renewcommand{\cftchapterpagefont}{\itshape}
\setcounter{tocdepth}{0}

%%  Footnote formatting:  %%

\footmarkstyle{#1.\hfill}
\setlength{\footmarkwidth}{1.7em}
\setlength{\footmarksep}{-1.7em}
\setlength{\footparindent}{1.7em}
\setlength{\footnotesep}{\onelineskip}
\setfootins{24pt plus 14pt minus 9pt}{19pt}
\feetbelowfloat
\renewcommand{\@makefntext}[1]{\makefootmark #1}
\renewcommand{\foottextfont}{\scriptsize}

%%  Lettrines:  %%

\RequirePackage{lettrine}
\setcounter{DefaultLines}{2}
\setlength{\DefaultFindent}{0pt}
\setlength{\DefaultNindent}{2.25pt}
\LettrineRealHeighttrue
\renewcommand*{\DefaultLoversize}{.25}

%%  Breaks:  %%

\setlength{\pfbreakskip}{37pt}
\renewcommand*{\pfbreakdisplay}{\bigskip·\quad ·\quad ·\quad ·\quad ·\bigskip}

%%  The title:  %%
\renewcommand{\maketitle}{
	\pagestyle{empty}
	\begin{smallpage}
		{{\large \seriesinfo}
		\par\bigskip{\Huge \textasciitilde{} \titleinfo{} \textasciitilde}}
		\par\descriptioninfo
	\end{smallpage}
	\clearpage\null\cleartorecto
	\begin{center}
		\parindent0pt
		\fbox{\parbox[c][\dimexpr \textheight-\fboxrule-\fboxrule-\fboxsep-\fboxsep][t]{\dimexpr \textwidth-\fboxrule-\fboxrule-\fboxsep-\fboxsep}{
			\centering
			\rule[.35em]{\dimexpr (\textwidth * 3) / 5}{1pt}
			\par\vspace{4.2pt}
			\par{\HUGE \caps{\MakeUppercase{\titleinfo}}}
			\rule[.35em]{\dimexpr (\textwidth * 3) / 5}{1pt}
			\par\vspace{17pt}
			\par\textsc{\large being a story of}
			\par\vspace{8.4pt}
			\par{\LARGE\itshape \seriesinfo}
			\par\vfill
			\par\textsc{\Large as recorded by}
			\par\vspace{7.1pt}
			\par{\huge \authorinfo}
			\par\vfill
			\par\vfill
			\par\vfill
			\par{\Large – \publisherinfo{} –}
		}}
	\end{center}
	\clearpage\null
}

%%  The copyright:  %%

\newcommand{\makecopyright}{
	\vfill
	{
		\parindent0pt\tiny
		\detailsinfo
		\par\bigskip
		\par\copyrightinfo
		\par\medskip
		\par This draft compiled \today{} at \printtime.
		\par\editioninfo{} Edition, \draftinfo{}.
		\par\bigskip
		\par Book design by the KIBI Gô.
		\par\medskip
		\par This work is formatted via \XeLaTeX{}.
		Body text has been set in 14pt Palatino.
		\par\bigskip
		\par\vfill
	}
}

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
\newcommand{\mainchapterstyle}{verbose7c}
\newcommand{\atendtext}{\par\vfill\centering\pagebreak[1]\null\vfill\parbox[b]{\textwidth}{\tiny \detailsinfo\nolinebreak\qquad \copyrightinfo Text design by the KIBI Gô. This work was formatted via \XeLaTeX{}, and this draft was compiled \today{} at \printtime{}.\nolinebreak\qquad Body text has been set in 14pt Palatino.\nolinebreak\qquad This has been the \ordinalstring{chapter} chapter of \seriesinfo{} – \titleinfo{}. Thank you for reading.\lastlinerulefill}}
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