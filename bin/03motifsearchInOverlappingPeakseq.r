library("ChIPpeakAnno")
library("MotIV")

load("results/3rd/03motifdbSearch.rdat")
oct4.sox2.overlappingPeaks.seq <- read.DNAStringSet("results/3rd/oct4.sox2.overlappingPeaksWithSeqs.fa", "fasta")

oct4.motif.pwms <- getPWM(oct4.motif)
oct4.motif.search.fwd <- lapply(
  oct4.sox2.overlappingPeaks.seq,
  function(x) {
    matchPWM(oct4.motif.pwms$m1, x)
  }
)
oct4.motif.search.rev <- lapply(
  oct4.sox2.overlappingPeaks.seq,
  function(x) {
    matchPWM(reverseComplement(oct4.motif.pwms$m1), x)
  }
)

sox2.motif.pwms <- getPWM(sox2.motif)
sox2.motif.search.fwd <- lapply(
  oct4.sox2.overlappingPeaks.seq,
  function(x) {
    matchPWM(sox2.motif.pwms$m1, x)
  }
)
sox2.motif.search.rev <- lapply(
  oct4.sox2.overlappingPeaks.seq,                                
  function(x) {
    matchPWM(reverseComplement(sox2.motif.pwms$m1), x)
  }
)

save(list = ls(), file = "results/3rd/04motifsearchInOverlappingPeakseq.rdat")
