---
title: "Food Scraps Resistome Project"
author: "John Barlow"
date: "April 18, 2018"
output: 
  html_document:
    highlight: espresso
    keep_md: yes
    self_contained: no
    theme: simplex
---

###Exploring resistome metagenomics with R using _made4_  package
###John Barlow and Korin Eckstrom
* Email: john.barlow@uvm.edu

###Background
We recently collected shotgun metagenomics data from multiple sources on a poultry farm feeding post-consumer food waste to their chickens. The farm collects food waste from various sources (hospital and school cafeterias, nursing homes, restaurants, grocery stores) and feeds the food scraps to chickens. After the chickens feed on the food scraps the waste material enters a composting stream, and the processed compost is used for vermi-culture and the final product is sold commercially. 

Our primary objective was to characterize the presence of antimicrobial resistance genes in the food scraps and waste material across the farm system. We used culture-based and culture-independent (shotgun metagenomics) methods to identify antibiotic resistant organisms and genes in samples collected from the farm. We sampled across 13 locations (sites) within the system, including food scraps at their original source, food scraps as fed to chickens, eggs from the chickens, compost material at various stages, material in various stages of vermi-culture, and final worm castings available for commercial sale. 

A secondary objective was to explore the associations between the types of microbial genes identified by shotgun metagenomics in the samples collected from this farm. 

A challenge with these data is that there are large numbers of genes (i.e. variables observed) compared to the number of samples (e.g. sample sites), and that we generate separate tables of observed genes from alignment queries to different reference databases. We propose that this is analogous to gene expression data (e.g. microarray data) obtained across different microarray platforms. Further the data contains many "0" observations, where a gene is not observed in a particular sample (graphically explored using the attached R code).

###Data structure

The data from the shotgun metagenomics study are 3 separate dataframes, each with x identical columns and a variable number of rows. The columns are the sample sites. The rows represent different gene sequences identified in the samples.  




