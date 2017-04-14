
pwd - present working directory
cd - change directory
cd .. - go one directory back
ls - list all files in present directory
cat - show the output of any file
mkdir - make directory
mkdir foldername - folder name



#format hadoop
bin/hdfs namenode -format

#start & stop
sbin/start-dfs.sh
sbin/start-yarn.sh
sbin/stop-yarn.sh
sbin/stop-dfs.sh

#shows all the hadoop services that are running
jps

#this means yarn is working
http://localhost:8088

# then create these folders and run them

bin/hdfs dfs -mkdir /user
bin/hdfs dfs -mkdir /user/vaishnavi

#for hive
bin/hdfs dfs -mkdir /tmp
bin/hdfs dfs -mkdir /user/hive
bin/hdfs dfs -mkdir /user/hive/warehouse
bin/hadoop fs -chmod g+w   /tmp
bin/hadoop fs -chmod g+w   /user/hive/warehouse

#create a folder where you place the input files
bin/hdfs dfs -mkdir /user/vaishnavi/q1

#copy the input files from local to q1
bin/hdfs dfs -copyFromLocal /home/vaishnavi/Documents/big_data/pg100.txt /user/vaishnavi/q1

#to run map reduce
bin/hadoop jar share/hadoop/tools/lib/hadoop-streaming-2.7.3.jar -file /home/vaishnavi/Documents/big_data/mapper.py    -mapper /home/vaishnavi/Documents/big_data/mapper.py -file /home/vaishnavi/Documents/big_data/reducer.py   -reducer /home/vaishnavi/Documents/big_data/reducer.py -input q1 -output q1-output

#to view the output
bin/hdfs dfs -ls q1-output #shows the files in the output folder

#to see the output
bin/hdfs dfs -cat q1-output/part-00000 #enter filename from output folder at the end

#copy from hdfs to local folders
bin/hdfs dfs -get q1-output q1-solutions


##############  problem 2 joining tables
# manually run q1 on shell
export map_input_file=page_view.txt
echo | cat page_view.txt | /home/vaishnavi/Documents/big_data/mapperq3.py > tmp.txt
export map_input_file=user.txt
echo | cat user.txt | /home/vaishnavi/Documents/big_data/mapperq3.py >> tmp.txt
echo | cat tmp.txt | /home/vaishnavi/Documents/big_data/reducerq3.py




# Set the environment variables (modify to your directories)
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/jre/bin/java

export HIVE_HOME=/home/vaishnavi/Documents/apache-hive-1.2.1-bin
export PATH=$HIVE_HOME/bin:$PATH

export HADOOP_HOME=/home/vaishnavi/Documents/hadoop-2.7.3
export PATH=$HADOOP_HOME/bin:$PATH




# first cd too the hadoop folder

# make the mapper and reducer file as executable

chmod +x /home/vaishnavi/Documents/big_data/reducer.py
chmod +x /home/vaishnavi/Documents/big_data/mapper.py


# everytime u restart ... u have to format the hadoop file systems

bin/hdfs namenode -format


# start the hadoop file system

sbin/start-dfs.sh

# start yarn

sbin/start-yarn.sh



copy from local to hdfs
bin/hdfs dfs -copyFromLocal /home/vaishnavi/Documents/big_data/pg100.txt /user/vaishnavi/q1

# see the output in hadoop file system

bin/hadoop fs -cat gutenberg-output-alpha/part-00000


# To run the mapreduce ... run this command from hadoop folder

bin/hadoop jar share/hadoop/tools/lib/hadoop-streaming-2.7.3.jar -file /home/vaishnavi/Documents/big_data/mapper.py    -mapper /home/vaishnavi/Documents/big_data/mapper.py -file /home/vaishnavi/Documents/big_data/reducer.py   -reducer /home/vaishnavi/Documents/big_data/reducer.py -input gutenberg -output gutenberg-output-alpha


# run hive command line

$HIVE_HOME/bin/hive


#################################################
# create a empty table

CREATE EXTERNAL TABLE IF NOT EXISTS PAGE_VIEW_tmp(
page_id INT,
user_id INT,
time VARCHAR(10))
COMMENT 'Page view data'
ROW FORMAT DELIMITED
FIELDS TERMINATED BY '\t'
STORED AS TEXTFILE
tblproperties ("skip.header.line.count"="1");

# See the table

SELECT * FROM PAGE_VIEW_tmp;


# assuming that the data is in hdfs folder /user/vaishnavi/q3

load data inpath '/user/vaishnavi/q3/page_view.txt' into table PAGE_VIEW_tmp;


# now create the table ------- not needed

CREATE TABLE IF NOT EXISTS PAGE_VIEW(
page_id INT,
user_id INT,
time TIMESTAMP)
COMMENT 'Page view data'
ROW FORMAT DELIMITED
FIELDS TERMINATED BY '\t'
STORED AS ORC;


INSERT OVERWRITE TABLE mycars SELECT * FROM cars;



#################################################
# create a empty table user_id	age	gender

CREATE EXTERNAL TABLE IF NOT EXISTS USER_T(
user_id INT,
age INT,
gende VARCHAR(10))
COMMENT 'user data'
ROW FORMAT DELIMITED
FIELDS TERMINATED BY '\t'
STORED AS TEXTFILE
tblproperties ("skip.header.line.count"="1");


load data inpath '/user/vaishnavi/q3/user.txt' into table USER_T;

# See the table

SELECT * FROM USER_tmp;


# join using HIVE sql
SELECT P.page_id,U.age FROM PAGE_VIEW_tmp as P LEFT JOIN USER_tmp as U ON P.user_id=U.user_id;
