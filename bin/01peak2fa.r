library("ChIPpeakAnno")
library("BSgenome.Mmusculus.UCSC.mm9")

load("results/3rd/00bed2rangedData.rdat")

oct4.peaksWithSeqs <- getAllPeakSequence(
  oct4.gr,
  upstream   = 0,
  downstream = 0,
  genome = Mmusculus
)

sox2.peaksWithSeqs <- getAllPeakSequence(
  sox2.gr,
  upstream   = 0,
  downstream = 0,
  genome = Mmusculus
)

write2FASTA(oct4.peaksWithSeqs, file="results/3rd/oct4.peaksWithSeqs.fa")
write2FASTA(sox2.peaksWithSeqs, file="results/3rd/sox2.peaksWithSeqs.fa")
save(list=ls(), file = "results/3rd/01peak_fa.rdat")
