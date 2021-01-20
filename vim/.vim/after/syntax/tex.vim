" we need the conceal feature (vim ≥ 7.3)
if !has('conceal')
  finish
endif

syntax match texStatement '\\item' conceal cchar=•
syntax match texStatement '\\subitem' conceal cchar=∙
syntax match texStatement '\\subsubitem' conceal cchar=∙

syntax match texStatement '\\begin{' conceal
syntax match texStatement '\\end{' conceal
syntax match texStatement '}' conceal

syntax match texStatement '\\begin{itemize}' conceal
syntax match texStatement '\\end{itemize}' conceal

syntax match texStatement '\\section{' conceal 

syntax region texText matchgroup=texStatement start='\\begin{' end='}' conceal 
syntax region texText matchgroup=texStatement start='\\end{' end='}' conceal 
syntax region texText matchgroup=texStatement start='\\section{' end='}' concealends

" Highlight concealed text with same color
highlight! link Conceal texStatement

