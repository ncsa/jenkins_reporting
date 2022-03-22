## Table of contents
* [Introduction](#Introduction)
* [Requirements](#Requirements)
* [Examples](#Examples)

## Introduction
Files in this repo can be used with the Jenkins test data under /var/lib/jenkins/jobs/  (typically).
The scripts generate summary or individual reports for a test(s).

The first example script generates a plot from the .csv file(s) in a test/ directory.

## Requirements:  
* X11  
* Imagemagick loaded in the environment (display a pdf )
## Examples: 
jtest_csv_report.py: Generate and view a plot from a test/<filename.csv> .
```
jtest_csv_report.py <filename.csv>
```
