#!/usr/bin/env python
import argparse
import re
import sys
import textwrap

parser = argparse.ArgumentParser()
parser.add_argument('destination')
args = parser.parse_args()

module = args.destination[len('tests/'):-len('.elm')].replace('/', '.')

out = []
out.append('module {} exposing (spec)'.format(module))

out.append('{-| Hey, this module was generated automatically. Please don\'t edit it.')
out.append('')
out.append('Run `make {}` instead!'.format(args.destination))
out.append('')
out.append('-}')

out.append('import Expect')
out.append('import Test exposing (..)')
out.append('import String.Graphemes as Grapheme')

out.append('spec : Test')
out.append('spec = ')
out.append('    describe "grapheme breaks"')
out.append('        [')

tests = []

test = textwrap.dedent('''\
    test "{index}: {comment}" <|
        \\_ ->
            {start_string}
                |> Grapheme.toList
                |> Expect.equal ({end_strings})
''')

for (i, line) in enumerate(sys.stdin.read().split('\n')):
    match = re.match(r'÷\s?(?P<test>.+?)\s?÷\s?#\s+(?P<comment>.+)$', line)
    if match is None:
        continue

    data = match.groupdict()

    graphemes = []
    for part in re.split(r'\s?÷\s?', data['test']):
        graphemes.append(''.join(
            '\\u{%s}' % codepoint
            for codepoint
            in re.split(r'\s?×\s?', part)
        ))

    tests.append(test.format(
        index=i,
        comment=data['comment'],
        start_string='"{}"'.format(''.join(graphemes)),
        end_strings='[ {} ]'.format(', '.join('"{}"'.format(grapheme) for grapheme in graphemes))
    ))


out.append('\n        ,'.join(tests))
out.append('        ]')

with open(args.destination, 'w') as fh:
    fh.write('\n'.join(out))
