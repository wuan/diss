graphs  = bulk_charge.eps bulk_cr.eps \
	bulk_cr_abs1.eps bulk_cr_abs2.eps \
	bulk_cr_frq1.eps bulk_cr_frq2.eps \
	bulk_cr_res1.eps bulk_cr_res2.eps \
	bulk_cr_res3.eps bulk_cr_res4.eps \
	bulk_cr_nonlinear.eps
pics    = cyclotron_resonance.eps bulkcharge.eps

all: $(graphs) $(pics)

$(graphs): %.eps: %.gp
	gnuplot $<

$(pics): %.eps: %.fig
	fig2dev -L eps $< $(addsuffix .eps, $(basename $@))


clean:
	rm -f $(graphs) $(pics) fit.log *-eps-converted-to.pdf
