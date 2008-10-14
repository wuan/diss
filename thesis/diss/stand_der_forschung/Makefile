graphs = Gue96_test.pdf Gue96_test2.pdf
pics = 

all: $(graphs) $(pics)

$(graphs): %.pdf: %.gp
	gnuplot $<
	epstopdf $(addsuffix .eps, $(basename $@))

$(pics): %.pdf: %.fig
	fig2dev -L eps $< $@
	epstopdf $@
	
clean:
	rm -f $(graphs) *.eps fit.log
