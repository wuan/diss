# Dissertation

The original files from my PhD thesis.

The latest version of the document can be downloaded [here](https://github.com/wuan/diss/releases/latest/download/main.pdf).
The original publication can be found [here](https://kops.uni-konstanz.de/entities/publication/3382208a-858b-45bd-8cdb-adc3041b686b).

## Build steps

1. Compile and install `smooth` and `hpna` which are part of the `./src` folder
2. Install dependencies
  * `gnuplot` for generating plots
  * `texlive-font-utils` containing `epstopdf` for preprocessing images
  * `fig2dev` to generate Fig drawings
3. Create all plots and drawings via `make`
4. Compile LaTeX document via `latexmk -pdf main.tex` 
