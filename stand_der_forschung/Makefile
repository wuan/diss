graphs = Gue96_test.eps Gue96_test2.eps
pics = 

all: $(graphs) $(pics)

$(graphs): %.eps: %.gp
	gnuplot $<

$(pics): %.eps: %.fig
	fig2dev -L eps $< $(addsuffix .eps, $(basename $@)) 
	
clean:
	rm -f $(graphs) fit.log *-eps-converted-to.pdf
