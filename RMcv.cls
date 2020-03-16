%-----------------------------------------------------------------------------------------------------------------------------------------------%
%  The MIT License (MIT)
%
%  Copyright (c) 2015 Jan Küster
%
%  Permission is hereby granted, free of charge, to any person obtaining a copy
%  of this software and associated documentation files (the "Software"), to deal
%  in the Software without restriction, including without limitation the rights
%  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
%  copies of the Software, and to permit persons to whom the Software is
%  furnished to do so, subject to the following conditions:
%
%  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
%  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
%  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
%  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
%  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
%  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
%  THE SOFTWARE.
%
%
%-----------------------------------------------------------------------------------------------------------------------------------------------%
%
% Class template for my CV
%
% Five main colors are defined:
% - bgcol:     dark background color for the title (fg: white), for the bullet-point-like arrows, dates in cvevent
% - sectcol:   color for the section head (fg: white) and for the place in cvevent
% - lightsect: color for the details (arrows) in the section head
% - lighthead: color for the vertical bar in the head
% - softcol:   light background color (horizontal lines)
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{RMcv}[2020/03/16 Class for personal CV template]
%
% Unknown Options
%% Do nothing
%\DeclareOption*{}
%% Pass it to article
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{babel}}
% You can use also \PassOptionsToPackage/Class{option}{package}
% END OF OPTIONS
\ProcessOptions\relax

%============================================================================%
%
%  DOCUMENT DEFINITION
%
%============================================================================%

%we use article class because we want to fully customize the page and dont use a cv template
\LoadClass[10pt,a4paper]{article}


%----------------------------------------------------------------------------------------
%  ENCODING
%----------------------------------------------------------------------------------------

%we use utf8 since we want to build from any machine
\RequirePackage[utf8]{inputenc}

%----------------------------------------------------------------------------------------
%  LANGUAGE
%----------------------------------------------------------------------------------------

\RequirePackage{babel}

%----------------------------------------------------------------------------------------
%  LOGIC
%----------------------------------------------------------------------------------------

% provides \isempty test
\RequirePackage{xifthen}

%----------------------------------------------------------------------------------------
%  FONT
%----------------------------------------------------------------------------------------

% some tex-live fonts - choose your own

%\RequirePackage[defaultsans]{droidsans}
%\RequirePackage[default]{comfortaa}
%\RequirePackage{cmbright}
\RequirePackage[default]{raleway}
%\RequirePackage{fetamont}
%\RequirePackage[default]{gillius}
%\RequirePackage[light,math]{iwona}
%\RequirePackage[thin]{roboto}

% set font default
\renewcommand*\familydefault{\sfdefault}
\RequirePackage[T1]{fontenc}

% more font size definitions
\RequirePackage{moresize}


%----------------------------------------------------------------------------------------
%  PAGE LAYOUT  DEFINITIONS
%----------------------------------------------------------------------------------------

%debug page outer frames
%\RequirePackage{showframe}


%define page styles using geometry
\RequirePackage[a4paper]{geometry}

% for example, change the margins to 2 inches all round
% Original \geometry{top=1.75cm, bottom=-.6cm, left=1.5cm, right=1.5cm}
\geometry{top=1.25cm, bottom=-.6cm, left=1.5cm, right=1.5cm}
%use customized header
\RequirePackage{fancyhdr}
\pagestyle{fancy}

%less space between header and content
\setlength{\headheight}{-5pt}


%customize entries left, center and right
%\lhead{}
%\chead{ \small{Riccardo Milani  $\cdot$ Mathematical Engineer $\cdot$  Italian, French  $\cdot$  \textcolor{sectcol}{\textbf{ricc.milani@gmail.com}}  $\cdot$ +33 6 43 34 16 23}}
%\rhead{}


%indentation is zero
\setlength{\parindent}{0mm}

%----------------------------------------------------------------------------------------
%  TABLE /ARRAY DEFINITIONS
%----------------------------------------------------------------------------------------

%for layouting tables
\RequirePackage{multicol}
\RequirePackage{multirow}

%extended aligning of tabular cells
\RequirePackage{array}

\newcolumntype{x}[1]{%
>{\raggedleft\hspace{0pt}}p{#1}}%
\newcolumntype{q}[1]{%
>{\raggedright\arraybackslash\hspace{0pt}}p{#1}}%


%----------------------------------------------------------------------------------------
%  GRAPHICS DEFINITIONS
%----------------------------------------------------------------------------------------

%for header image
\RequirePackage{graphicx}

%for floating figures
\RequirePackage{wrapfig}
\RequirePackage{float}
%\floatstyle{boxed}
%\restylefloat{figure}

%for drawing graphics
\RequirePackage{tikz}
\usetikzlibrary{shapes, backgrounds,mindmap, trees}

\RequirePackage{hyperref}

\RequirePackage{fontawesome}

%----------------------------------------------------------------------------------------
%  Color DEFINITIONS
%----------------------------------------------------------------------------------------

\RequirePackage{color}

%accent color
\definecolor{sectcol}{RGB}{100,120,180}
\definecolor{lightsect}{HTML}{C8CDDB}
\definecolor{lighthead}{HTML}{A6ADC1}

%dark background color
%\definecolor{bgcol}{HTML}{303E69}
\definecolor{bgcol}{RGB}{100,110,120}

%light background / accent color
\definecolor{softcol}{RGB}{225,225,225}


%============================================================================%
%
%
%  DEFINITIONS
%
%
%============================================================================%

%----------------------------------------------------------------------------------------
%   HEADER
%----------------------------------------------------------------------------------------

% remove top header line
\renewcommand{\headrulewidth}{0pt}

%remove botttom header line
\renewcommand{\footrulewidth}{0pt}

%remove pagenum
\renewcommand{\thepage}{}

%remove section num
\renewcommand{\thesection}{}

%----------------------------------------------------------------------------------------
%   ARROW GRAPHICS in Tikz
%----------------------------------------------------------------------------------------

% a six pointed arrow poiting to the left
\newcommand{\tzlarrow}{(0,0) -- (0.2,0) -- (0.3,0.2) -- (0.2,0.4) -- (0,0.4) -- (0.1,0.2) -- cycle;}

% include the left arrow into a tikz picture
% param1: fill color
%
\newcommand{\larrow}[1]
{\begin{tikzpicture}[scale=0.58]
   \filldraw[fill=#1!100,draw=#1!100!black]  \tzlarrow
 \end{tikzpicture}
}

% a six pointed arrow poiting to the right
\newcommand{\tzrarrow}{ (0,0.2) -- (0.1,0) -- (0.3,0) -- (0.2,0.2) -- (0.3,0.4) -- (0.1,0.4) -- cycle;}

% include the right arrow into a tikz picture
% param1: fill color
%
\newcommand{\rarrow}
{\begin{tikzpicture}[scale=0.7]
  \filldraw[fill=sectcol!100,draw=sectcol!100!black] \tzrarrow
 \end{tikzpicture}
}

%----------------------------------------------------------------------------------------
%  custom sections
%----------------------------------------------------------------------------------------

% create a coloured box with arrow and title as cv section headline
% param 1: section title
%
\newcommand{\cvsection}[1]
{
\colorbox{sectcol}{\mystrut \makebox[1\linewidth][l]{
\larrow{lightsect} \hspace{-8pt} \larrow{lightsect} \hspace{-8pt} \larrow{lightsect} \textcolor{white}{\textbf{#1}}\hspace{4pt}
}}\\
}

\newcommand{\cvsubsection}[1]
{
\mystrut \makebox[1\linewidth][l]{
\larrow{bgcol} \hspace{-8pt} \larrow{bgcol} \hspace{-8pt} \larrow{bgcol} \textcolor{sectcol}{\textbf{#1}}
}\\
\vspace{-6pt}
\textcolor{softcol}{\hrule height 1.5pt}
}

%create a coloured arrow with title as cv meta section section
% param 1: meta section title
%
\newcommand{\metasection}[2]
{
\begin{tabular*}{1\textwidth}{p{2.4cm} p{11cm}}
\larrow{bgcol}  \normalsize{\textcolor{sectcol}{#1}}&#2\\[12pt]
\end{tabular*}
}

%----------------------------------------------------------------------------------------
%   CV EVENT
%----------------------------------------------------------------------------------------

% creates a stretched box as cv entry headline followed by two paragraphs about
% the work you did
% param 1:  event time i.e. 2014 or 2011-2014 etc.
% param 2:  event name (what did you do?)
% param 3:  institution (where did you work / study)
% param 4:  what was your position
% param 5:  some words about your contributions
%
\newcommand\intercvevent{6pt}
\newcommand\intracvevent{6pt}
\newcommand{\cvevent}[5]
{
\vspace{\intercvevent}
  \begin{tabular*}{1\textwidth}{p{2.3cm} p{7.8cm} x{6.9cm}} %10.8 3.9
 \textcolor{bgcol}{#1}& \textbf{#2} & \vspace{2.5pt}\textcolor{sectcol}{#3}

  \end{tabular*}
\vspace{-12pt}
\textcolor{softcol}{\hrule height 1.5pt}
\vspace{\intracvevent}
  \begin{tabular*}{1\textwidth}{p{2.3cm} q{15.2cm}}
&\larrow{bgcol} {#4}\\[3pt]
&\larrow{bgcol} {#5}\\[6pt]
  \end{tabular*}

}

% creates a stretched box as
\newcommand{\cveventmeta}[2]
{
  \mbox{\mystrut \hspace{87pt}\textit{#1}}\\
  #2
}

%----------------------------------------------------------------------------------------
%   MAIN HEAD
%----------------------------------------------------------------------------------------

% use this for multiple words like working titles etc.
%\hspace{-0.25\linewidth}\colorbox{bgcol}{\makebox[1.5\linewidth][c]{\hspace{46pt}\HUGE{\textcolor{white}{\textsc{Jan Küster}} } \textcolor{sectcol}{\rule[-1mm]{1mm}{0.9cm}} \parbox[b]{5cm}{   \large{ \textcolor{white}{{IT Consultant}}}\\
% \large{ \textcolor{white}{{Resume}}}}
%}}

% use this for single words, e.g. CV or RESUME etc.
% param1: CV name, for example, CV or Resume
\newcommand\cvhead[1]{\hspace{-0.25\linewidth}\colorbox{bgcol}{\makebox[1.5\linewidth][c]{\href{https://cermics.enpc.fr/~milanir/}{\HUGE{\textcolor{white}{Riccardo \textbf{\textsc{Milani}}}}}\hspace{1em}\textcolor{lighthead}{\rule[-1mm]{1mm}{0.9cm}}\hspace{1em}\HUGE{\textcolor{white}{\textsc{#1}}}}}}

%----------------------------------------------------------------------------------------
% CUSTOM STRUT FOR EMPTY BOXES
%----------------------------------------- -----------------------------------------------
\newcommand{\mystrut}{\rule[-.3\baselineskip]{0pt}{\baselineskip}}

%----------------------------------------------------------------------------------------
% CUSTOM
%----------------------------------------------------------------------------------------
% Lorem
\newcommand{\lorem}
{Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec a diam lectus.}

% Code_Saturne
\newcommand{\cs}{{\fontfamily{ppl}\fontshape{it}\selectfont Code\_Saturne}}
%
\endinput
