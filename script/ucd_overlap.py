#!/usr/bin/env python
from collections import defaultdict
import json
import re
import sys

CHARACTERS = defaultdict(list)

CLASS_RE = re.compile(r'(?P<start>[0-9A-F]{4,5})(\.\.(?P<end>[0-9A-F]{4,5}))?\s+;\s*(?P<class>\w+)\s*#\s(?P<comment>.+)$')

# classes I don't care about since they are unused in our break algorithm.
do_not_care = ['Emoji', 'Emoji_Presentation', 'Emoji_Modifier_Base', 'Emoji_Component', 'Emoji_Modifier']

for line in sys.stdin.read().split('\n'):
    out = CLASS_RE.match(line)
    if out is None:
        continue

    data = out.groupdict()

    if data['class'] in do_not_care:
        continue

    if data['end'] is not None:
        for i in range(int(data['start'], 16), int(data['end'], 16) + 1):
            CHARACTERS[i].append(data['class'])
    else:
        CHARACTERS[int(data['start'], 16)].append(data['class'])

for (char, classes) in CHARACTERS.items():
    if len(classes) != 1:
        print('{} is a member of {} classes: {}'.format(
            hex(char),
            len(classes),
            ', '.join(classes)
        ))
