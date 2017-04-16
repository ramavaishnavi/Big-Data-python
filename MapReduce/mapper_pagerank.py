#!/usr/local/bin/python2.7

import sys
import re
import os

filename = os.getenv('map_input_file')

alphabet = set(['a','b','c','d','e','f','g','h','i','j','k',
                'l','m','n','o','p','q','r','s','t','u','v','w','x','y','z'])
# input comes from STDIN (standard input)
for line in sys.stdin:
    # remove leading and trailing whitespace
    line = line.strip()
    # split the line into words
    # words = line.split()

    # using regex to split the words
    words = re.split('[ ,.:?!\\"\\\']+', line, flags=re.IGNORECASE)
    words = [w for w in words if w!='' and w!=' ']

    # increase counters
    for word in words:
        # word = word.replace('"','').replace('?','').replace("'",'').replace(".",'').replace(",",'').replace(":",'').replace(";",'')

        alpha = word.lower()[0]

        if alpha in alphabet:
            print '%s\t%s' % (alpha, 1)
