graphs  = filui.pdf filr.pdf filp.pdf \
	fil_eichplot.pdf fil_instability.pdf fil_eichung2.pdf\
	he_level.pdf \
	vergleich1.pdf vergleich2.pdf \
	fitvergleich1.pdf fitvergleich2.pdf \
	modeplot1.pdf modeplot2.pdf \
	temp_eichung.pdf \
	modevgl_bulkt.pdf modevgl_bulkf.pdf \
	absorp1.pdf absorp2.pdf
pics    = nwa_setup.pdf \
	TM010.pdf \
	TM011.pdf \
	fil_eichung.pdf

all: $(graphs) $(pics)

$(graphs): %.pdf: %.gp
	gnuplot $<
	epstopdf $(addsuffix .eps, $(basename $@))

$(pics): %.pdf: %.fig
	fig2dev -L pdf $< $@

	
clean:
	rm -f $(graphs) $(pics) *.eps fit.log
