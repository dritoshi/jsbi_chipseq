library("ChIPpeakAnno")
library("BSgenome.Mmusculus.UCSC.mm9")

load("results/3rd/01findOverlappingPeaks.rdat")

oct4.sox2.overlappingPeaksWithSeqs <- getAllPeakSequence(
  oct4.sox2.overlap$MergedPeaks,
  upstream   = 0,
  downstream = 0,
  genome = Mmusculus
)
write2FASTA(oct4.sox2.overlappingPeaksWithSeqs,
            file = "results/3rd/oct4.sox2.overlappingPeaksWithSeqs.fa")
save(list=ls(), file = "results/3rd/02overlappingPeak2fa.rdat")
