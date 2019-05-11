library(seqinr)
library(Biostrings)

rm(list=ls()) 
setwd("~/R")
seqsim <- function(seq)
{
  sink("R1/alignment.txt") ## direct R output to a file
  for(i in 1:(length(seq)-1))
  {
    n1 <- toupper(c2s(seq[[i]]))
    n2 <- toupper(c2s(seq[[i+1]]))
    globalAlign<- pairwiseAlignment(n1, n2)
    print(globalAlign)
  }
  sink()
}

seq <- read.fasta(file = 'reference.fasta')
start.time <- Sys.time()
seqsim(seq)
end.time <- Sys.time()
time.taken <- end.time - start.time
write.table(time.taken, "R1/timestamp.txt")
