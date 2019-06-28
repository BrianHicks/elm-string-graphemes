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
out.append('chars = [')

chars = []
ranges = []

for match in classes[class_]:
    if match['kind'] == 'range':
        ranges.append('List.range 0x{} 0x{} -- {}'.format(
            match['start'],
            match['end'],
            match['comment'],
        ))
    elif match['kind'] == 'single':
        chars.append('0x{} -- {}'.format(
            match['codepoint'],
            match['comment']
        ))
    else:
        print('I don\'t know how to handle a "{}"!'.format(match['kind']))
        sys.exit(1)

if chars:
    out.append('[{}\n    ]'.format('\n    ,'.join(chars)))

if chars and ranges:
    out.append(',    ')

if ranges:
    out.append('\n    ,'.join(ranges))

out.append('    ]')
out.append('    |> List.concat')
out.append('    |> List.map Char.fromCode')
out.append('    |> Set.fromList')

# write out the final result

with open(args.destination, 'w') as fh:
    fh.write('\n'.join(out))
