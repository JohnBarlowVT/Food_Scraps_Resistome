# data exploration experiments using made4 package (version 1.52.0)
# made4 = Multivariate analysis of microarray data using ADE4
# code for coinertia analysis of antimicrobial resistance gene (ARGs) data from the food scraps metagenomics project
# 16april2018
#JWB

#---------------------------------------------------------
# REFERENCES: 

# I used the following resources to learn about using made4
# 1. Bioconductor made4 
# https://www.bioconductor.org/packages/release/bioc/html/made4.html
# http://www.bioconductor.org/packages//2.7/bioc/vignettes/made4/inst/doc/introduction.pdf
# 2. Culhane AC, Thioulouse J, Perriere G, Higgins DG.(2005) MADE4: an R package for multivariate analysis of gene expression data. Bioinformatics 21(11):2789-90.
# note the introduction and reference manual can be opened from within R 
#
# "made4 is useful for Multivariate data analysis and graphical display of microarray data. Functions include between group analysis and coinertia analysis. It contains functions that require ade4 package."
#---------------------------------------------------------------------

# before the preliminaries

# recent versions of made4 and associated packages were built under R version 3.4.4, so like me you might need to upgrade from an older R version or else when you download made4 it will throw a warning message - I don't know if updating was absolutely necessary, but I did not chance it as my last R update was about 6 months old...

# I found a package to make the process of upgrading R a bit easier - the installr package - it seemed to work well and included an option to upgrade packages when it ran
# preference is to run installr in the R Gui console, not from R studio
# here is a link on updating R with installr http://bioinfo.umassmed.edu/bootstrappers/bootstrappers-courses/courses/rCourse/Additional_Resources/Updating_R.html

# you can install the installr package from RStudio
install.packages("installr")
# then close RStudio and open RGui
# in RGui open the installr library and run updateR
# library(installr)
# updateR()

#----------------------------------------------------------------------
# the preliminaries

# download made4 package - made4 package uses ade4 package, scatterplot3d package, RColorBrewer and gplots

# once your R version is up to date, then on to the preliiminaries of installing made4 and associated packages - ade4 and scatterplot3d appear to install automatically when you install made4

install.packages("made4")

## Korin suggested will need to install made4 as below, not via install.packages(), but install.packages seemed to work for me (although it loaded an older version and to get the most recent version I had to download direct from the made4 bioconductor site
#source("https://bioconductor.org/biocLite.R")
#biocLite("made4")
#biocLite("BiocUpgrade")

setwd("C:/Users/jbarlow/Documents/Computational Biology/Food_Scraps/Food_Scraps_Resistome") 
getwd()

#load made4 - associated packages ade4, RColorBrewer, gplots, and scatterplot3d load automatically when you load made4
library(made4)
library (ggplot2)
library (ggthemes)
library (patchwork)

#### code from Korin - modified for graphical data exploration
#### co-inertia analysis using the made4 package
### loading ARGs file

res_mat <- read.csv("res_mat_abun2.csv")

### analysis won't run if there are instances where some of the samples have no data, i.e. the HOSP, 
### WOCA, and SWCA for ARGs all have zero abundance for ARGs, this identifies those instances to be removed later
none <- lapply(res_mat, function(x) all(x == 0))
which(none == "TRUE")

## removing them
res_mat2 <- res_mat[,-c(1,5,11,12,16,22,25)]

## need to force name column as rownames of the matrix to get the labels into the test
rownames(res_mat2) <- res_mat$Name

head(res_mat2)
## loading bacterial data

#mat <- as.data.frame(bac_mat1)
bac_mat <- read.csv("bac_mat_abun.csv")
bac_mat2 <- bac_mat[,-c(1,5,11,12,16,22,25)]
rownames(bac_mat2) <- bac_mat$Name
head(bac_mat)
head(bac_mat2)

## need to force name column as rownames of the matrix to get the labels into the test
bac_mat2 <- b_mat2[,-1]
rownames(bac_mat2) <- b_mat$Name


### loading virulence gene dataset
vf_mat <- read.csv("vf_mat_abun.csv")
vf_mat2 <- vf_mat[,-c(1,5,11,12,16,22,25)]
rownames(vf_mat2) <- vf_mat$Name
head(vf_mat2)
vf2 <- vf_abun[,-1]
rownames(vf2) <- vf_abun$Name




c <- cia(bac_mat2, res_mat2, cia.nf=2, cia.scan=FALSE, nsc=TRUE)
c$coinertia$RV
#0.445
plot.cia(c)

# virulence and ARGs
c2 <- cia(vf_mat2, res_mat2, cia.nf=2, cia.scan=FALSE, nsc=TRUE)
c2$coinertia$RV
#0.647
plot.cia(c2)


# virulence and bacteria

c3 <- cia(vf_mat2, bac_mat2, cia.nf=2, cia.scan=FALSE, nsc=TRUE)
c3$coinertia$RV
#0.358
c3$coinertia
plot.cia(c3)
# check out what the other parameters could be used for 

c4 <- cia(vf_mat, bac_mat, cia.nf=2, cia.scan=FALSE, nsc=TRUE)
c4$coinertia$RV
#0.19




