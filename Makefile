xsltproc ?= xsltproc
xmllint ?= xmllint
OUTDIR ?= registrar
srcs = $(wildcard *.xml)
html = $(patsubst %.xml,$(OUTDIR)/%.html,$(srcs))
xml = $(patsubst %.xml,$(OUTDIR)/%.xml,$(srcs))

all: validate build

build: $(html) $(xml)

validate:
	$(foreach srcfile,$(srcs),$(xmllint) --nonet --noout --noent --loaddtd --valid "$(srcfile)" > /dev/null && ) true

$(OUTDIR):
	mkdir -p "$@"

$(html): $(OUTDIR)/%.html: %.xml %.xsl | $(OUTDIR)
	$(xsltproc) --stringparam OUTPUT_FILENAME "$@" "$(patsubst %.xml,%.xsl,$<)" "$<" > "$@"

$(xml): $(OUTDIR)/%.xml: %.xml %-xml.xsl | $(OUTDIR)
	$(xsltproc) "$(patsubst %.xml,%-xml.xsl,$<)" "$<" > "$@"

clean:
	rm -rf "$(OUTDIR)"

.PHONY: all clean validate
