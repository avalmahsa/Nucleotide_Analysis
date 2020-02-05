library("rentrez")

setwd("~/Desktop/BIOL432/Github/Rentrez")

#The variable ncbi_ids was created holding strings that seem to represent unique gene identifiers.
ncbi_ids <- c("HQ433692.1","HQ433694.1","HQ433691.1") 

#Fetching DNA sequences in fasta format by reaching cDNA sequences for those transcripts
Bburg<-entrez_fetch(db = "nuccore", id = ncbi_ids, rettype = "fasta")

Sequences = strsplit(Bburg,"\\n\\n")
print(Sequences)

Sequences<-unlist(Sequences)

header<-gsub("(^>.*sequence)\\n[ATCG].*","\\1",Sequences)
seq<-gsub("^>.*sequence\\n([ATCG].*)","\\1",Sequences)
Sequences<-data.frame(Name=header,Sequence=seq)

Sequences=gsub("\\n","",Sequences)
Sequences<-data.frame(Name=header,Sequence=seq)

write.csv(Sequences, file="Sequences.csv",row.names=FALSE)

