#!/bin/sh
# for each registry, generates HTML file
# when creating a registry, add the relevant transform here
# usage: ./all.sh

regpath=$1

# copy index page
cp index.html $regpath/
# general registries
xsltproc ns-xml.xsl namespaces.xml > $regpath/namespaces.xml
xsltproc --stringparam OUTPUT_FILENAME registrar/namespaces.html ns.xsl namespaces.xml > $regpath/namespaces.html
xsltproc features-xml.xsl stream-features.xml > $regpath/stream-features.xml
xsltproc --stringparam OUTPUT_FILENAME registrar/stream-features.html features.xsl stream-features.xml > $regpath/stream-features.html
# XEP-0030
xsltproc categories-xml.xsl disco-categories.xml > $regpath/disco-categories.xml
xsltproc --stringparam OUTPUT_FILENAME registrar/disco-categories.html categories.xsl disco-categories.xml > $regpath/disco-categories.html
xsltproc vars-xml.xsl disco-features.xml > $regpath/disco-features.xml
xsltproc --stringparam OUTPUT_FILENAME registrar/disco-features.html vars.xsl disco-features.xml > $regpath/disco-features.html
xsltproc nodes-xml.xsl nodes.xml > $regpath/nodes.xml
xsltproc --stringparam OUTPUT_FILENAME registrar/nodes.html nodes.xsl nodes.xml > $regpath/nodes.html
# XEP-0045
xsltproc mucstatus-xml.xsl mucstatus.xml > $regpath/mucstatus.xml
xsltproc --stringparam OUTPUT_FILENAME registrar/mucstatus.html mucstatus.xsl mucstatus.xml > $regpath/mucstatus.html
# XEP-0068
xsltproc formtypes-xml.xsl formtypes.xml > $regpath/formtypes.xml
xsltproc --stringparam OUTPUT_FILENAME registrar/formtypes.html formtypes.xsl formtypes.xml > $regpath/formtypes.html
# XEP-0079
xsltproc amp-actions-xml.xsl amp-actions.xml > $regpath/amp-actions.xml
xsltproc --stringparam OUTPUT_FILENAME registrar/amp-actions.html amp-actions.xsl amp-actions.xml > $regpath/amp-actions.html
xsltproc amp-conditions-xml.xsl amp-conditions.xml > $regpath/amp-conditions.xml
xsltproc --stringparam OUTPUT_FILENAME registrar/amp-conditions.html amp-conditions.xsl amp-conditions.xml > $regpath/amp-conditions.html
# XEP-0095
xsltproc si-profiles-xml.xsl si-profiles.xml > $regpath/si-profiles.xml
xsltproc --stringparam OUTPUT_FILENAME registrar/si-profiles.html si-profiles.xsl si-profiles.xml > $regpath/si-profiles.html
# XEP-0122
xsltproc xdv-datatypes-xml.xsl xdv-datatypes.xml > $regpath/xdv-datatypes.xml
xsltproc --stringparam OUTPUT_FILENAME registrar/xdv-datatypes.html xdv-datatypes.xsl xdv-datatypes.xml > $regpath/xdv-datatypes.html
xsltproc xdv-prefixes-xml.xsl xdv-prefixes.xml > $regpath/xdv-prefixes.xml
xsltproc --stringparam OUTPUT_FILENAME registrar/xdv-prefixes.html xdv-prefixes.xsl xdv-prefixes.xml > $regpath/xdv-prefixes.html
# XEP-0131
xsltproc shim-xml.xsl shim.xml > $regpath/shim.xml
xsltproc --stringparam OUTPUT_FILENAME registrar/shim.html shim.xsl shim.xml > $regpath/shim.html
# XEP-0138
xsltproc compress-xml.xsl compress.xml > $regpath/compress.xml
xsltproc --stringparam OUTPUT_FILENAME registrar/compress.html compress.xsl compress.xml > $regpath/compress.html
# XEP-0147
xsltproc querytypes-xml.xsl querytypes.xml > $regpath/querytypes.xml
xsltproc --stringparam OUTPUT_FILENAME registrar/querytypes.html querytypes.xsl querytypes.xml > $regpath/querytypes.html
# XEP-0156
xsltproc altconn-xml.xsl alt-connections.xml > $regpath/alt-connections.xml
xsltproc --stringparam OUTPUT_FILENAME registrar/alt-connections.html altconn.xsl alt-connections.xml > $regpath/alt-connections.html
# XEP-0166 and friends
xsltproc jingle-apps-xml.xsl jingle-apps.xml > $regpath/jingle-apps.xml
xsltproc --stringparam OUTPUT_FILENAME registrar/jingle-apps.html jingle-apps.xsl jingle-apps.xml > $regpath/jingle-apps.html
xsltproc jingle-transports-xml.xsl jingle-transports.xml > $regpath/jingle-transports.xml
xsltproc --stringparam OUTPUT_FILENAME registrar/jingle-transports.html jingle-transports.xsl jingle-transports.xml > $regpath/jingle-transports.html
# XEP-0174
xsltproc linklocal-xml.xsl linklocal.xml > $regpath/linklocal.xml
xsltproc --stringparam OUTPUT_FILENAME registrar/linklocal.html linklocal.xsl linklocal.xml > $regpath/linklocal.html
# XEP-0182
xsltproc errors-xml.xsl errors.xml > $regpath/errors.xml
xsltproc --stringparam OUTPUT_FILENAME registrar/errors.html errors.xsl errors.xml > $regpath/errors.html

# END
