%------------------------------------------
% Header
%------------------------------------------
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{knapmancv}[2020/12/28 My LaTeX CV]


%------------------------------------------
% Some Preliminaries 
%------------------------------------------
\LoadClass[a4paper]{article}
\pagenumbering{gobble}  % No page numbering
\RequirePackage{lipsum}  % For testing
\RequirePackage{paracol}
\RequirePackage[margin=0mm]{geometry}
\RequirePackage{anyfontsize}  % For using custom font sizes
\RequirePackage{fontawesome}  % For icons
\RequirePackage{hyperref}  % For hyperlinks
\RequirePackage{titlesec}  % For customising headings
\RequirePackage{ifthen}  % For dealing with empty arguments

% No spacing between itemize items
\RequirePackage{enumitem}
\setlist[itemize]{itemsep=0mm, topsep=-1em}

% Page geometry
\geometry{a4paper,left=0mm,top=4mm}


%------------------------------------------
% Paracol stuff to split columns 
%------------------------------------------
\columnratio{0.35}[0.6]

%------------------------------------------
% Personal Information 
%------------------------------------------
\newcommand{\name}[2]{\def\@firstName{#1}\def\@surname{#2}}
\newcommand{\DOB}[1]{\def\@myDOB{#1}}
\newcommand{\birthplace}[1]{\def\@myBirthplace{#1}}
\newcommand{\nationality}[1]{\def\@myNationality{#1}}
\newcommand{\lastupdated}[1]{\def\@whenLastUpdated{#1}}


%------------------------------------------
% Lengths 
%------------------------------------------
\newlength\sidebarWidth
\setlength\sidebarWidth{0.35\paperwidth}

\newlength\mainWidth
\setlength\mainWidth{0.6\paperwidth}

%------------------------------------------
% Colours 
%------------------------------------------
\RequirePackage{xcolor}

\definecolor{sidebarBackground}{HTML}{02075d}


%------------------------------------------
% Texts 
%------------------------------------------
\renewcommand{\familydefault}{\sfdefault}


%------------------------------------------
% Left Column (basic info)
%------------------------------------------
\RequirePackage{tikz}
\RequirePackage[absolute,overlay]{textpos}
\usepackage{tikzpagenodes}
\usetikzlibrary{calc}

\newcommand{\sidebarbackground}{%
    \begin{tikzpicture}[remember picture,overlay]
        \fill[sidebarBackground] (current page.north west)  % Fill entire scope with background
        rectangle ++(\sidebarWidth,-\paperheight);
    \end{tikzpicture}
}

\newcommand{\personalpicture}[1]{%
\noindent\makebox[\textwidth][c]{%
            \begin{minipage}{0.8\textwidth}
            \begin{center}
                % Remember picture: Saves current picure on page to auxiliary file to be used in next compilation
                % Overlay: Things within current TikZ scope not considered when calculating bounding box size
                \begin{tikzpicture}[remember picture,overlay]
                \clip (0, 0)
                circle (0.4\sidebarWidth) node {\includegraphics[width=\linewidth]{#1}};
                \end{tikzpicture}
            \end{center}
    \end{minipage}}
}

\newcommand{\writename}{%
    \noindent\makebox[\sidebarWidth][c]{%
    \begin{minipage}{0.8\sidebarWidth}
        {\hspace{4cm}\flushleft\fontsize{38}{50}\selectfont\@firstName} \\
      \\
      {\hspace{1cm}\fontsize{38}{50}\selectfont\textbf{\@surname}}
    \end{minipage}}
}

\newcommand{\sidebarsection}[1]{%
    \noindent\makebox[\sidebarWidth][c]{%
    \begin{minipage}{0.8\sidebarWidth}
        #1
    \end{minipage}}
    \vskip 3mm
}


\newcommand{\personalinfo}[2]{%
    #1\enspace#2\\
    \\
}

\newcommand{\sidebarheading}[1]{%
    \raggedright\fontsize{16}{20}\selectfont{#1}
    \vskip 3mm
    \hrule
    \vspace{4mm}
}

\newcommand{\sidebarsubheading}[1]{%
    \raggedright\fontsize{14}{16}\selectfont{\underline{#1}}
    \vskip 3mm
}

% Dot disappears if at start of line
% From https://tex.stackexchange.com/questions/44946/check-if-at-begin-of-a-line
\newcommand{\AND}{\unskip
  \hskip 2pt plus 1pt minus 1pt
  \cleaders\copy\ANDbox\hskip\wd\ANDbox
  \hskip 2pt plus 1pt minus 1pt
  \ignorespaces}


%------------------------------------------
% Right Column
%------------------------------------------

\newcommand{\mainsection}[1]{%
    \noindent\makebox[\mainWidth][c]{%
    \begin{minipage}{0.9\mainWidth}
        #1
    \end{minipage}}
    \vskip 3mm
}

\RequirePackage{array}
\newcolumntype{L}[1]{>{\raggedright\let\newline\\\arraybackslash\hspace{0pt}}p{#1}}
\newcommand{\lifestage}[6]{% % The @{} prevents indentation
    \begin{tabular}{@{}L{0.14\mainWidth} L{0.73\mainWidth}}
        #1 & \textbf{#2}, \textit{#3}, \ifthenelse{\equal{#5}{}}{#4.}{#4, \textit{#5}.} \\
           & #6
    \end{tabular}
    \vskip 1mm
}

\newcommand{\teaching}[4]{%
    % The @{} prevents indentation
    \begin{tabular}{@{}L{0.14\mainWidth} L{0.73\mainWidth}}
        #1 & \textbf{#2}, \textit{#3}, #4.
    \end{tabular}
    \vskip 5mm
}

\newcommand{\leadership}[3]{%
    % The @{} prevents indentation
    \begin{tabular}{@{}L{0.14\mainWidth} L{0.7\mainWidth}}
        #1 & \textbf{#2}, \textit{#3}.
    \end{tabular}
    \vskip 2mm
}

\titleformat{\section}         % Customise the \section command 
  {\Large\raggedright} % Make the \section headers large (\Large),
                               % small capitals (\scshape) and left aligned (\raggedright)
  {}{0em}                      % Can be used to give a prefix to all sections, like 'Section ...'
  {}                           % Can be used to insert code before the heading
  [\titlerule]                 % Inserts a horizontal line after the heading

\titleformat{\subsection}
  {\large\raggedright}
  {}{0em}
  {}

