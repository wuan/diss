graphs  = bulk_charge.pdf bulk_cr.pdf \
	bulk_cr_abs1.pdf bulk_cr_abs2.pdf \
	bulk_cr_frq1.pdf bulk_cr_frq2.pdf \
	bulk_cr_res1.pdf bulk_cr_res2.pdf \
	bulk_cr_res3.pdf bulk_cr_res4.pdf \
	bulk_cr_nonlinear.pdf
pics    = cyclotron_resonance.pdf bulkcharge.pdf

all: $(graphs) $(pics)

$(graphs): %.pdf: %.gp
	gnuplot $<
	epstopdf $(addsuffix .eps, $(basename $@))

$(pics): %.pdf: %.fig
	fig2dev -L pdf $< $@

clean:
	rm -f $(graphs) $(pics) *.eps
