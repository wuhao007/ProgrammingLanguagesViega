#!/bin/bash
for i in $(seq 1 45)
do
  cp -f x${i}.cfg test.cfg
  ./imp3ada | cmp x${i}.out
done
