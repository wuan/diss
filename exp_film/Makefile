graphs  = film_transmission.eps film_frequency.eps film_quality.eps \
	film_density.eps film2_density.eps \
	film2_transmission.eps film2_frequency.eps film2_quality.eps \
	saturate_1.eps saturate_2.eps saturate_3.eps \
	power_1.eps power_2.eps power_3.eps \
	2powercharge_trans.eps 2powercharge_freq.eps \
	longcharge.eps \
	film_hysteresis.eps film_hysteresis2.eps \
	film_high_n.eps \
	film_overview.eps film_overview2.eps \
	film_quantum_time.eps film_quantum_melting.eps \
	film_quantum_reproduce.eps \
	film_high_n_pmma.eps \
	film_high_n_sio2.eps \
	film_series.eps pmma_reproduce.eps pmma_reproduce2.eps
pics    = verlustkanaele.eps charge_process.eps

all: $(graphs) $(pics)

$(graphs): %.eps: %.gp
	gnuplot $<

$(pics): %.eps: %.fig
	fig2dev -L eps $< $(addsuffix .eps, $(basename $@))
	
clean:
	rm -f $(graphs) $(pics) fit.log *-eps-converted-to.pdf
