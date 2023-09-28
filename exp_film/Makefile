graphs  = film_transmission.pdf film_frequency.pdf film_quality.pdf \
	film_density.pdf film2_density.pdf \
	film2_transmission.pdf film2_frequency.pdf film2_quality.pdf \
	saturate_1.pdf saturate_2.pdf saturate_3.pdf \
	power_1.pdf power_2.pdf power_3.pdf \
	2powercharge_trans.pdf 2powercharge_freq.pdf \
	longcharge.pdf \
	film_hysteresis.pdf film_hysteresis2.pdf \
	film_high_n.pdf \
	film_overview.pdf film_overview2.pdf \
	film_quantum_time.pdf film_quantum_melting.pdf \
	film_quantum_reproduce.pdf \
	film_high_n_pmma.pdf \
	film_high_n_sio2.pdf \
	film_series.pdf pmma_reproduce.pdf pmma_reproduce2.pdf
pics    = verlustkanaele.pdf charge_process.pdf

all: $(graphs) $(pics)

$(graphs): %.pdf: %.gp
	gnuplot $<
	epstopdf $(addsuffix .eps, $(basename $@))

$(pics): %.pdf: %.fig
	fig2dev -L eps $< $(addsuffix .eps, $(basename $@))
	epstopdf $(addsuffix .eps, $(basename $@))
	
clean:
	rm -f $(graphs) $(pics) *.eps fit.log
