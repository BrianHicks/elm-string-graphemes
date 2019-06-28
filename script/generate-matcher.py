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
out.append('import String.Segmentation.RangeSet as RangeSet exposing (RangeSet)')
out.append('import String.Segmentation.RangeSet.Range as Range')
out.append('parser : Parser ()')
out.append('parser = Parser.chompIf (\c -> RangeSet.member c chars)')

# CHARS

out.append('chars : RangeSet Char')
out.append('chars = RangeSet.fromList [')


def elm_char(codepoint):
    return "'\\u{%s}'" % codepoint


for (i, match) in enumerate(classes[class_]):
    if match['kind'] == 'range':
        code = 'Range.range {} {}'.format(
            elm_char(match['start']),
            elm_char(match['end']),
        )
    elif match['kind'] == 'single':
        code = 'Range.point {}'.format(
            elm_char(match['codepoint']),
        )
    else:
        print('I don\'t know how to handle a "{}"!'.format(match['kind']))
        sys.exit(1)

    out.append('    {}{} -- {}'.format(
        ',' if i > 0 else '',
        code,
        match['comment'],
    ))

out.append('    ]')

# write out the final result

with open(args.destination, 'w') as fh:
    fh.write('\n'.join(out))
