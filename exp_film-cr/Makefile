graphs  = cr0202d4_001.pdf cr0202d4_002.pdf cr0202d4_003.pdf cr0202d4_004.pdf \
	cr0202d4_005.pdf cr0202d4_006.pdf cr0202d4_007.pdf
pics    =

all: $(graphs) $(pics)

$(graphs): %.pdf: %.gp
	gnuplot $<
	epstopdf $(addsuffix .eps, $(basename $@))

$(pics): %.pdf: %.fig
	fig2dev -L eps $< $(addsuffix .eps, $(basename $@))
	epstopdf $(addsuffix .eps, $(basename $@))
	
clean:
	rm -f $(graphs) $(pics) $(pgspics) *.eps fit.log
