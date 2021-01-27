---
title: "Week3Communicating Results"
author: "Pablo Velásquez"
date: "27/1/2021"
output: 
  html_document: 
    keep_md: yes
---
**WEEK3**
==============
**Communicating Results**
======================

Early results ---- presents via email 

## Hirarchy of information 

* Title
* abstract
* Body/Results
* supplementary Materials
* Code --------- Really gory details

## Email Presentation -- generic template = many levels of detail

* Subject = Title
* Email Body  -- context, summarize findings -- suggest course of  action -- yes no question 
* Attachment -> R markdown
* Supplementary Materials -  Code - GitHub



**R Pubs**
======================

interesting!

**Reproducibility Check List**
=============================


* Start With Good Science
* **Don’t Do Things By Hand** (dont modify the data in excel!)
* Don’t Point And Click (spss)
* **DO**: Teach a Computer
* **DO**: Use Some Version Control - (add small chunks - dont a massive commit)
* **DO**: Keep Track of Your Software Environment

```r
sessionInfo()
```
* **DO**: Don’t Save Output --- Better to save the inputs and code that were used to create a given piece of output rather than save the output itself.
* **DO**: Think About the Entire Pipeline



Here is the basic reproducibility check list:     
* Are we doing good science?      
* Was any part of this analysis done by hand?If so, are those parts precisely document? Does the documentation match reality?    
* Have we taught a computer to do as much as possible (i.e. coded)?  
* Are we using a version control system?   
* Have we documented our software environment?   
* Have we saved any output that we cannot reconstruct from original data + code?    
* How far back in the analysis pipeline can we go before our results are no longer (automatically) reproducible?  











