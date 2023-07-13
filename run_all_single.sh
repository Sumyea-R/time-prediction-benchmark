#!/bin/bash -l
for LEARNER in xgb
do
    for DATASET_NAME in bpic2020 #credit bpic2012o bpic2012w credit helpdesk hospital invoice sepsis bpic2011 bpic2015 bpic2017 traffic_fines
    #for DATASET_NAME in 
    do
        for BUCKET_METHOD in state #cluster single prefix state
        do
            for CLS_ENCODING in agg laststate index
            do
                cd /Users/sumyea/Desktop/Study/Study/SS23/MLAPM/Code/Inter_case_aware_RTM-master/time-prediction-benchmark-master/experiments
                conda activate /Users/sumyea/Desktop/Study/Study/WS21-22/Introduction_to_Data_Science/Assignment/Part1/env
                python experiments_param_optim.py $DATASET_NAME $BUCKET_METHOD $CLS_ENCODING $LEARNER
            done
        done
    done
done
