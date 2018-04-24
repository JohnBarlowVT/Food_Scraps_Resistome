---
title: "made4 Multivariate analysis of microarray data"
author: "John Barlow"
date: "April 23, 2018"
output: 
  html_document:
    highlight: tango
    theme: united
    keep_md: yes
    self_contained: no
    thumbnails: no
    #readthedown rmdformat alternative html_clean
---
## references: 

I used the following resources to learn about using made4

1. Bioconductor made4 

[https://www.bioconductor.org/packages/release/bioc/html/made4.html](https://www.bioconductor.org/packages/release/bioc/html/made4.html)
[http://www.bioconductor.org/packages//2.7/bioc/vignettes/made4/inst/doc/introduction.pdf](http://www.bioconductor.org/packages//2.7/bioc/vignettes/made4/inst/doc/introduction.pdf)

2. Culhane AC, Thioulouse J, Perriere G, Higgins DG.(2005) MADE4: an R package for multivariate analysis of gene expression data. Bioinformatics 21(11):2789-90.
note the introduction and reference manual can be opened from within R 

"made4 is useful for Multivariate data analysis and graphical display of microarray data. Functions include between group analysis and coinertia analysis. It contains functions that require ade4 package."

##before the preliminaries

recent versions of made4 and associated packages were built under R version 3.4.4, so like me you might need to upgrade from an older R version or else when you download made4 it will throw a warning message - I don't know if updating was absolutely necessary, but I did not chance it as my last R update was about 6 months old

I found a package to make the process of upgrading R a bit easier - the installr package - it seemed to work well and included an option to upgrade packages when it ran

you need to run installr in the R Gui console, not from R studio
here is a link on updating R with installr

[ttp://bioinfo.umassmed.edu/bootstrappers/bootstrappers-courses/courses/rCourse/Additional_Resources/Updating_R.html](http://bioinfo.umassmed.edu/bootstrappers/bootstrappers-courses/courses/rCourse/Additional_Resources/Updating_R.html)

you can install the installr package from RStudio

```r
#install.packages("installr")
```
then close RStudio and open RGui
in RGui open the installr library and run updateR

```r
#library(installr)
#updateR()
```

## the preliminaries

download made4 package - made4 package uses ade4 package, scatterplot3d package, RColorBrewer and gplots

once your R version is up to date, then on to the preliiminaries of installing made4 and associated packages - ade4 and scatterplot3d appear to install automatically when you install made4

```r
#install.packages("made4")
```

Korin suggests one needs to install made4 as below from the biocLite not via install packages, but install packages seemed to work for me (although it loaded an older version and to get the most recent version I had to download direct from the made4 bioconductor site


