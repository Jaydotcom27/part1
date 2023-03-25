#!/usr/bin/env python
# coding: utf-8
#!/usr/bin/python3

import sys
import re
value = re.compile('[^\s]{4}[A|P]')

for line in sys.stdin:
  line=line.strip(',').split(',')
  line_len = len(line)
  if line_len ==43:
    time = line[19]
    time_value = value.search(time)
    if time_value:
      time=time[:2]+time[-1:]
      print('%s\t%s' % (time, 1))
  else:
      continue