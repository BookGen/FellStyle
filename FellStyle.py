#!/usr/bin/env python3

from panflute import *
from helper import *

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

def footer(doc):
	result = [RawBlock('<footer id="FellStyle.footer">', format='html')]
	result.extend(metadata.blocks(doc, 'FellStyle.publicationdetails'))
	result.extend([
		Para(
			Str('Book design by '),
			Link(Str('KIBI Gô'), url='https://go.KIBI.family/'),
			Str('.')
		),
		Para(
			Str('This work was generated with '),
			Link(Str('FellStyle'), url='https://github.com/marrus-sh/FellStyle'),
			Str('+'),
			Link(Str('BookGen'), url='https://github.com/marrus-sh/BookGen'),
			Str('.')
		)
	])
	result.append(RawBlock('</footer>', format='html'))
	return result

def prepare(doc):
	pass

def action(elem, doc):
	if isinstance(elem, Header) and elem.level == 1 and doc.format in ['html', 'html5']:
		header = []
		header.extend(metadata.inlines(doc, 'series'))
		value = metadata.inlines(doc, 'title')
		if value:
			if header:
				header.append(Str(' – '))
			href = metadata.text(doc, 'homepage', metadata.text(doc, 'index'))
			if href:
				header.append(Link(*value, url=href))
			else:
				header.extend(value)
		if header:
			header =[Plain(*header)]
		header.append(elem)
		value = metadata.inlines(doc, 'publisher')
		if value:
			header.append(Plain(*value))
		header.insert(0, RawBlock('<header>', format='html'))
		header.append(RawBlock('</header>', format='html'))
		return header

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
	elif doc.format in ['html', 'html5']:
		value = metadata.text(doc, 'next')
		if (value):
			doc.content.append(Plain(Link(
				*metadata.inlines(doc, 'FellStyle.localization-next', [Str('Next Chapter.')]),
				url=value + '#BookGen.main' if value[0] == '.' else value,
				identifier='FellStyle.main.next'
			)))
		doc.content = [
			RawBlock('\n<!-- BEGIN BODY -->\n<article>', format='html'),
			Div(*doc.content, identifier='FellStyle.main'),
			RawBlock('</article>\n<!-- END BODY -->\n', format='html')
		]
		include_after = doc.get_metadata('include-after', MetaBlocks(), builtin=False)
		if isinstance(include_after, MetaInlines):
			include_after = MetaBlocks(Plain(*header_includes.content))
		elif isinstance(include_after, MetaString):
			include_after = MetaBlocks(Plain(Str(header_includes.text)))
		elif not isinstance(include_after, MetaBlocks):
			include_after = MetaBlocks()
		include_after.content.extend(footer(doc))
		doc.metadata['include-after'] = include_after


def main(doc=None):
	return run_filter(action, doc=doc, prepare=prepare, finalize=finalize)

if __name__ == '__main__':
	main()