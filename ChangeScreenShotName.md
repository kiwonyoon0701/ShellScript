```
i=1
ls -rt *.png | while read LINE
do
  #echo $i
  #echo $LINE
  mv "$LINE" $i.png
  i=$((i+1))
done
```

kiwony@kiwonymac.com:/Users/kiwony/Documents/GitHub/SwingBench/temp> ll *.png
total 912
drwxr-xr-x   8 kiwony  1896053708    256 Aug  4 21:56 ..
-rw-r--r--@  1 kiwony  1896053708  50736 Aug  4 21:56 Screen Shot 2020-08-04 at 20.44.21.png
-rw-r--r--@  1 kiwony  1896053708  49350 Aug  4 21:56 Screen Shot 2020-08-04 at 20.44.30.png
-rw-r--r--@  1 kiwony  1896053708  45885 Aug  4 21:56 Screen Shot 2020-08-04 at 20.45.07.png
-rw-r--r--@  1 kiwony  1896053708  66714 Aug  4 21:56 Screen Shot 2020-08-04 at 20.47.51.png
-rw-r--r--@  1 kiwony  1896053708  53523 Aug  4 21:56 Screen Shot 2020-08-04 at 20.53.47.png
-rw-r--r--@  1 kiwony  1896053708  61690 Aug  4 21:56 Screen Shot 2020-08-04 at 20.54.02.png
-rw-r--r--@  1 kiwony  1896053708  59108 Aug  4 21:56 Screen Shot 2020-08-04 at 20.55.30.png
-rw-r--r--@  1 kiwony  1896053708  51020 Aug  4 21:56 Screen Shot 2020-08-04 at 20.55.48.png

kiwony@kiwonymac.com:/Users/kiwony/Documents/GitHub/SwingBench/temp> ./a.sh
Screen Shot 2020-08-04 at 20.44.21.png
Screen Shot 2020-08-04 at 20.44.30.png
Screen Shot 2020-08-04 at 20.45.07.png
Screen Shot 2020-08-04 at 20.47.51.png
Screen Shot 2020-08-04 at 20.53.47.png
Screen Shot 2020-08-04 at 20.54.02.png
Screen Shot 2020-08-04 at 20.55.30.png
Screen Shot 2020-08-04 at 20.55.48.png
kiwony@kiwonymac.com:/Users/kiwony/Documents/GitHub/SwingBench/temp> ll *.png
total 912
drwxr-xr-x   8 kiwony  1896053708    256 Aug  4 21:56 ..
-rw-r--r--@  1 kiwony  1896053708  50736 Aug  4 21:56 1.png
-rw-r--r--@  1 kiwony  1896053708  49350 Aug  4 21:56 2.png
-rw-r--r--@  1 kiwony  1896053708  45885 Aug  4 21:56 3.png
-rw-r--r--@  1 kiwony  1896053708  66714 Aug  4 21:56 4.png
-rw-r--r--@  1 kiwony  1896053708  53523 Aug  4 21:56 5.png
-rw-r--r--@  1 kiwony  1896053708  61690 Aug  4 21:56 6.png
-rw-r--r--@  1 kiwony  1896053708  59108 Aug  4 21:56 7.png
-rw-r--r--@  1 kiwony  1896053708  51020 Aug  4 21:56 8.png
-rwxr--r--   1 kiwony  1896053708     99 Aug  4 22:02 a.sh
drwxr-xr-x  11 kiwony  1896053708    352 Aug  4 22:02 .