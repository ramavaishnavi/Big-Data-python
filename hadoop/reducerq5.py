#!/home/vaishnavi/anaconda2/bin/python

from operator import itemgetter
import sys
import ast

# current_word = None
# current_count = 02
# word = None
d = {}

# input comes from STDIN
for line in sys.stdin:
    if 'user_id' in line:
        continue



    # remove leading and trailing whitespace
    line = line.strip()
    # print "line = ",line
    # parse the input we got from mapper.py
    key, value = line.split('\t')
    # print "key = ",key
    # print "value = ",value


    value=ast.literal_eval(value)


    if key not in d.keys():
        d[key]= [value]
    else:
        d[key].append(value)



# print d

for key,L in d.items():
    for i in range(len(L)):
        # print '%s\t%s' % (L[i][0], L[i])
        if L[i][0]=="a":
            a_item = L[i]

        if L[i][0]=='g':
            g_item=L[i]


    S=[]
    for s in L:
        if s!=a_item and s!=g_item:
            S.append(s)

    for j in range(len(S)):
        print '%s\t%s\t%s\t%s' % (S[j][1], a_item[1], S[j][2], g_item[1])



            # S=[]
            # for s in L:
            #     if s!=a_item:
            #         S.append(s)
            # if S[i][0] == 'g':
            #     g_item = S[i]
            #     T = []
            #     for t in S:
            #         if t!= g_item:
            #             T.append(t)
            #
            # # L.remove(u_item)
            # # print L
            # for j in range(len(T)):
            #     print '%s\t%s\t%s' % (T[j][1], a_item[1], T[j][2], g_item[1])
