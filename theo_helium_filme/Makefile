graphs  = nrec.eps drec.eps filmdicke.eps filmpressure.eps \
	uclamp_d_dep.eps uclamp_n_dep.eps \
	uclamp_d_dep2.eps uclamp_n_dep2.eps

pics    =

all: $(graphs) $(pics)

$(graphs): %.eps: %.gp
	gnuplot $<

$(pics): %.eps: %.fig
	fig2dev -L eps $< $(addsuffix .eps, $(basename $@))
	
clean:
	rm -f $(graphs) $(pics) *-eps-converted-to.pdf
