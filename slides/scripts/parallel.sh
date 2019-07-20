#!/bin/bash

# 输出1到10：需要10秒
for i in $(seq 1 10)
do
  echo $i
  sleep 2
done

# 输出1到10：只需要2秒
for i in $(seq 1 10)
do
  {
    echo $i
    sleep 2
  } &
done
wait

# 输出1到100：每次输出10个数，每次输出后间隔2秒继续下一轮的输出；只需要20秒
n=10
for  ((i=0; $n*i<100; i++))
do
  for ((j=$n*i+1; j<$n*i+($n+1); j++))
  do
    {
      echo $j
      sleep 2
    } &
  done
  wait
done

while read LINE
do
  {
    echo $LINE
  } &
done < test.txt
wait
