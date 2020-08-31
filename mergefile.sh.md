
```
root@ip-10-100-1-108:/data/temp2# find ./original/ -type f|sort > ./filelist.txt
root@ip-10-100-1-108:/data/temp2# cat filelist.txt 
./original/201401-citibike-tripdata.csv
./original/201402-citibike-tripdata.csv
./original/201403-citibike-tripdata.csv
./original/201404-citibike-tripdata.csv
./original/201405-citibike-tripdata.csv
./original/201406-citibike-tripdata.csv
./original/201407-citibike-tripdata.csv
./original/201408-citibike-tripdata.csv
./original/201409-citibike-tripdata.csv
./original/201410-citibike-tripdata.csv
./original/201411-citibike-tripdata.csv
./original/201412-citibike-tripdata.csv


root@ip-10-100-1-108:/data/temp2# cat merge.sh 
#!/bin/bash
# i : incremental var
# j : modular var for rotating target file
# k : var for filename
function do_merge()
{
	MERGE_UNIT=$1
	DIR_NAME=$2
	
	DIR_PATH=/data/temp2/s3/$DIR_NAME
	MYFILEPATH=$DIR_PATH/file
	rm -rf $DIR_PATH
	mkdir -p $DIR_PATH

	exec<filelist.txt
	i=1
	k=1
	while read LINE
	do
		j=$((i%$MERGE_UNIT))
		if [ $j -eq 0 ]
		then
			#cat $LINE >> $MYFILEPATH$k.csv
			tail -n +2 $LINE >> $MYFILEPATH$k.csv # excludes first header line
			echo 'FILE '$LINE' merge into file'$k'.csv'
			k=$((k+1))
		else
			#cat $LINE >> $MYFILEPATH$k.csv
			tail -n +2 $LINE >> $MYFILEPATH$k.csv # excludes first header line
			echo 'FILE '$LINE' merge into file'$k'.csv'
		fi
	i=$((i+1))
	done
}

do_merge 1 file-num-12
do_merge 2 file-num-6
do_merge 4 file-num-3
do_merge 12 file-num-1

root@ip-10-100-1-108:/data/temp2#


root@ip-10-100-1-108:/data/temp2# ./merge.sh 
FILE ./original/201401-citibike-tripdata.csv merge into file1.csv
FILE ./original/201402-citibike-tripdata.csv merge into file2.csv
FILE ./original/201403-citibike-tripdata.csv merge into file3.csv
FILE ./original/201404-citibike-tripdata.csv merge into file4.csv
FILE ./original/201405-citibike-tripdata.csv merge into file5.csv
FILE ./original/201406-citibike-tripdata.csv merge into file6.csv
FILE ./original/201407-citibike-tripdata.csv merge into file7.csv
FILE ./original/201408-citibike-tripdata.csv merge into file8.csv
FILE ./original/201409-citibike-tripdata.csv merge into file9.csv
FILE ./original/201410-citibike-tripdata.csv merge into file10.csv
FILE ./original/201411-citibike-tripdata.csv merge into file11.csv
FILE ./original/201412-citibike-tripdata.csv merge into file12.csv
FILE ./original/201401-citibike-tripdata.csv merge into file1.csv
FILE ./original/201402-citibike-tripdata.csv merge into file1.csv
FILE ./original/201403-citibike-tripdata.csv merge into file2.csv
FILE ./original/201404-citibike-tripdata.csv merge into file2.csv
FILE ./original/201405-citibike-tripdata.csv merge into file3.csv
FILE ./original/201406-citibike-tripdata.csv merge into file3.csv
FILE ./original/201407-citibike-tripdata.csv merge into file4.csv
FILE ./original/201408-citibike-tripdata.csv merge into file4.csv
FILE ./original/201409-citibike-tripdata.csv merge into file5.csv
FILE ./original/201410-citibike-tripdata.csv merge into file5.csv
FILE ./original/201411-citibike-tripdata.csv merge into file6.csv
FILE ./original/201412-citibike-tripdata.csv merge into file6.csv
FILE ./original/201401-citibike-tripdata.csv merge into file1.csv
FILE ./original/201402-citibike-tripdata.csv merge into file1.csv
FILE ./original/201403-citibike-tripdata.csv merge into file1.csv
FILE ./original/201404-citibike-tripdata.csv merge into file1.csv
FILE ./original/201405-citibike-tripdata.csv merge into file2.csv
FILE ./original/201406-citibike-tripdata.csv merge into file2.csv
FILE ./original/201407-citibike-tripdata.csv merge into file2.csv
FILE ./original/201408-citibike-tripdata.csv merge into file2.csv
FILE ./original/201409-citibike-tripdata.csv merge into file3.csv
FILE ./original/201410-citibike-tripdata.csv merge into file3.csv
FILE ./original/201411-citibike-tripdata.csv merge into file3.csv
FILE ./original/201412-citibike-tripdata.csv merge into file3.csv
FILE ./original/201401-citibike-tripdata.csv merge into file1.csv
FILE ./original/201402-citibike-tripdata.csv merge into file1.csv
FILE ./original/201403-citibike-tripdata.csv merge into file1.csv
FILE ./original/201404-citibike-tripdata.csv merge into file1.csv
FILE ./original/201405-citibike-tripdata.csv merge into file1.csv
FILE ./original/201406-citibike-tripdata.csv merge into file1.csv
FILE ./original/201407-citibike-tripdata.csv merge into file1.csv
FILE ./original/201408-citibike-tripdata.csv merge into file1.csv
FILE ./original/201409-citibike-tripdata.csv merge into file1.csv
FILE ./original/201410-citibike-tripdata.csv merge into file1.csv
FILE ./original/201411-citibike-tripdata.csv merge into file1.csv
FILE ./original/201412-citibike-tripdata.csv merge into file1.csv


root@ip-10-100-1-108:/data/temp2/s3# ls -alh *
file-num-1:
total 1.5G
drwxr-xr-x 2 root root 4.0K Aug 31 14:57 .
drwxr-xr-x 6 root root 4.0K Aug 31 14:57 ..
-rw-r--r-- 1 root root 1.5G Aug 31 14:57 file1.csv

file-num-12:
total 1.5G
drwxr-xr-x 2 root root 4.0K Aug 31 14:57 .
drwxr-xr-x 6 root root 4.0K Aug 31 14:57 ..
-rw-r--r-- 1 root root  56M Aug 31 14:57 file1.csv
-rw-r--r-- 1 root root 154M Aug 31 14:57 file10.csv
-rw-r--r-- 1 root root  99M Aug 31 14:57 file11.csv
-rw-r--r-- 1 root root  75M Aug 31 14:57 file12.csv
-rw-r--r-- 1 root root  42M Aug 31 14:57 file2.csv
-rw-r--r-- 1 root root  82M Aug 31 14:57 file3.csv
-rw-r--r-- 1 root root 125M Aug 31 14:57 file4.csv
-rw-r--r-- 1 root root 162M Aug 31 14:57 file5.csv
-rw-r--r-- 1 root root 175M Aug 31 14:57 file6.csv
-rw-r--r-- 1 root root 181M Aug 31 14:57 file7.csv
-rw-r--r-- 1 root root 180M Aug 31 14:57 file8.csv
-rw-r--r-- 1 root root 176M Aug 31 14:57 file9.csv

file-num-3:
total 1.5G
drwxr-xr-x 2 root root 4.0K Aug 31 14:57 .
drwxr-xr-x 6 root root 4.0K Aug 31 14:57 ..
-rw-r--r-- 1 root root 305M Aug 31 14:57 file1.csv
-rw-r--r-- 1 root root 696M Aug 31 14:57 file2.csv
-rw-r--r-- 1 root root 502M Aug 31 14:57 file3.csv

file-num-6:
total 1.5G
drwxr-xr-x 2 root root 4.0K Aug 31 14:57 .
drwxr-xr-x 6 root root 4.0K Aug 31 14:57 ..
-rw-r--r-- 1 root root  98M Aug 31 14:57 file1.csv
-rw-r--r-- 1 root root 207M Aug 31 14:57 file2.csv
-rw-r--r-- 1 root root 337M Aug 31 14:57 file3.csv
-rw-r--r-- 1 root root 360M Aug 31 14:57 file4.csv
-rw-r--r-- 1 root root 330M Aug 31 14:57 file5.csv
-rw-r--r-- 1 root root 173M Aug 31 14:57 file6.csv

```