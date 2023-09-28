graphs  = C_rrr.eps c_cooldown.eps si_cooldown.eps
pics    = substrate68.eps

all: $(graphs) $(pics)

$(graphs): %.eps: %.gp
	gnuplot $<

$(pics): %.eps: %.fig
	fig2dev -L eps $< $(addsuffix .eps, $(basename $@))
	
clean:
	rm -f $(graphs) $(pics) fit.log *-eps-converted-to.pdf
