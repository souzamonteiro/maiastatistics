library(DFA)
file1=read.csv("test/chile.csv")
file2=read.csv("test/indonesia.csv")
DCCA(file1,file2,scale=2^(1/8),box_size=4,m=1)