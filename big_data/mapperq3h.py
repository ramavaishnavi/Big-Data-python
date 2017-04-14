#!/home/vaishnavi/anaconda2/bin/python

import sys
import os #to get os env variables
filename = os.getenv('map_input_file')



# input comes from STDIN (standard input)




if 'page_view.txt' in filename:
	for line in sys.stdin:
		line = line.strip()
		items = line.split()


		key = items[1]
		value = ['p', items[0]]
		if 'user_id' in key:
			key='000'
		print '%s\t%s' % (key,value)

else:
	for line in sys.stdin:
		line = line.strip()
		items = line.split()

		key = items[0]
		value = ['u', items[1]]

		if 'user_id' in key:
			key='000'

		print '%s\t%s' % (key,value  )
