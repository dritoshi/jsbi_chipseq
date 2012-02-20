library("rGADEM")
library("BSgenome.Mmusculus.UCSC.mm9")

oct4.seqs  <- read.DNAStringSet("results/3rd/oct4.peaksWithSeqs.fa", "fasta")
oct4.motif <- GADEM(oct4.seqs, verbose=1, genome = Mmusculus)

sox2.seqs  <- read.DNAStringSet("results/3rd/sox2.peaksWithSeqs.fa", "fasta")
sox2.motif <- GADEM(sox2.seqs, verbose=1, genome = Mmusculus)

save(list=ls(), file = "results/3rd/02denovoMotif.rdat")
