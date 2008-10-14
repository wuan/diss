graphs = phasendiagramm.pdf
pics = 

all: $(pics) $(graphs)

$(graphs): %.pdf: %.gp
	gnuplot $<
	epstopdf $(addsuffix .eps, $(basename $@))

$(pics): %.pdf: %.fig
	fig2dev -L eps $< $(addsuffix .eps, $(basename $@))
	epstopdf $(addsuffix .eps, $(basename $@))

clean:
	rm -f $(pics) $(graphs) *.eps
