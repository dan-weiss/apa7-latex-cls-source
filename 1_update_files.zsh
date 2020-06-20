#!/bin/zsh

cd apa7
mkdir config
tex apa7.dtx
pdflatex apa7.dtx
makeindex -s gglo.ist -o apa7.gls apa7.glo
makeindex -s gind.ist apa7.idx
pdflatex apa7.dtx
# create example documents
cp apa7.cls samples
cp -r config samples
cd samples
pdflatex shortsample.tex
biber shortsample
pdflatex shortsample.tex
pdflatex shortsample.tex
pdflatex longsample.tex
biber longsample
pdflatex longsample.tex
pdflatex longsample.tex
cd ../
# run one more time to include sample document
pdflatex apa7.dtx