graphs  = filui.eps filr.eps filp.eps \
	fil_eichplot.eps fil_instability.eps fil_eichung2.eps\
	he_level.eps \
	vergleich1.eps vergleich2.eps \
	fitvergleich1.eps fitvergleich2.eps \
	modeplot1.eps modeplot2.eps \
	temp_eichung.eps \
	modevgl_bulkt.eps modevgl_bulkf.eps \
	absorp1.eps absorp2.eps
pics    = nwa_setup.eps \
	TM010.eps \
	TM011.eps \
	fil_eichung.eps

all: $(graphs) $(pics)

$(graphs): %.eps: %.gp
	gnuplot $<

$(pics): %.eps: %.fig
	fig2dev -L eps $< $(addsuffix .eps, $(basename $@))

clean:
	rm -f $(graphs) $(pics) fit.log *-eps-converted-to.pdf
