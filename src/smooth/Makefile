CC=c++ -g -O4 -Wall -Wno-deprecated
OBJS=
INSTALL_DIR=/usr/local/bin

all: smooth

smooth: $(OBJS) smooth.cc
	${CC} smooth.cc -o smooth $(OBJS)

install: smooth
	strip smooth
	cp smooth ${INSTALL_DIR}/
	
clean: 
	rm -rf $(OBJS) smooth
