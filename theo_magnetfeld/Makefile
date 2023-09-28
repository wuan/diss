GRAPHS  = zyklotronresonanz.eps cr_schema.eps
PICS    =

all: $(GRAPHS) $(PICS)

$(GRAPHS): %.eps: %.gp
	gnuplot $<

$(PICS): %.eps: %.fig
	fig2dev -L eps $< $(addsuffix .eps, $(basename $@)) 
	
clean:
	rm -f $(GRAPHS) $(PICS) fit.log *-eps-converted-to.pdf
