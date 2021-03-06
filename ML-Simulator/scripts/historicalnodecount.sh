#!/bin/bash

source "config/default.conf"
mkdir logs/historicalnodecount

for count in ${historicalnodecount[@]}
do
	echo "Running experiment for:" $count
	mkdir logs/historicalnodecount/$count
	{
		echo "segmentcount=$segmentcount"
		echo "preloadsegmenr=$preloadsegment"
		echo "querycount=${querycount[0]}"
		echo "querysegmentdistribution=${querysegmentdistribution[0]}"
		echo "querysizedistribution=${querysizedistribution[0]}"
		echo "queryminsize=$queryminsize"
		echo "querymaxsize=$querymaxsize"
		echo "queryperinterval=${queryperinterval[0]}"
		echo "historicalnodecount=$count"
		echo "replicationfactor=$replicationfactor"
		echo "percentreplicate=${percentreplicate[0]}"
	} > logs/historicalnodecount/"$count"/tmp_"$count".conf

	python DynamicMain.py logs/historicalnodecount/"$count"/tmp_"$count".conf > logs/historicalnodecount/"$count"/run_"$count".log &
done

wait

echo "Completed"
