#!/usr/bin/env python
import argparse
import json
import os.path as path
import sys

parser = argparse.ArgumentParser()
parser.add_argument('destination')
args = parser.parse_args()

classes = json.load(sys.stdin)

module = args.destination[len('src/'):-len('.elm')].replace('/', '.')
class_ = module.split('.')[-1]

if class_ not in classes:
    print('{} not in classes!'.format(class_))
    sys.exit(1)

out = []
out.append('module {} exposing (chars, parser)'.format(module))
out.append('import Parser exposing (Parser)')
out.append('import Set exposing (Set)')
out.append('parser : Parser ()')
out.append('parser = Parser.chompIf (\c -> Set.member c chars)')

# CHARS

out.append('chars : Set Char')
out.append('chars = (Set.fromList << List.concat) [')

def elm_char(hex_codepoint):
    return "'\\u{%s}'" % hex_codepoint

for (i, match) in enumerate(classes[class_]):
    if match['kind'] == 'range':
        code = 'List.map Char.fromCode (List.range 0x{} 0x{})'.format(
            match['start'],
            match['end'],
        )
    elif match['kind'] == 'single':
        code = '[ {} ]'.format(elm_char(match['codepoint']))

    out.append('    {}{} -- {}'.format(
        ', ' if i > 0 else '',
        code,
        match['comment'],
    ))

out.append('    ]')

# write out the final result

with open(args.destination, 'w') as fh:
    fh.write('\n'.join(out))
