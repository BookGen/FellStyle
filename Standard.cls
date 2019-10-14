% This style requires Junicode and the IM Fell Types.

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{style}

%%  Class loading and defaults:  %%

\LoadClass[a5paper, 12pt, openany, twoside, extrafontsizes, showtrims]{memoir}

\RequireXeTeX

%%  Custom metadata:  %%

\newcommand{\draftinfo}{} % Default to empty
\newcommand{\publicationdetailsinfo}{}

%%  Initial packages:  %%

\RequirePackage[usenames,dvipsnames,svgnames,table]{xcolor}

%%  Checking if empty:  %%
\RequirePackage{ifmtarg}
\newcommand{\ifexpandsnotmt}[2]{\expandafter\@ifnotmtarg\expandafter{#1}{#2}}

%%  Font and language setup:  %%

\RequirePackage{fontspec, polyglossia}
\setmainlanguage[variant=uk,ordinalmonthday=false]{english}
\setmainfont{Junicode}[UprightFeatures={StylisticSet={10,18}, Numbers={OldStyle}},ItalicFeatures={StylisticSet={10,18}, Numbers={OldStyle}},BoldFeatures={StylisticSet={18}, Numbers={OldStyle}}]
\newfontfamily{\vanillafont}{Junicode}
\newfontfamily{\insularfont}{Junicode}[UprightFeatures={StylisticSet={2,10}, Numbers={OldStyle},Ligatures={NoCommon}},ItalicFeatures={StylisticSet={2,10}, Numbers={OldStyle},Ligatures={NoCommon}}]
\newfontfamily{\IMlargefont}{IM FELL DW Pica PRO}
\newfontfamily{\IMLargefont}{IM FELL English PRO}
\newfontfamily{\IMLARGEfont}{IM FELL Great Primer PRO}
\newfontfamily{\IMhugefont}{IM FELL Double Pica PRO}
\newfontfamily{\IMHUGEfont}{IM FELL French Canon PRO}
\newfontface{\bigmin}{Junicode}[StylisticSet={6,10}]
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
\newcommand{\textinsular}[1]{{\insularfont #1}}
\newcommand{\fellpattern}[1]{\raisebox{.35em}{\IMFlowerfontA #1}}
\newcommand{\fellflower}[1]{{\IMFlowerfontB #1}}
\newcommand{\subs}[1]{\raisebox{-.35ex}{\scriptbig #1}}
\newcommand{\supers}[1]{\raisebox{.7ex}{\scriptbig #1}}

\RequirePackage{metalogo}

\RequirePackage{soul}
\sodef{\emph}{\itshape}{.08em}{.5em plus .15em minus .1em}{.4em plus .3em minus .15em}

\RequirePackage{newunicodechar}
\newunicodechar{ʼ}{’} % Not in IM Fell; identical in Junicode
\newunicodechar{⸺}{\textemdash\textemdash} % This is a safe substitution in Junicode
\newunicodechar{⁓}{\thinspace\scalebox{1.7}[1.35]{\textasciitilde}\thinspace} % Not in Junicode

\RequirePackage[allowbreakbefore]{extdash}
\newunicodechar{—}{\Emdash} % Spaced emdash

%%  Page geometry:  %%

\settypeblocksize{403.5pt}{311pt}{*} % This gives 28 lines per page, which is my preferred text height
\setlrmargins{54pt}{*}{*} % This gives us at least .75in on the spine, always
\setulmargins{70pt}{*}{*}  %  This creates a top:bottom ratio of almost exactly 4:7, which looks very nice
\setheadfoot{\baselineskip}{24pt}
\setheaderspaces{*}{12pt}{*}
% \setstocksize{11in}{8.5in} % This sets the page up on letter stock
% \setpagecc{\paperheight}{\paperwidth}{*}  %  This centres the page on the stock
% \trimFrame
\showtrimsoff
\checkandfixthelayout[nearest]
\newlength{\topheight}
\setlength{\topheight}{92.5pt} % This is the amount of top padding needed to make the resultant text box square
\newlength{\smallheight}
\newlength{\smallwidth}
\setlength{\smallheight}{331.5pt} % This height creates a faux-centered (actually about a quarter-inch closer to the top) small page
\setlength{\smallwidth}{234pt} % This mimics the 1/sqrt(2) ratio of the page

%%  Empty last page:  %%

\AtEndDocument{\atendtext\cleartoevenpage[\null\thispagestyle{cleared}]\null\pagestyle{cleared}}

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

%%  Verse formatting:  %%

\setlength{\vleftmargin}{0.5\vgap}

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
	\renewcommand{\printchaptertitle}[1]{
		\begin{center}
			\parbox[m][\topheight][t]{\smallwidth}{
				\centering\begin{vplace}[2]\chaptitlefont ##1\end{vplace}
			}
		\end{center}
	}
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
	\renewcommand{\printchaptertitle}[1]{
		\begin{center}
			\parbox[m][\topheight][b]{\smallwidth}{
				\noindent\llap{\makebox[38.5pt][l]{\chapnumfont \thechapter}}{ % The box size of the chapter number was chosen to align with the left edge of the typeblock
					\chaptitlefont\enquote*{##1}
				}\par\vspace{16pt}
			}
		\end{center}
	}
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
	\renewcommand{\printchaptertitle}[1]{
		\begin{center}
		\parbox[m][\topheight][b]{\smallwidth}{
			\begin{center}
				{\IMlarge \seriesinfo}
				\par\medskip
				\par{\IMLARGE \fellpattern{a} \caps{\MakeUppercase{\titleinfo}} \fellpattern{c}}
				\par\rule[.35em]{\smallwidth}{1pt}
			\end{center}
			\vfill\noindent\llap{\makebox[32pt][l]{\chapnumfont \thechapter}}{ % The box size of the chapter number was chosen to align with the left edge of the typeblock
				\chaptitlefont\enquote*{##1}
			}
			\par\vspace{16pt}
		}
		\end{center}
	}
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
\makeevenhead{chapter}{}{\thecopyright}{}
\makeoddhead{chapter}{}{\thecopyright}{}

%%  Head styles:  %%

\renewcommand{\thesection}{\arabic{section}}
\newcommand{\secheadfmt}[1]{\noindent\hfill\parbox[t]{\smallwidth}{\centering#1\par\vspace{8pt plus 3pt minus 2pt}\hrule}\hfill}
\newcommand{\subsecheadfmt}[1]{\noindent\hfill\parbox[t]{\smallwidth}{\centering#1}\hfill}
\sethangfrom{\noindent #1}
\makeheadstyles{classical}{
	\nobookblankpage
	\renewcommand*{\beforebookskip}{\begin{titlingpage*}\parindent0pt\centering\begin{minipage}[m][\topheight][c]{\smallwidth}\vfill\vfill}
	\renewcommand*{\afterbookskip}{\vfill\end{minipage}\end{titlingpage*}}
	\renewcommand{\printbookname}{}
	\renewcommand{\booknamenum}{}
	\renewcommand{\printbooknum}{}
	\renewcommand{\booktitlefont}{\centering\IMHuge}
	\nopartblankpage
	\renewcommand*{\beforepartskip}{\begin{titlingpage*}\parindent0pt\centering\begin{minipage}[m][\topheight][c]{\smallwidth}\vfill\vfill}
	\renewcommand*{\afterpartskip}{\vfill\end{minipage}\end{titlingpage*}}
	\renewcommand{\printpartname}{}
	\renewcommand{\partnamenum}{}
	\renewcommand{\printpartnum}{{\partnumfont ·\enspace\thepart\enspace ·}}
	\renewcommand{\partnumfont}{\centering\IMLarge}
	\renewcommand{\parttitlefont}{\centering\IMLARGEswash}
	\chapterstyle{IMextra}
	\setbeforesecskip{-16pt plus 3pt minus 5pt}
	\setaftersecskip{16pt plus 5pt minus 3pt}
	\setsecheadstyle{\IMlarge\secheadfmt}
	\setbeforesubsecskip{-16pt plus 3pt minus 5pt}
	\setaftersubsecskip{16pt plus 5pt minus 3pt}
	\setsubsechook{\setsecnumformat{{\normalfont\upshape\bfseries\thesubsection}\par}}
	\setsubsecheadstyle{\normalfont\itshape\subsecheadfmt}
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

\setpnumwidth{23pt} % Max width of 4-digit italic number
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
\setlength{\cftchapternumwidth}{24.75pt} % Width of "000. "
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
\renewcommand{\maketitle}{
	\pagestyle{empty}
	\begin{smallpage}{
		\ifexpandsnotmt{\seriesinfo}{{\IMlarge \seriesinfo}\par}
		\null\bigskip\par
		{\IMHuge \fellpattern{a} \titleinfo{} \fellpattern{c}}\par
	}
	\ifexpandsnotmt{\descriptioninfo}{\descriptioninfo}
	\end{smallpage}
	\clearpage\null\cleartorecto
	\begin{center}
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

		\fbox{\parbox[c][\dimexpr \smallheight-\fboxrule-\fboxrule-\fboxsep-\fboxsep][t]{\dimexpr \smallwidth-\fboxrule-\fboxrule-\fboxsep-\fboxsep}{
			\centering
			\rule[.35em]{\dimexpr (\smallwidth * 3) / 5}{1pt}
			\par\vspace{3.6pt}  %  Compensates for descent being larger than ascent
			\par{\IMHUGE \caps{\MakeUppercase{\titleinfo}}}
			\rule[.35em]{\dimexpr (\smallwidth * 3) / 5}{1pt}
			\ifexpandsnotmt{\seriesinfo}{\par\vspace{14.6pt}  %  16pt - 1.4pt
			\par\textsc{\IMlarge being a story of}
			\par\vspace{7.2pt}  %  12pt - 2.8pt - 2pt
			\par{\IMLARGEswash \seriesinfo}
			\par\vspace{10.3pt}}{\par\vspace{14.3pt}}  %  16pt - 4pt - (1.7pt or 1.4pt)
			\par\textsc{\IMLarge as recorded by}
			\par\vspace{6.1pt}  %  12pt - 3.4pt - 2.5pt
			\par{\IMhuge \authorinfo}
			\par\vspace{11pt}  %  16pt - 5pt
			\par\vspace{.45em}  %  Matches the spacing at the top of a \rule
			\par{\huge\fellpattern{FQOH}}
			\par\vfill
			\ifexpandsnotmt{\publisherinfo}{\par{\IMLarge \fellflower{K} \publisherinfo{} \fellflower{J}}}
		}}
	\end{center}
	\clearpage\null
}

%%  The copyright:  %%

\newcommand{\makecopyright}{
	\vfill
	\begin{center}
		\begin{minipage}[t][\smallheight][t]{\smallwidth}
			\parindent0pt\tinybig
			\ifexpandsnotmt{\publicationdetailsinfo}{\publicationdetailsinfo\par\bigskip}
			\ifexpandsnotmt{\thecopyright}{\thecopyright\par\medskip}
			This draft compiled \today{} at \printtime.
			\par\styleinfo{} Edition\ifexpandsnotmt{\draftinfo}{, draft \draftinfo{}}.
			\par\bigskip
			Book design by the KIBI Gô.
			\par\medskip
			This work is formatted via \XeLaTeX{}.
			Body text is set in 12pt Junicode, a font inspired by the early eighteenth-century Oxford University Press.
			More information about this font and its origins can be found on its website, \url{https://junicode.sourceforge.net/}.
			\par\medskip
			Headings are set in the closely-related Fell Types in various cuts and sizes—as are certain spans of text, for effect.
			The Fell Types are digitally reproduced by Igino Marini. \url{https://iginomarini.com/}.
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
\newcommand{\atendtext}{\par\vfill\centering\pagebreak[1]\null\vfill\parbox[b]{\smallwidth}{\tinybig\ifexpandsnotmt{\publicationdetailsinfo}{\leavevmode\publicationdetailsinfo\nolinebreak\qquad}\ifexpandsnotmt{\thecopyright}{\thecopyright{} }Text design by the KIBI Gô. This work was formatted via \XeLaTeX{}, and this draft was compiled \today{} at \printtime{}.\nolinebreak\qquad Body text has been set in 12pt Junicode, a font inspired by the early eighteenth­‑century Oxford University Press. More information about this font and its origins can be found on its website, \url{https://junicode.sourceforge.net/}.\nolinebreak\qquad Headings have been set in the closely­‑related Fell Types in various cuts and sizes—as are certain spans of text, for effect. The Fell Types are digitally reproduced by Igino Marini. \url{https://iginomarini.com/}.\nolinebreak\qquad This has been the \ordinaltoname{\value{chapter}} chapter of \ifexpandsnotmt{\seriesinfo}{\seriesinfo{} – }\titleinfo{}. Thank you for reading.\lastlinerulefill}}
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