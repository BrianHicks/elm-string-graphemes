#!/usr/bin/env python
from collections import defaultdict
import json
import re
import sys

SECTIONS = defaultdict(list)

CLASS_RE = re.compile(r'(?P<start>[0-9A-F]{4,5})(\.\.(?P<end>[0-9A-F]{4,5}))?\s+;\s*(?P<class>\w+)\s*#\s(?P<comment>.+)$')

for line in sys.stdin.read().split('\n'):
    out = CLASS_RE.match(line)
    if out is None:
        continue

    data = out.groupdict()

    if data['end'] is not None:
        out = {
            'kind': 'range',
            'start': data['start'],
            'end': data['end'],
        }
    else:
        out = {
            'kind': 'single',
            'codepoint': data['start'],
        }

    SECTIONS[data['class']].append(out)

json.dump(SECTIONS, sys.stdout, indent=4)
