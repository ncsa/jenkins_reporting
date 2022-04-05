## Table of contents
* [Introduction](#Introduction)
* [Requirements](#Requirements)
* [Examples](#Examples)
## Introduction
Files in this repo can be used with the Jenkins test data under /var/lib/jenkins/jobs/  (typically).
The scripts generate summary or individual reports for a test(s).

The first example script generates a plot from the .csv file(s) in a test/ directory.
## Requirements:
* Python3 with pandas and matplotlib modules
* X11 ( optional for remote display )
* Imagemagick loaded in the environment (or other optional pdf viewer)
## Examples: 
jtest_csv_report.py: Generate and view a plot from a test/<filename.csv> .
```
jtest_csv_report.py <filename.csv>
```
Show the success rate of the last (up to 100) test jobs.

success_fail.sh <path/to/jenkins/jobs/>
```
[arnoldg@hydro jenkins_reporting]$ time ./success_fail.sh ./jenkins_jobs
TESTNAME , PERCENT_SUCCESSFUL (last 100 tests)
awp-odc-spp , 70.83
awp-odc-spp-jyc , 100.00
awp-odc-topomapping , 100.00
bwpy-eslogins , 100.00
bwpy-python , 100.00
BW_Scheduler_Paused , 100.00
Cactus , 57.14
...
```
