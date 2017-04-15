#create a folder where you place the input files

bin/hdfs dfs -mkdir /user/vaishnavi/q3

#copy the input files from local to q3

bin/hdfs dfs -copyFromLocal /home/vaishnavi/Documents/big_data/page_view.txt /user/vaishnavi/q3

bin/hdfs dfs -copyFromLocal /home/vaishnavi/Documents/big_data/user.txt /user/vaishnavi/q3

#to run map reduce

bin/hadoop jar share/hadoop/tools/lib/hadoop-streaming-2.7.3.jar -file /home/vaishnavi/Documents/big_data/mapperq3.py    -mapper /home/vaishnavi/Documents/big_data/mapperq3.py -file /home/vaishnavi/Documents/big_data/reducerq3.py   -reducer /home/vaishnavi/Documents/big_data/reducerq3.py -input q3 -output q3-output1

##to view the output

bin/hdfs dfs -ls q3-output1 #shows the files in the output folder

####to see the output

bin/hdfs dfs -cat q3-output1/part-00000 

#### to copy output

bin/hdfs dfs -get q3-output1 qq3-join-mapreduce









