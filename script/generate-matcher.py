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
out.append('module {} exposing (chars, match)'.format(module))
out.append('')
out.append('{-| Hey, this module was generated automatically. Please don\'t edit it.')
out.append('')
out.append('Run `make {}` instead!'.format(args.destination))
out.append('')
out.append('-}')
out.append('')
out.append('import String.Graphemes.Data as Data')
out.append('import String.Graphemes.RangeDict as RangeDict exposing (RangeDict)')
out.append('import String.Graphemes.RangeDict.Range as Range exposing (Range)')
out.append('')
out.append('')
out.append('match : Char -> Bool')
out.append('match c =')
out.append('    RangeDict.member c chars')
out.append('')
out.append('')

# CHARS

chars = []

def elm_char(char):
    if char == '\n':
        return '\\n'
    elif char == '\r':
        return '\\r'
    elif char == '"':
        return '\\"'
    elif char == '\\':
        return '\\\\'
    elif class_ == 'Control':
        return '\\u{%s}' % hex(ord(char))[2:].zfill(4)
    else:
        return char

for (i, match) in enumerate(classes[class_]):
    if match['kind'] == 'range':
        chars.append('2{}{}'.format(elm_char(match['start']), elm_char(match['end'])))
    elif match['kind'] == 'single':
        chars.append('1{}'.format(elm_char(match['codepoint'])))
    else:
        print('I don\'t know how to handle a "{}"!'.format(match['kind']))
        sys.exit(1)

out.append('chars : RangeDict Char Data.Class')
out.append('chars =')
out.append('    (Result.withDefault RangeDict.empty << Data.parser Data.{})'.format(
    class_.replace('_', ''),
))
out.append('        "{}"'.format(''.join(chars)))

# write out the final result

with open(args.destination, 'w') as fh:
    fh.write('\n'.join(out))
