.POSIX:
.SUFFIXES:

TEX    = pdftex
INITEX = $(TEX) -enc -etex -ini
PREFIX = ${HOME}/Library/texmf
FMTDIR = $(PREFIX)/web2c
DOCDIR = $(PREFIX)/doc/plain
TEXDIR = $(PREFIX)/tex/plain

format = mplain.fmt
deps   = ec.tex u8.tex hy.tex ma.tex a4.tex fr.tex
trip   = mtrip.pdf

fmtsrc  = $(format:.fmt=.tex)
tripsrc = $(trip:.pdf=.tex)

$(format): $(fmtsrc) $(deps)
	$(INITEX) $(fmtsrc)

trip: $(trip)
test: $(trip)
doc: $(trip)

$(trip): $(tripsrc) $(format)
	$(TEX) -fmt ./$(format) $<

clean:
	rm -f $(format) *.log

distclean: clean
	rm -f $(trip)

install: $(format)
	mkdir -p $(FMTDIR)
	install -m 644 $(format) $(FMTDIR)

uninstall:
	rm -f $(FMTDIR)/$(format)

