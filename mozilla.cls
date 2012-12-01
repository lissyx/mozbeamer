% \iffalse meta-comment

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{mozilla}[2012/12/01 Beamer Presentation Class for Mozilla]

\RequirePackage{atbegshi}
\LoadClass{beamer}

\usetheme{Rochester}

\RequirePackage{ifthen}
\RequirePackage{pgf}
\RequirePackage{thumbpdf}
\RequirePackage{wasysym}
\RequirePackage{ucs}
\RequirePackage[utf8x]{inputenc}
\RequirePackage{pgf,pgfarrows,pgfnodes,pgfautomata,pgfheaps,pgfshade}
\RequirePackage{verbatim}

% Declaration of options
\def\background{mozilla-bg-darkgrey}

\newboolean{BNotes}

\DeclareOption{notes}{\setboolean{BNotes}{true}}

% processing options

\ProcessOptions

\newcommand<>{\role}[1]{%
  \def\therole{#1}
}

\newcommand<>{\email}[1]{%
  \def\theemail{#1}
}

%default values
\def\therole{}
\def\theemail{}

\ifthenelse{\boolean{BNotes}}
{
  \RequirePackage{beamerthemeboxes}
  \RequirePackage{pgfpages}
  \setbeameroption{show notes on second screen}
}

\pgfdeclareimage[height=0.4cm]{moz-header}{imgs/mozilla-head}
\pgfdeclareimage[width=2cm]{firefox-logo}{imgs/firefox}

\setbeamertemplate{blocks}[rounded][shadow=false]
\setbeamercovered{transparent}

\usetheme{Mozilla}

\institute{\pgfuseimage{firefox-logo}}

\defbeamertemplate*{title page}{customized}[1][]
{
  \begin{center}
    \usebeamerfont{title}\inserttitle\par
    \usebeamerfont{subtitle}\usebeamercolor[fg]{subtitle}\insertsubtitle\par
  \end{center}
  \vskip 4cm
  \begin{minipage}[t]{0.2\textwidth}\centering
    \usebeamerfont{institute}\insertinstitute\par
  \end{minipage}
  \begin{minipage}[t]{1.2\textwidth}\centering
    \vskip -2cm
    \begin{center}
      \usebeamerfont{author}\insertauthor\par
      \usebeamerfont{role}
      \therole\par
      \usebeamerfont{contact}
      \theemail
    \end{center}
  \end{minipage}
  %% \usebeamerfont{date}\insertdate\par
  %% \usebeamercolor[fg]{titlegraphic}\inserttitlegraphic
}

%\setbeamertemplate{headline}
\setbeamertemplate{frametitle}
{
  \usebeamerfont{frametitle}
  \insertframetitle\par
  \usebeamerfont{framesubtitle}
  \insertframesubtitle
}

\setbeamertemplate{headline}
{
  \hskip 0.85\paperwidth
  \pgfuseimage{moz-header}
  \linethickness{0.0pt}
}

\setbeamertemplate{footline}
{
  \linethickness{0.25pt}
  \framelatex{
  \begin{beamercolorbox}[leftskip=.3cm,wd=\paperwidth,ht=0.3\beamer@headheight,sep=0.1cm]{Location bar}
    \usebeamerfont{section in head/foot}%
    \insertshortauthor~|~\insertshorttitle
    \ifx\insertsection\empty
      % no section name
    \else
      ~|~\insertsectionhead
    \fi
    \hfill
    \insertframenumber/\inserttotalframenumber
  \end{beamercolorbox}
  }
}

\define@key{beamernotes}{enumerate}[true]{%
  \def\beamer@noteenvstart{\usebeamercolor{notes text}\begin{enumerate}\itemsep=0pt\parskip=0pt}%
  \def\beamer@noteenvend{\end{enumerate}}}
\define@key{beamernotes}{itemize}[true]{%
  \def\beamer@noteenvstart{\usebeamercolor{notes text}\begin{itemize}\itemsep=0pt\parskip=0pt}%
  \def\beamer@noteenvend{\end{itemize}}}

\usebackgroundtemplate{\includegraphics[width=\paperwidth]{imgs/\background}}

\AtBeginSection[]
{
  \frame<handout:0>
  {
    %%\frametitle{Outline}
    \tableofcontents[currentsection,hideallsubsections]
  }
}

\AtBeginSubsection[]
{
  \frame<handout:0>
  {
    %%\frametitle{Outline}
    \tableofcontents[sectionstyle=show/hide,subsectionstyle=show/shaded/hide]
  }
}
