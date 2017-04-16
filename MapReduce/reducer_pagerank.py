#!/usr/local/bin/python2.7
from __future__ import division
import sys
import re
import os

filename = os.getenv('map_input_file')

d=0.851
p=0
L1=''
L2=''
L3=''
currrent_key=None

for line in sys.stdin:
    # remove leading and trailing whitespace
    line = line.strip()
    if len(line.replace(' ',''))==0:
        continue

    # split the line into words
    key=line.split('\t')[0]

    if currrent_key is None:
        currrent_key=key

    if currrent_key!=key:
        N=len(L3.split(','))
        L2=str( (1-d)/N+d*p )
        print L1+'\t'+L2+'_'+L3
        p=0
        L1=''
        L2=''
        L3=''
        currrent_key=key

    if '*_*' in line:
    	line=line.replace('*_*','')
    	words=line.split('\t')
    	adjID=words[0]
    	PR=float(words[1])
    	p=p+PR
    else:
    	final_line=line		
        L1=final_line.split('\t')[0]
        L2 =final_line.split('\t')[1].split('_')[0]
        L3 =final_line.split('\t')[1].split('_')[1]
        N=len(L3.split(','))

L2=str( (1-d)/N+d*p )
print L1+'\t'+L2+'_'+L3



