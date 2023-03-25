#! /usr/bin/python
import sys
from operator import itemgetter

reducer_keys = {}

for line in sys.stdin:
    line = line.strip()
    reducer_key, count = line.split('\t')
    current = reducer_keys.get(reducer_key, 0)
    try:
        reducer_keys[reducer_key] = current + int(count)
    except ValueError:
        pass

sorted_dict = sorted(reducer_keys.items(), key=itemgetter(1),  reverse=True)
n = 0
for sorted_key, count in sorted_dict[:10]:
    if n < 10:
        print('{}\t{}'.format(sorted_key, count))
        n =+ 1
    else:
        break
