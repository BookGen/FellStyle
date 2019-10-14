#!/usr/bin/env python3

from panflute import *
from helper import *
from datetime import datetime, timezone
from collections import OrderedDict
import re

def defines(doc):
	result = [RawInline('% FellStyle Metadata %', format='latex')]
	for name, command in [
		('FellStyle.publicationdetails', 'publicationdetailsinfo'),
	]:
		value = []
		data = doc.get_metadata(name, builtin=False)
		if isinstance(data, MetaList):
			for item in data:
				value.extend(content.inlines(item, doc))
		else:
			value.extend(content.inlines(data, doc))
		result.extend([
			RawInline('\n\\renewcommand{\\' + command + '}', format='latex'),
			Span(*value)
		])
	return result

def prepare(doc):
	pass

def action(elem, doc):
	pass

def finalize(doc):
	if doc.format == 'latex':
		header_includes = doc.get_metadata('header-includes', MetaBlocks(), builtin=False)
		if isinstance(header_includes, MetaInlines):
			header_includes = MetaBlocks(Plain(*header_includes.content))
		elif isinstance(header_includes, MetaString):
			header_includes = MetaBlocks(Plain(Str(header_includes.text)))
		elif not isinstance(header_includes, MetaBlocks):
			header_includes = MetaBlocks()
		header_includes.content.append(Plain(*defines(doc)))
		doc.metadata['header-includes'] = header_includes

def main(doc=None):
	return run_filter(action, doc=doc, prepare=prepare, finalize=finalize)

if __name__ == '__main__':
	main()