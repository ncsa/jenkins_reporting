#!/bin/bash
# This script counts SUCCESS and FAILURE in the jenkins logs for 
# tests in a jenkins jobs/ directory and reports % success per test.
#
# outputs: testname , success_rate  # for (up to) the last 100 tests
#
# example run with partial output:
#
# [arnoldg@hydro jenkins_reporting]$ ./success_fail.sh ./jenkins_jobs
# TESTNAME , PERCENT_SUCCESSFUL (last 100 tests)
# awp-odc-spp , 70.83
# awp-odc-spp-jyc , 100.00
# awp-odc-topomapping , 100.00
# bwpy-eslogins , 100.00
# bwpy-python , 100.00
# BW_Scheduler_Paused , 100.00
# Cactus , 57.14
#
#
# Galen Arnold, April 2022, NCSA

INITIAL_DIR=`pwd`
if [ -z "$1" ]
then
   echo usage: $0: path/to/jenkins/jobs
   exit
fi
JENKINS_DIR=$1

cd $JENKINS_DIR
# in the case $JENKINS_DIR was a symbolic link, reset it here
JENKINS_DIR=$PWD

echo "TESTNAME , PERCENT_SUCCESSFUL (last 100 tests)"
sleep 1
# for the directories in the jobs/ area
for testdir in `ls -1`
do
  if [[ -d $testdir/builds ]]
  then
     ((successes=0))
     ((failures=0))
     cd $testdir/builds
     LAST_HUNDRED_BUILDS=`ls -1 | sort -n | tail -100`
     # for each of the numbered builds under builds/
     for dir in $LAST_HUNDRED_BUILDS
     do
       if [[ -d $dir ]]
       then
          if grep SUCCESS $dir/*log >/dev/null 2>&1
          then
             ((successes++))
          fi
          if grep FAILURE $dir/*log >/dev/null 2>&1
          then
             ((failures++))
          fi
       fi
     done
     ((total=successes+failures))
     if ((total>0))
     then
       SUCCESS_RATE=`echo "scale=2;100*$successes/$total" | bc -l `
     else
       SUCCESS_RATE="null"
     fi
     echo $testdir , $SUCCESS_RATE
  fi
  cd $JENKINS_DIR
done
cd $INITIAL_DIR

exit
