$pdf_mode = 1;
$pdflatex = 'pdflatex -synctex=1 -interaction=nonstopmode -file-line-error %O %S';

# All build output (main.pdf plus .aux/.log/.toc/.bbl/.synctex.gz ...) goes
# into pdf/ instead of cluttering the project root. The folder is created
# automatically and is gitignored.
$out_dir = 'pdf';
