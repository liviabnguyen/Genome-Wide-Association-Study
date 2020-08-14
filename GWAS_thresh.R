#!/usr/bin/env Rscript
# Manhattan and QQ plots of GEMMA results
setwd("~/desktop")

options(stringsAsFactors = F)
args = commandArgs(trailingOnly=TRUE)
args

library(pacman)
p_load(ggplot2, dplyr, tidyr, data.table)
#install.packages("tidyr")
#library(tidyr)
#install.packages("scales")
# set variables
FileName="pc3.assoc2.txt"

# set output file name 
# OutName<-unlist(strsplit(FileName, ".", fixed=T))[1]
# OutName<-paste0("../..", OutName)
  
# import data
df<-fread(FileName)

# Bonferroni threshold 
threshold <- 0.05/nrow(df)

df1 <-df[df$p_lrt < threshold,]

write.table(df1, "pc3_thresh2.txt", sep=" ", quote=F, row.names=FALSE)
