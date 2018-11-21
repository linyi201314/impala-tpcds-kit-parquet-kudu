#!/bin/bash
for i in `ls ./*.sql` 
do
	impala-shell  -d tpcds_10000_parquet -f $i &> ./results_third/$i.out
done
