#!/bin/sh
# for each registry, generates HTML file
# when creating a registry, add the relevant transform here
# usage: ./all.sh

regpath=/var/www/stage.xmpp.org/registrar/

# copy index page
cp index.shtml $regpath/
# general registries
xsltproc ns-xml.xsl namespaces.xml > $regpath/namespaces.xml
xsltproc ns.xsl namespaces.xml > $regpath/namespaces.html
xsltproc features-xml.xsl stream-features.xml > $regpath/stream-features.xml
xsltproc features.xsl stream-features.xml > $regpath/stream-features.html
# JEP-0030
xsltproc categories-xml.xsl disco-categories.xml > $regpath/disco-categories.xml
xsltproc categories.xsl disco-categories.xml > $regpath/disco-categories.html
xsltproc vars-xml.xsl disco-features.xml > $regpath/disco-features.xml
xsltproc vars.xsl disco-features.xml > $regpath/disco-features.html
xsltproc nodes-xml.xsl disco-nodes.xml > $regpath/disco-nodes.xml
xsltproc nodes.xsl disco-nodes.xml > $regpath/disco-nodes.html
# JEP-0045
xsltproc mucstatus-xml.xsl mucstatus.xml > $regpath/mucstatus.xml
xsltproc mucstatus.xsl mucstatus.xml > $regpath/mucstatus.html
# JEP-0068
xsltproc formtypes-xml.xsl formtypes.xml > $regpath/formtypes.xml
xsltproc formtypes.xsl formtypes.xml > $regpath/formtypes.html
# JEP-0079
xsltproc amp-actions-xml.xsl amp-actions.xml > $regpath/amp-actions.xml
xsltproc amp-actions.xsl amp-actions.xml > $regpath/amp-actions.html
xsltproc amp-conditions-xml.xsl amp-conditions.xml > $regpath/amp-conditions.xml
xsltproc amp-conditions.xsl amp-conditions.xml > $regpath/amp-conditions.html
# JEP-0095
xsltproc si-profiles-xml.xsl si-profiles.xml > $regpath/si-profiles.xml
xsltproc si-profiles.xsl si-profiles.xml > $regpath/si-profiles.html
# JEP-0122
xsltproc xdv-datatypes-xml.xsl xdv-datatypes.xml > $regpath/xdv-datatypes.xml
xsltproc xdv-datatypes.xsl xdv-datatypes.xml > $regpath/xdv-datatypes.html
xsltproc xdv-prefixes-xml.xsl xdv-prefixes.xml > $regpath/xdv-prefixes.xml
xsltproc xdv-prefixes.xsl xdv-prefixes.xml > $regpath/xdv-prefixes.html
# JEP-0131
xsltproc shim-xml.xsl shim.xml > $regpath/shim.xml
xsltproc shim.xsl shim.xml > $regpath/shim.html
# JEP-0138
xsltproc compress-xml.xsl compress.xml > $regpath/compress.xml
xsltproc compress.xsl compress.xml > $regpath/compress.html
# JEP-0147
xsltproc querytypes-xml.xsl querytypes.xml > $regpath/querytypes.xml
xsltproc querytypes.xsl querytypes.xml > $regpath/querytypes.html
# JEP-0182
xsltproc errors-xml.xsl errors.xml > $regpath/errors.xml
xsltproc errors.xsl errors.xml > $regpath/errors.html

# END
