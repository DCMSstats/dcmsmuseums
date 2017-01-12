---
title: "README"
author: "Niall Goulding"
date: "12 January 2017"
output: html_document
---

#DCMS Museums and Galleries convertor

##Intro

This package converts the Excel-based [DCMS Museums and Galleries Monthly Visits](https://www.gov.uk/government/statistical-data-sets/museums-and-galleries-monthly-visits) statisitcal release into a machine-readable CSV version that is published on GOV.UK.

##Installation

~~~~
install.packages("devtools")
library(devtools)
install_github("DCMSstats/dcmsmuseums")
~~~~

##Usage

~~~~
library(dcmsmuseums)
dcmsmuseums(input_xl,output_csv)
~~~~

Where `input_xl` is the path to the statistical release excel file, e.g.
`"C:\\Users\\firstname.lastname\\Documents\\museums\\Monthly_Museums_October_2016_Published_December_2016.xlsx"`

And where `output_csv` is the path to the CSV file you will create, e.g.
`"C:\\Users\\firstname.lastname\\Documents\\museums\\Museums_Output.csv"`





