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
out.append('module {} exposing (chars, parser, match)'.format(module))

out.append('{-| Hey, this module was generated automatically. Please don\'t edit it.')
out.append('')
out.append('Run `make {}` instead!'.format(args.destination))
out.append('')
out.append('-}')

out.append('import Parser exposing (Parser)')
out.append('import String.Segmentation.RangeSet as RangeSet exposing (RangeSet)')
out.append('import String.Segmentation.RangeSet.Range as Range exposing (Range)')

out.append('parser : Parser ()')
out.append('parser = Parser.chompIf match')

out.append('match : Char -> Bool')
out.append('match c = RangeSet.member c chars')

# CHARS

def elm_char(codepoint):
    return "'\\u{%s}'" % codepoint

ranges = []
points = []

for (i, match) in enumerate(classes[class_]):
    if match['kind'] == 'range':
        ranges.append('({}, {}) -- {}'.format(
            elm_char(match['start']),
            elm_char(match['end']),
            match['comment'],
        ))
    elif match['kind'] == 'single':
        points.append('{} -- {}'.format(
            elm_char(match['codepoint']),
            match['comment'],
        ))
    else:
        print('I don\'t know how to handle a "{}"!'.format(match['kind']))
        sys.exit(1)

out.append('chars : RangeSet Char')
if ranges and points:
    out.append('chars = RangeSet.fromList (points ++ ranges)')
elif ranges:
    out.append('chars = RangeSet.fromList ranges')
elif points:
    out.append('chars = RangeSet.fromList points')
else:
    out.append('chars = Debug.todo "no chars for this class! What?"')

if points:
    out.append('points : List (Range Char)')
    out.append('points = List.map Range.point [')
    out.append('\n    ,'.join(points))
    out.append('    ]')

if ranges:
    out.append('ranges : List (Range Char)')
    out.append('ranges = List.map (\\(low, high) -> Range.range low high) [')
    out.append('\n    ,'.join(ranges))
    out.append('    ]')

# write out the final result

with open(args.destination, 'w') as fh:
    fh.write('\n'.join(out))
