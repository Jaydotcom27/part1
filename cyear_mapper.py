#! /usr/bin/python
import sys
import csv

header = sys.stdin.readline()

for line in csv.reader(sys.stdin, quotechar='"'):
    year = line[35] 
    print('{}\t{}'.format(year, 1))
