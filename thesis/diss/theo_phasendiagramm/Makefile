graphs = phasendiagramm.pdf
pics = 

all: $(pics) $(graphs)

$(graphs): %.pdf: %.gp
	gnuplot $<
	epstopdf $(addsuffix .eps, $(basename $@))

$(pics): %.pdf: %.fig
	fig2dev -L pdf $< $@

clean:
	rm -f $(pics) $(graphs) *.eps
