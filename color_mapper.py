#! /usr/bin/python
import sys
import csv

for line in csv.reader(sys.stdin, quotechar='"'):
    # Color column is at the 34th position
    color = line[33] 

    # Many entries have '99' as Registration state, just to provide some data cleaning we ignored those
    if (color):
      print('{}\t{}'.format(stcolorate, 1))


