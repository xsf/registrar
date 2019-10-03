xsltproc ?= xsltproc
OUTDIR ?= registrar
srcs = $(wildcard *.xml)
html = $(patsubst %.xml,$(OUTDIR)/%.html,$(srcs))
xml = $(patsubst %.xml,$(OUTDIR)/%.xml,$(srcs))

all: $(html) $(xml)

$(OUTDIR):
	mkdir -p "$@"

$(html): $(OUTDIR)/%.html: %.xml %.xsl $(OUTDIR)
	xsltproc --stringparam OUTPUT_FILENAME "$@" "$(patsubst %.xml,%.xsl,$<)" "$<" > "$@"

$(xml): $(OUTDIR)/%.xml: %.xml %-xml.xsl $(OUTDIR)
	xsltproc "$(patsubst %.xml,%-xml.xsl,$<)" "$<" > "$@"

clean:
	rm -rf "$(OUTDIR)"

.PHONY: all clean
