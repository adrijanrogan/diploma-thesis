% 
%
%
%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{isrmdelo}

%-----------------------------------------------------------------------------
%   Pomozni ukazi in spremenljivke
%-----------------------------------------------------------------------------

% Nalozimo pakete, ki ponujajo enostavno programiranje.
\RequirePackage{etoolbox, ifthen, keyval}

% Definiramo pomozne ukaze.
\newcommand{\@ifthen}[2]{\ifthenelse{#1}{#2}{\relax}}
\newcommand{\@unless}[2]{\ifthenelse{#1}{\relax}{#2}}
\newcommand{\@blank}[1]{\equal{#1}{}}

%-----------------------------------------------------------------------------
%   Opcije
%-----------------------------------------------------------------------------

% vse ostale moznosti (fleqn, twocolumn, ...) podamo naprej v paket book
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}

\ProcessOptions\relax

%-----------------------------------------------------------------------------
%   Nalaganje paketov
%-----------------------------------------------------------------------------

% Za osnovo si vzamemo book in nalozimo pakete.
\LoadClass[12pt, a4paper]{book}
\RequirePackage{amsfonts,amsmath,amssymb,amsthm}
\RequirePackage[slovene]{babel}
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage{silence}
\WarningFilter{hyperref}{Option}
\RequirePackage{hyperxmp}
\RequirePackage[pdfa,pdfapart=1,pdfaconformance=B]{hyperref}
% Poskrbi za glave strani
\RequirePackage{fancyhdr}

% algorithms
\RequirePackage{algpseudocode}  % za psevdokodo
\RequirePackage{algorithm}      % za
\floatname{algorithm}{Algoritem}
\renewcommand{\listalgorithmname}{Kazalo algoritmov}
\algnewcommand\algorithmicto{\textbf{to}}
\algnewcommand\algorithmicin{\textbf{in}}
\algnewcommand\algorithmicforeach{\textbf{for each}}
\algrenewtext{For}[3]{\algorithmicfor\ #1 $\gets$ #2\ \algorithmicto\ #3\ \algorithmicdo}
\algdef{S}[FOR]{ForEach}[2]{\algorithmicforeach\ #1\ \algorithmicin\ #2\ \algorithmicdo}

\newcommand{\zapisiMetaPodatke}{
  \hypersetup{pdfencoding=auto, psdextra, pdflang=sl,
    bookmarksopen, bookmarksdepth=3,
    pdfauthor=\@avtor,
    pdftitle=\@naslov,
    pdfproducer={pdfTeX},
    pdfsubject={matematika},
    pdfkeywords=\@kljucnebesede}
  \RequirePackage[a-1b]{pdfx}
  \let\C\undefined
}

%-----------------------------------------------------------------------------
%   Postavitev strani
%-----------------------------------------------------------------------------

% Robovi za tisk
\addtolength{\marginparwidth}{-20pt}
\addtolength{\oddsidemargin}{40pt}
\addtolength{\evensidemargin}{-40pt}

% Razmik med vrsticami
\renewcommand{\baselinestretch}{1.3} % ustrezen razmik med vrsticami
% Potreben prostor na vrhu
\setlength{\headheight}{15pt}
% TODO what does this do
\renewcommand{\chaptermark}[1]%
{\markboth{\MakeUppercase{\thechapter.\ #1}}{}} \renewcommand{\sectionmark}[1]%
{\markright{\MakeUppercase{\thesection.\ #1}}} \renewcommand{\headrulewidth}{0.5pt} \renewcommand{\footrulewidth}{0pt}

%-----------------------------------------------------------------------------
%   Oblikovanje glave
%-----------------------------------------------------------------------------

\fancyhf{}
\fancyhead[LE,RO]{\sl \thepage} 
%\fancyhead[LO]{\sl \rightmark} \fancyhead[RE]{\sl \leftmark}
\fancyhead[RE]{\sc \@avtor}
\fancyhead[LO]{\sc Diplomska naloga}

%-----------------------------------------------------------------------------
%   Podatki o delu
%-----------------------------------------------------------------------------

\newcommand{\mentor}[1]{\def\@mentor{#1}}
\newcommand{\somentor}[1]{\def\@somentor{#1}}
\newcommand{\mentorica}[1]{\def\@mentorica{#1}}
\newcommand{\somentorica}[1]{\def\@somentorica{#1}}
\newcommand{\program}[1]{\def\@program{#1}}
\newcommand{\avtor}[1]{\def\@avtor{#1}}
\newcommand{\naslov}[1]{\def\@naslov{#1}}
\renewcommand{\title}[1]{\def\@title{#1}}
\newcommand{\letnica}[1]{\def\@letnica{#1}}
\newcommand{\povzetek}[1]{\def\@povzetek{#1}}
\newcommand{\abstract}[1]{\def\@abstract{#1}}
\newcommand{\klasifikacija}[1]{\def\@klasifikacija{#1}}
\newcommand{\kljucnebesede}[1]{\def\@kljucnebesede{#1}}
\newcommand{\keywords}[1]{\def\@keywords{#1}}

%-----------------------------------------------------------------------------
%   Ukazi za matematična okolja
%-----------------------------------------------------------------------------

% Tekst napisan pokončno
\theoremstyle{definition}
\newtheorem{definicija}{Definicija}[chapter]
\newtheorem{primer*}[definicija]{Primer}
\newtheorem{opomba}[definicija]{Opomba}
\newtheorem{zgled*}[definicija]{Zgled}

\newenvironment{dokaz}[1][Dokaz]{\begin{proof}[#1]}{\end{proof}}
\newenvironment{primer}[1][]{\begin{primer*}[#1]\renewcommand*{\qedsymbol}{$\diamondsuit$}\pushQED{\qed}}{\popQED\end{primer*}}
\newenvironment{zgled}[1][]{\begin{zgled*}[#1]\renewcommand*{\qedsymbol}{$\diamondsuit$}\pushQED{\qed}}{\popQED\end{zgled*}}

% Tekst napisan poševno
\theoremstyle{plain} % tekst napisan posevno
\newtheorem{lema}[definicija]{Lema}
\newtheorem{izrek}[definicija]{Izrek}
\newtheorem{trditev}[definicija]{Trditev}
\newtheorem{posledica}[definicija]{Posledica}

%-----------------------------------------------------------------------------
%   Razno
%-----------------------------------------------------------------------------

% Ukaz za slovarsko geslo
\newcommand{\geslo}[2]{\noindent\textbf{#1}\hspace*{3mm}\hangindent=\parindent\hangafter=1 #2\par}

% Ukaz za dvojno prazno stran (po zaključku poglavja)
\newcommand{\clearemptydoublepage}{\newpage{\pagestyle{empty}\cleardoublepage}}

% Globina kazala
\setcounter{tocdepth}{1}

%-----------------------------------------------------------------------------
%   Izpis začetnih strani
%-----------------------------------------------------------------------------

\AfterEndPreamble{%

\selectlanguage{slovene}
\frontmatter
\setcounter{page}{1}
\renewcommand{\thepage}{}

%-----------------------------------------------------------------------------
%   Naslovnica
%-----------------------------------------------------------------------------

\thispagestyle{empty}%
\begin{center}
{\large\sc Univerza v Ljubljani\\%
Fakulteta za računalništvo in informatiko\\%
Fakulteta za matematiko in fiziko\\%
}

\vskip 10em%
{\Large \@avtor\par}%
{\LARGE\bf \@naslov\par}%

{\vskip 3em \textsc{
DIPLOMSKO DELO\\[5mm] 
INTERDISCIPLINARNI UNIVERZITETNI\\ 
ŠTUDIJSKI PROGRAM PRVE STOPNJE\\ 
RAČUNALNIŠTVO IN MATEMATIKA}\par}%
\vfill\null%

\@unless{\@blank{\@mentor}}{\large \textsc{Mentor}: \@mentor\par}%
\@unless{\@blank{\@mentorica}}{\large \textsc{Mentorica}: \@mentorica\par}%
\@unless{\@blank{\@somentor}}{\large \textsc{Somentor}: \@somentor\par}%
\@unless{\@blank{\@somentorica}}{\large \textsc{Somentorica}: \@somentorica\par}%

{\vskip 2em \large Ljubljana, \@letnica \par}%
\end{center}

%-----------------------------------------------------------------------------
%   Avtorske pravice
%-----------------------------------------------------------------------------

\thispagestyle{empty}
\vspace*{8cm}

\noindent
{\sc Copyright}. 
Rezultati diplomske naloge so intelektualna lastnina avtorja in matične fakultete Univerze v Ljubljani.
Za objavo in koriščenje rezultatov diplomske naloge je potrebno pisno privoljenje avtorja, fakultete ter mentorja.

\begin{center}
\mbox{}\vfill
\emph{Besedilo je oblikovano z urejevalnikom besedil \LaTeX.}
\end{center}

\clearemptydoublepage

%-----------------------------------------------------------------------------
%   Kazalo
%-----------------------------------------------------------------------------

\pagestyle{empty}
\def\thepage{}% ne prikaži številke strani v glavi kazala
\tableofcontents

\clearemptydoublepage

%-----------------------------------------------------------------------------
%   Povzetek v slovenščini in angleščini
%-----------------------------------------------------------------------------

\selectlanguage{slovene}
\chapter*{Povzetek}

\noindent\textbf{Naslov:} \@naslov
\bigskip

\noindent \@povzetek
\bigskip

\noindent\textbf{Ključne besede:} \@kljucnebesede.
\bigskip

\clearemptydoublepage

\selectlanguage{english}
\chapter*{Abstract}

\noindent\textbf{Title:} \@title
\bigskip

\noindent \@abstract
\bigskip

\noindent\textbf{Keywords:} \@keywords.
\bigskip

\noindent\textbf{Math. Subj. Class. (2010):} \@klasifikacija

\clearemptydoublepage

\mainmatter
\setcounter{page}{1}
\pagestyle{fancy}
\selectlanguage{slovene}

}
