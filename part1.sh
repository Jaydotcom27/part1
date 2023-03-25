#! /bin/sh
#! /usr/bin/python
../start.sh

/usr/local/hadoop/bin/hdfs dfs -rm -r /p1/input/
/usr/local/hadoop/bin/hdfs dfs -rm -r /p1/output/
/usr/local/hadoop/bin/hdfs dfs -mkdir -p /p1/input/
/usr/local/hadoop/bin/hdfs dfs -copyFromLocal ../mapreduce-test-data/hdfstest1/nyc_parking_violations_data.csv  /p1/input/

/usr/local/hadoop/bin/hadoop jar /usr/local/hadoop/share/hadoop/tools/lib/hadoop-streaming-3.3.1.jar  \
-file hour_mapper.py -mapper hour_mapper.py \
-file reducer.py -reducer reducer.py \
-input /p1/input/* -output /p1/output/Q1/hour

# /usr/local/hadoop/bin/hadoop jar /usr/local/hadoop/share/hadoop/tools/lib/hadoop-streaming-3.3.1.jar  \
# -file day_mapper.py -mapper day_mapper.py \
# -file reducer.py -reducer reducer.py \
# -input /part1/input/* -output /part1/output/Q1/day

# /usr/local/hadoop/bin/hadoop jar /usr/local/hadoop/share/hadoop/tools/lib/hadoop-streaming-3.3.1.jar  \
# -file month_mapper.py -mapper month_mapper.py \
# -file reducer.py -reducer reducer.py \
# -input /part1/input/* -output /part1/output/Q1/month/

# /usr/local/hadoop/bin/hadoop jar /usr/local/hadoop/share/hadoop/tools/lib/hadoop-streaming-3.3.1.jar  \
# -file car_year_mapper.py -mapper car_year_mapper.py \
# -file reducer.py -reducer reducer.py \
# -input /part1/input/* -output /part1/output/Q2/year/

# /usr/local/hadoop/bin/hadoop jar /usr/local/hadoop/share/hadoop/tools/lib/hadoop-streaming-3.3.1.jar  \
# -file veh_type_mapper.py -mapper veh_type_mapper.py \
# -file reducer.py -reducer reducer.py \
# -input /part1/input/* -output /part1/output/Q2/type/

# /usr/local/hadoop/bin/hadoop jar /usr/local/hadoop/share/hadoop/tools/lib/hadoop-streaming-3.3.1.jar  \
# -file county_mapper.py -mapper county_mapper.py \
# -file reducer.py -reducer reducer.py \
# -input /part1/input/* -output /part1/output/Q3/

# /usr/local/hadoop/bin/hadoop jar /usr/local/hadoop/share/hadoop/tools/lib/hadoop-streaming-3.3.1.jar  \
# -file color_mapper.py -mapper color_mapper.py \
# -file reducer.py -reducer reducer.py \
# -input /part1/input/* -output /part1/output/Q4/

echo "************************ Q1 When are tickets most likely to be issued? **********************************" 
echo "******* By Hour **********************"
/usr/local/hadoop/bin/hdfs dfs -cat /p1/output/Q1/hour/part-00000
# echo "******* By Week Day **********************"
# /usr/local/hadoop/bin/hdfs dfs -cat /part1/output/Q1/day/part-00000
# echo "******* By Month  **********************"
# /usr/local/hadoop/bin/hdfs dfs -cat /part1/output/Q1/month/part-00000
# echo "********************* Q2 What are the most common years and types of cars to be ticketed? ************** "
# echo "******* By Year of vehicle  **********************"
# /usr/local/hadoop/bin/hdfs dfs -cat /part1/output/Q2/year/part-00000
# echo "******* By Vehicle type **************************"
# /usr/local/hadoop/bin/hdfs dfs -cat /part1/output/Q2/type/part-00000
# echo "********************* Q3 Where are tickets most commonly issued? ****************************************"
# /usr/local/hadoop/bin/hdfs dfs -cat /part1/output/Q3/part-00000
# echo "********************* Q4  Which color of the vehicle is most likely to get a ticket? ********************"
# /usr/local/hadoop/bin/hdfs dfs -cat /part1/output/Q4/part-00000
# echo " **************************************************************"
/usr/local/hadoop/bin/hdfs dfs -rm -r /p1/input/
/usr/local/hadoop/bin/hdfs dfs -rm -r /p1/output/

../stop.sh
