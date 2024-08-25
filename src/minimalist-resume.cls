% Resume Document Class
% Copyright (C) 2024 by Marc Franquesa

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{minimalist-resume}[2024-08-24 Resume Class]

\LoadClass[letterpaper, 11pt]{article}
\pagenumbering{gobble}

\RequirePackage[
    letterpaper,
    left=15mm,
    right=15mm,
    top=20mm,
    bottom=10mm
]{geometry}
\RequirePackage[hidelinks]{hyperref}
\RequirePackage{enumitem}
\RequirePackage{fontawesome5}


\newcommand{\linkIcon}{\faGlobe}
\newcommand{\githubIcon}{\faGithub}


\def\@author{John Doe}
\def\@whoami{\@empty}
\newcommand{\whoami}[1]{
    \def\@whoami{#1}
}
\newcommand{\website}[2][\@empty]{
    \def\@websiteLink{#2}
    \ifx \@empty#1
        \def\@websiteShow{#2}
    \else
        \def\@websiteShow{#1}
    \fi
}
\def\@email{\@empty}
\newcommand{\email}[1]{
    \def\@email{#1}
}
\setlength{\tabcolsep}{0cm}
\renewcommand*{\maketitle}{
    \raggedright
    \begin{tabular*}{\textwidth}{l@{\extracolsep{\fill}}r}
        \textbf{\huge \@author} & \href{mailto:\@email}{\@email}\\
        \@whoami & \ifdefined\@websiteLink \href{\@websiteLink}{\@websiteShow} \else \fi \\
    \end{tabular*}
}

\newcommand{\@sectionformat}[1]{\scshape\raggedright\large #1 \vspace{0.8ex} \hrule}
\renewcommand{\section}{
    \@startsection
    {section}{1}{0pt}{-3.5ex plus -1ex minus -0.2ex}
    {0.8ex plus 0.2ex}{\@sectionformat}
}

\newenvironment{bullets}{\vspace{1.7ex}\begin{itemize}[leftmargin=*]}{\end{itemize}}

\newenvironment{place}[4]{
    \renewenvironment{bullets}{\begin{itemize}[leftmargin=*, label=$\circ$, rightmargin=0cm]}{\end{itemize}}
    \vspace{1ex}
    \begin{tabular*}{\textwidth}{l@{\extracolsep{\fill}}r}
        \textbf{#1} & #2 \\
        \textit{\small#3} & \textit{\small #4} \\
    \end{tabular*}
}{}

\renewcommand{\bullet}[1][\@empty]{
    \ifx \@empty#1 \else \def\@bulletArgI{#1} \fi
    \bulletRelay
}
\newcommand{\bulletRelay}[2][\@empty]{
    \vspace{-1ex}
    \item\small{{\ifdefined\@bulletArgI \textbf{\ifx\@empty#1\@bulletArgI: \else\href{#1}{\@bulletArgI}:\fi}\else\fi}#2}
}