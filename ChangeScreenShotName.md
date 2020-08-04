```
i=1
ls -rt *.png | while read LINE
do
  echo $i
  echo $LINE
  mv "$LINE" $i.png
  i=$((i+1))
done
```