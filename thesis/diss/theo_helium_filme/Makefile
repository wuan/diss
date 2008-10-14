graphs  = nrec.pdf drec.pdf filmdicke.pdf filmpressure.pdf \
	uclamp_d_dep.pdf uclamp_n_dep.pdf \
	uclamp_d_dep2.pdf uclamp_n_dep2.pdf

pics    =

all: $(graphs) $(pics)

$(graphs): %.pdf: %.gp
	gnuplot $<
	epstopdf $(addsuffix .eps, $(basename $@))

$(pics): %.pdf: %.fig
	fig2dev -L pdf $< $@
	
clean:
	rm -f $(graphs) $(pics) *.eps
