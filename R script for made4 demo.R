## the preliminaries

#download made4 package - made4 package uses ade4 package, scatterplot3d package, RColorBrewer and gplots

install.packages("made4")

source("https://bioconductor.org/biocLite.R")
biocLite("made4")
biocLite("BiocUpgrade")                                                                
#confirm that the 3 downloaded files are in your current working directory
getwd()
#move files into current wd or if needed set wd
#setwd("insert address for your particular wd")

#load made4 -  associated packages ade4, RColorBrewer, gplots, and scatterplot3d load automatically when you load made4
library(made4)
res_mat <- read.csv("res_mat_abun.csv")
bac_mat <- read.csv("bac_mat_abun.csv")
vf_mat <- read.csv("vf_mat_abun.csv")

#check the structure of the data files - made4 needs the abundance values to be numeric, and for some reason a number of values in our csv files are integers so these needed to be changed
str(res_mat)
str(bac_mat)
str(vf_mat)

#so clean thus up by setting all values to numeric, except not the gene names and set the row names in the data frame as the gene names
res_mat_all <- res_mat[,-c(1)]
res_mat_all[] <- lapply(res_mat_all[], as.numeric)
rownames(res_mat_all) <- res_mat$Name

#also, a number of functions throw an error if any sites have all 0 values for the abundance of observed genes e.g. the HOSP, WOCA, and SWCA for ARGs all have zero abundance for ARGs
# here is the code Korin figured out to resolve this issue
none <- lapply(res_mat_all, function(x) all(x == 0))
which(none == "TRUE")
# remove those 6 columns
res_mat2 <- res_mat_all[,-c(4,10,11,15,21,24)]
head(res_mat_all)
str(res_mat_all)

#repeat for the other 2 files
bac_mat_all <- bac_mat[,-c(1)]
bac_mat_all[] <- lapply(bac_mat_all[], as.numeric)
rownames(bac_mat_all) <- bac_mat$Name
bac_mat2 <- bac_mat_all[,-c(4,10,11,15,21,24)]
head(bac_mat2)
str(bac_mat2)

vf_mat_all <- vf_mat[,-c(1)]
vf_mat_all[] <- lapply(vf_mat_all[], as.numeric)
rownames(vf_mat_all) <- vf_mat$Name
vf_mat2 <- vf_mat_all[,-c(4,10,11,15,21,24)]
head(vf_mat2)
str(vf_mat2)

#data ready to use
#made4 has an overview function which generates a boxplot, histogram and hierachial tree of the data 
overview(res_mat_all)
