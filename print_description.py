#!/usr/bin/env python3
# Print the test description from a jenkins config.xml file for a given test.
#
# http://makble.com/how-to-parse-xml-with-python-and-lxml

from lxml import etree

path = './config.xml'

doc = etree.parse(path)
print(doc.findtext('description'))

