CC     = cc # the C compiler
C++ = c++
CFLAGS =  -O4 -g -Wall -ansi
CXXFLAGS = -O4 -g -Wall
LD     =$(CC) $(CFLAGS)	 # default loading command
LIBS   = -lstdc++ -lgcc


MODULE=../../module
INSTALL_DIR=/usr/local/bin

# List of object files except version.o
OBJS = ludcmp.o lubksb.o covsrt.o mrqcof.o mrqmin.o util.o gaussj.o lorex.o lorex_fit.o hpna.o

hpna: $(OBJS) 
	$(LD) $(COPTS) $(OBJS) $(LIBS) -o hpna

lorex_test: lorex_test.o lorex.o
	$(LD) lorex_test.o lorex.o -o lorex_test

install: hpna
	strip ./hpna
	cp hpna ${INSTALL_DIR}
	chmod 755 ${INSTALL_DIR}/hpna

clean:
	rm -rf ${OBJS} hpna
