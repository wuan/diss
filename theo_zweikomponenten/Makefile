graphs  = twoparts.eps
pics    = 

all: $(graphs) $(pics)

$(graphs): %.eps: %.gp
	gnuplot $<

$(pics): %.eps: %.fig
	fig2dev -L eps $< $(addsuffix .eps, $(basename $@))
	
clean:
	rm -f $(graphs) $(pics) fit.log *-eps-converted-to.pdf
