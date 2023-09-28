graphs = phasendiagramm.eps
pics = 

all: $(pics) $(graphs)

$(graphs): %.eps: %.gp
	gnuplot $<

$(pics): %.eps: %.fig
	fig2dev -L eps $< $(addsuffix .eps, $(basename $@))

clean:
	rm -f $(pics) $(graphs) *-eps-converted-to.pdf
