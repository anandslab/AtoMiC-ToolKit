#!/bin/bash
# Script Name: AtoMiC Python Dependency config Script

if [[ $APPNAME = 'python3' ]]; then
    APPDEPS='python3-pip python3-dev python3-setuptools python-setuptools-doc python3-wheel libssl-dev libffi-dev'
    APPPIPS='portend cheroot tempora more-itertools pytz cherrypy psutil cffi enum34 asn1crypto idna six ipaddress pycparser chardet urllib3 pycparser markdown asn1crypto pyasn1 lxml setuptools regex certifi cryptography pyopenssl requests[security]'
else
    APPDEPS='python-pip python-dev python-setuptools python-setuptools-doc python-wheel python-imaging libssl-dev libffi-dev'
    APPPIPS='portend cheroot tempora more-itertools pytz cherrypy psutil cffi enum34 asn1crypto idna six ipaddress pycparser chardet urllib3 pycparser markdown asn1crypto pyasn1 lxml setuptools regex certifi cheetah cryptography pyopenssl requests[security]'
fi
