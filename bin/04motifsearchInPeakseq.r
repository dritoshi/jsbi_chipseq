library("ChIPpeakAnno")
library("MotIV")

load("results/3rd/03motifdbSearch.rdat")

oct4.motif.pwms <- getPWM(oct4.motif)

oct4.motif.search.fwd <- lapply(
  oct4.seqs,
  function(x) {
    matchPWM(oct4.motif.pwms$m1, x)
  }
)
oct4.motif.search.rev <- lapply(
  oct4.seqs,
  function(x) {
    matchPWM(reverseComplement(oct4.motif.pwms$m1), x)
  }
)
oct4.motif.search.fwd.score <- lapply(
  oct4.motif.search.fwd,
  function(hits) {
    PWMscoreStartingAt(
      oct4.motif.pwms$m1,
      subject(hits),
      start(hits)
    )
  }
)
oct4.motif.search.rev.score <- lapply(
  oct4.motif.search.rev,
  function(hits) {
    PWMscoreStartingAt(
      reverseComplement(oct4.motif.pwms$m1),
      subject(hits),
      start(hits)
    )
  }
)

sox2.motif.pwms <- getPWM(sox2.motif)

sox2.motif.search.fwd <- lapply(
  sox2.seqs,
  function(x) {
    matchPWM(sox2.motif.pwms$m1, x)
  }
)
sox2.motif.search.rev <- lapply(
  sox2.seqs,
  function(x) {
    matchPWM(reverseComplement(sox2.motif.pwms$m1), x)
  }
)
sox2.motif.search.fwd.score <- lapply(
  sox2.motif.search.fwd,
  function(hits) {
    PWMscoreStartingAt(
      sox2.motif.pwms$m1,
      subject(hits),
      start(hits)
    )
  }
)
sox2.motif.search.rev.score <- lapply(
  sox2.motif.search.rev,
  function(hits) {
    PWMscoreStartingAt(
      reverseComplement(sox2.motif.pwms$m1),
      subject(hits),
      start(hits)
    )
  }
)

save(list = ls(), file = "results/3rd/04motifsearchInPeakseq.rdat")
