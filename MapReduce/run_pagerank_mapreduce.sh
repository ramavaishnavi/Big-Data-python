#!/bin/bash          


# define all the variable
maxiter=2
export pagerankdamping="0.85"


hadoopstreamingjar="/usr/lib/hadoop-0.20-mapreduce/contrib/streaming/hadoop-streaming-2.6.0-mr1-cdh5.8.0.jar"
pythoncode_dir="/home/cloudera/Documents/Big-Data-python/MapReduce"
mapperfile="/home/cloudera/Documents/Big-Data-python/MapReduce/mapper_pagerank.py"
reducerfile="/home/cloudera/Documents/Big-Data-python/MapReduce/reducer_pagerank.py"

inputfolder="/user/cloudera/pagerank"
outputfolder="/user/cloudera/pagerank-out"

inputfilename="input_pagerank.txt"

# make the codes executable
chmod -R +x $pythoncode_dir

# delete the output folder
/usr/bin/hadoop fs -rm -r $outputfolder
/usr/bin/hadoop fs -rm -r $inputfolder

# Make directories
/usr/bin/hadoop fs -mkdir $inputfolder
#/usr/bin/hadoop fs -mkdir $outputfolder


# copy the starting inputfile to hdfs
/usr/bin/hadoop fs -copyFromLocal $pythoncode_dir/$inputfilename $inputfolder


for i in `seq 1 $maxiter`;
do

#run the streaming code
/usr/bin/hadoop jar $hadoopstreamingjar  -file $mapperfile -mapper $mapperfile -file $reducerfile -reducer $reducerfile -input $inputfolder -output $outputfolder -cmdenv pagerankdamping=$pagerankdamping



if [ $i != $maxiter ]; then

	# delete original inputfile and move the output of the first mapreduce to the input folder
	/usr/bin/hadoop fs -rm $inputfolder/$inputfilename
	/usr/bin/hadoop fs -mv $outputfolder/part-00000 $inputfolder/$inputfilename

	# delete the output folder
	/usr/bin/hadoop fs -rm -r $outputfolder
fi

done    


/usr/bin/hadoop fs -cat $outputfolder/part-00000

#/usr/bin/hadoop fs -cat /user/cloudera/pagerank-out/input_pagerank.txt