graphs  = spectrum.eps spectrum_empty.eps \
	xy_empty.eps xy.eps xy_charges.eps
pics    = schema.eps

all: $(graphs) $(pics)

$(graphs): %.eps: %.gp
	gnuplot $<

$(pics): %.eps: %.fig
	fig2dev -L eps $< $(addsuffix .eps, $(basename $@))
	
clean:
	rm -f $(graphs) $(pics) fit.log *-eps-converted-to.pdf
