GRAPHS  = zyklotronresonanz.pdf cr_schema.pdf
PICS    =

all: $(GRAPHS) $(PICS)

$(GRAPHS): %.pdf: %.gp
	gnuplot $<
	epstopdf $(addsuffix .eps, $(basename $@))

$(PICS): %.pdf: %.fig
	fig2dev -L eps $< $(addsuffix .eps, $(basename $@)) 
	epstopdf $(addsuffix .eps, $(basename $@))
	
clean:
	rm -f $(GRAPHS) $(PICS) *.eps fit.log
