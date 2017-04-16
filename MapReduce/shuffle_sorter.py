#!/usr/local/bin/python2.7

from operator import itemgetter
import sys
import ast
S=[]
# input comes from STDIN
for line in sys.stdin:
    line = line.strip()
    key, value = line.split('\t')
    S.append([key,value])


S.sort(key =lambda x: x[0])

for s in S:
    print '%s\t%s' % (s[0], s[1])   
