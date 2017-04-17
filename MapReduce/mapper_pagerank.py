#!/usr/local/bin/python2.7

from __future__ import division
import sys
import re
import os

filename = os.getenv('map_input_file')

for line in sys.stdin:
	# remove leading and trailing whitespace
	line = line.strip()
	if len(line.replace(' ',''))==0:
		continue

	# split the line into words
	words = line.split('\t')
	nodeID=words[0]
	
	nodePRLINKS=words[1].split('_')
	
	nodePR=float(nodePRLINKS[0])
	nodeLINKS=nodePRLINKS[1].split(',')
	
	p=nodePR/len(nodeLINKS)
	
	# send the line
	print '%03d\t%s' % (int(words[0]), words[1])
	
	for adj in nodeLINKS:
		print '%03d\t%s*_*' % (int(adj), p)
			
			
