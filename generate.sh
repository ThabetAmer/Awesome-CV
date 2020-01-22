#!/bin/bash
[ "$1" ] && { docker run -i -w "/doc" -v "$PWD":/doc thomasweise/texlive xelatex -interaction=nonstopmode -halt-on-error $1; exit 0; }

# batch mode - compile all tex files
docker run -i -w "/doc" -v "$PWD":/doc thomasweise/texlive bash -c 'for file in $(find . -maxdepth 1 -name "*.tex"); do echo "Generating pdf for $file ..." && xelatex -interaction=batchmode -halt-on-error $file; done'

# cleanup
echo "Cleanup..."
rm -rf *.log *.aux *.out
