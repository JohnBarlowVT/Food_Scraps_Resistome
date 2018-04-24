---
title: "figure 3 arg freq by site"
author: "JWB"
date: "April 24, 2018"
output: 
  html_document:
    highlight: tango
    theme: united
    keep_md: yes
    self_contained: no
    thumbnails: no
---
![Figure 3: ARG frequency by Site - created using ggplot2 after structuring the data using the gather function of tidyr](AGRhisto.jpg)

code for creating

```r
.<-gather(res_mat_all, key="Site", value="Abundance")
head(.)
str(.)
# note this did not generate a column with the gene names - need to append this code perhaps eventually, but really not important to see the distribution on the frequency of gene counts
# histogram on gene frequency by sites in lattice 

g1<- ggplot(data=., mapping=aes(x=Abundance,fill=I("tomato"), color=I("black"))) + geom_histogram()+ theme_minimal()
g2<- g1+facet_wrap(~Site, dir="v", nrow=2)
#ggsave(filename="AGRhisto.jpg", plot=g2, device=jpeg) #jpeg not working
ggsave(filename="AGRhisto.pdf", plot=g2, device=pdf, width=40, height=20, units="cm", dpi=300) #posted to project web page
```
