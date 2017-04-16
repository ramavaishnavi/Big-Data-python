# run hive command line

$HIVE_HOME/bin/hive

#################################################
# create a empty table

CREATE EXTERNAL TABLE IF NOT EXISTS PAGE_VIEW_T(
page_id INT,
user_id INT,
time VARCHAR(10))
COMMENT 'Page view data'
ROW FORMAT DELIMITED
FIELDS TERMINATED BY '\t'
STORED AS TEXTFILE
tblproperties ("skip.header.line.count"="1");

# See the table

SELECT * FROM PAGE_VIEW_T;

#No records wll be displayed

# assuming that the data is in hdfs folder /user/vaishnavi/q3

load data inpath '/user/vaishnavi/q3/page_view.txt' into table PAGE_VIEW_T;

# See the table

SELECT * FROM PAGE_VIEW_T;

#table displayed, header skipped

#################################################
# create a empty table

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

SELECT * FROM USER_T;

#all records of user table displayed with header skipped

#################################################
# join using HIVE sql
SELECT P.page_id,U.age FROM PAGE_VIEW_T as P LEFT JOIN USER_T as U ON P.user_id=U.user_id;





