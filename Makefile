.POSIX:
.SILENT:
.PHONY: all build clean validate


xsltproc ?= xsltproc
xmllint ?= xmllint
OUTDIR ?= registrar
srcs != find . -maxdepth 1 -name '*.xml'
html = ${srcs:./%.xml=$(OUTDIR)/%.html}
xml = ${srcs:./%.xml=$(OUTDIR)/%.xml}

all: validate build

build: $(html) $(xml)

validate:
	for srcfile in $(srcs); do \
		$(xmllint) --nonet --noout --noent --loaddtd --valid "$${srcfile}" > /dev/null; \
	done

clean:
	rm -rf "$(OUTDIR)"

$(OUTDIR):
	mkdir -p "$@"

$(html): $(OUTDIR) ${@:$(OUTDIR)/%.html=%.xml} ${@:$(OUTDIR)/%.html=%.xsl}
	$(xsltproc) --stringparam OUTPUT_FILENAME "$@" "${@:$(OUTDIR)/%.html=%.xsl}" "${@:$(OUTDIR)/%.html=%.xml}" > "$@"

$(xml): $(OUTDIR) ${@:$(OUTDIR)/%=%} ${@:$(OUTDIR)/%.xml=%-xml.xsl}
	$(xsltproc) "${@:$(OUTDIR)/%.xml=%-xml.xsl}" "${@:$(OUTDIR)/%=%}" > "$@"
