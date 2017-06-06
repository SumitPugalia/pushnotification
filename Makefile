ERLC=/usr/bin/erlc
ERLCFLAGS=-o
SRCDIR=./src
BEAMDIR=./ebin

all: 
	$(ERLC) $(ERLCFLAGS) $(BEAMDIR) $(SRCDIR)/*.erl 

