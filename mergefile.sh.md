```
#!/bin/bash
# i : incremental var
# j : modular var for rotating target file
# k : var for filename
exec<filelist.txt
i=1
k=1
while read LINE
do
j=$((i%2))
if [ $j -eq 0 ]
then
    cat $LINE >> file$k.csv
    echo 'FILE '$LINE' merge into file'$k'.csv'
    k=$((k+1))
else
    cat $LINE >> file$k.csv
    echo 'FILE '$LINE' merge into file'$k'.csv'
fi

i=$((i+1))
done
```

```
root@ip-10-100-1-108:/data/temp2# bash ./onefile.sh 
FILE 201401-citibike-tripdata.csv merge into file1.csv
FILE 201402-citibike-tripdata.csv merge into file1.csv
FILE 201403-citibike-tripdata.csv merge into file2.csv
FILE 201404-citibike-tripdata.csv merge into file2.csv
FILE 201405-citibike-tripdata.csv merge into file3.csv
FILE 201406-citibike-tripdata.csv merge into file3.csv
FILE 201407-citibike-tripdata.csv merge into file4.csv
FILE 201408-citibike-tripdata.csv merge into file4.csv
FILE 201409-citibike-tripdata.csv merge into file5.csv
FILE 201410-citibike-tripdata.csv merge into file5.csv
FILE 201411-citibike-tripdata.csv merge into file6.csv
FILE 201412-citibike-tripdata.csv merge into file6.csv
root@ip-10-100-1-108:/data/temp2# ll
total 3075872
drwxr-xr-x 2 root root      4096 Aug 31 08:43 ./
drwxr-xr-x 4 root root     12288 Aug 31 05:40 ../
-rw------- 1 root root     12288 Aug 31 08:43 .onefile.sh.swp
-rw-r--r-- 1 root root  58633836 Mar 27  2014 201401-citibike-tripdata.csv
-rw-r--r-- 1 root root  43899524 Mar 27  2014 201402-citibike-tripdata.csv
-rw-r--r-- 1 root root  85757372 May 13  2014 201403-citibike-tripdata.csv
-rw-r--r-- 1 root root 130951034 May 13  2014 201404-citibike-tripdata.csv
-rw-r--r-- 1 root root 169192738 Jun 22  2014 201405-citibike-tripdata.csv
-rw-r--r-- 1 root root 183131443 Sep 17  2014 201406-citibike-tripdata.csv
-rw-r--r-- 1 root root 189253575 Sep 17  2014 201407-citibike-tripdata.csv
-rw-r--r-- 1 root root 188229211 Sep 17  2014 201408-citibike-tripdata.csv
-rw-r--r-- 1 root root 183863504 Jan  2  2015 201409-citibike-tripdata.csv
-rw-r--r-- 1 root root 161314228 Jan  2  2015 201410-citibike-tripdata.csv
-rw-r--r-- 1 root root 102967304 Jan  2  2015 201411-citibike-tripdata.csv
-rw-r--r-- 1 root root  77620137 Jan  2  2015 201412-citibike-tripdata.csv
-rw-r--r-- 1 root root 102533360 Aug 31 08:43 file1.csv
-rw-r--r-- 1 root root 216708406 Aug 31 08:43 file2.csv
-rw-r--r-- 1 root root 352324181 Aug 31 08:43 file3.csv
-rw-r--r-- 1 root root 377482786 Aug 31 08:43 file4.csv
-rw-r--r-- 1 root root 345177732 Aug 31 08:43 file5.csv
-rw-r--r-- 1 root root 180587441 Aug 31 08:43 file6.csv
-rw-r--r-- 1 root root       348 Aug 31 07:54 filelist.txt

```
