graphs  = C_rrr.pdf c_cooldown.pdf si_cooldown.pdf
pics    = substrate68.pdf

all: $(graphs) $(pics)

$(graphs): %.pdf: %.gp
	gnuplot $<
	epstopdf $(addsuffix .eps, $(basename $@))

$(pics): %.pdf: %.fig
	fig2dev -L eps $< $(addsuffix .eps, $(basename $@))
	epstopdf $(addsuffix .eps, $(basename $@))
	
clean:
	rm -f $(graphs) $(pics) *.eps fit.log
