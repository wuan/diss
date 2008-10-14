graphs  = spectrum.pdf spectrum_empty.pdf \
	xy_empty.pdf xy.pdf xy_charges.pdf
pics    = schema.pdf

all: $(graphs) $(pics)

$(graphs): %.pdf: %.gp
	gnuplot $<
	epstopdf $(addsuffix .eps, $(basename $@))

$(pics): %.pdf: %.fig
	fig2dev -L pdf $< $@
	
clean:
	rm -f $(graphs) $(pics) *.eps
