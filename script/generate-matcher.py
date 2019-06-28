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
out.append('module {} exposing (match, parser)'.format(module))
out.append('import Parser exposing (Parser)')
out.append('parser : Parser ()')
out.append('parser = Parser.chompIf match')
out.append('match : Char -> Bool')
out.append('match char =')
out.append('    let c = Char.toCode char in')

for (i, match) in enumerate(classes[class_]):
    if match['kind'] == 'range':
        code = '(c >= {} && c <= {})'.format(match['start'], match['end'])
    elif match['kind'] == 'single':
        code = '(c == {})'.format(match['codepoint'])
    else:
        print("I don't know how to deal with a '{}' match!".format(match['kind']))
        sys.exit(1)

    out.append('    {}{}'.format(
        '|| ' if i > 0 else '',
        code,
    ))

with open(args.destination, 'w') as fh:
    fh.write('\n'.join(out))
