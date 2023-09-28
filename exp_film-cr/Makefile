graphs  = cr0202d4_001.eps cr0202d4_002.eps cr0202d4_003.eps cr0202d4_004.eps \
	cr0202d4_005.eps cr0202d4_006.eps cr0202d4_007.eps
pics    =

all: $(graphs) $(pics)

$(graphs): %.eps: %.gp
	gnuplot $<

$(pics): %.eps: %.fig
	fig2dev -L eps $< $(addsuffix .eps, $(basename $@))
	
clean:
	rm -f $(graphs) $(pics) $(pgspics) fit.log *-eps-converted-to.pdf
