#!/bin/bash

for i in `seq 1 4 24`; do
   imageList=""
   for((a=$i;a < $i+4;a++))
      do
        imageList="$imageList $a"
    done
	sbatch swarm.sh $imageList
done
