#!/usr/bin/env python3
""" Read the .csv file from a jenkins test directory (as sys.argv[1] on the
    command line.  Plot the ["Value"] data vs the ["Build Date"] via pandas.

    -Galen Arnold, Mar 2022, NCSA
"""
import os
import sys
import tempfile
import pandas as pd
import matplotlib.pyplot as plt

tmp_pdf_file = tempfile.NamedTemporaryFile().name

mydateparser = lambda x: pd.to_datetime(x, unit='ms')

csv_file = sys.argv[1]
jenkinsdata = pd.read_csv(csv_file, skiprows=1, index_col=3,
    parse_dates=['Build Date'], date_parser=mydateparser )

print(jenkinsdata.head())
jenkinsdata["Value"].plot()

plt.savefig(tmp_pdf_file ,format="pdf")
os.system("display " + tmp_pdf_file)
os.unlink(tmp_pdf_file)
