library(DFA)
file=read.csv("test/data.csv")
DFA(file,scale=2^(1/8),box_size=4,m=1)