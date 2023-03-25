#! /usr/bin/python
import sys
import csv

header = sys.stdin.readline()

# Type codes: --> https://data.ny.gov/api/assets/83055271-29A6-4ED4-9374-E159F30DB5AE

for line in csv.reader(sys.stdin, quotechar='"'):
    veh = line[6]
    if veh:
        print('{}\t{}'.format(veh, 1))
