library("ChIPpeakAnno")
library("MotIV")

load("results/3rd/02denovoMotif.rdat")

## prep. database
path <- system.file(package="MotIV")
jaspar        <- readPWMfile( file.path(path, "extdata/jaspar2010.txt"))
jaspar.scores <- readDBScores(file.path(path, "extdata/jaspar2010_PCC_SWU.scores"))

## search motifs
oct4.motif.pwms <- getPWM(oct4.motif)
oct4.jaspar <- motifMatch(
  inputPWM = oct4.motif.pwms,
  align = "SWU",
  cc    = "PCC",
  database = jaspar,
  DBscores = jaspar.scores,
  top = 5
)
sox2.motif.pwms <- getPWM(sox2.motif)
sox2.jaspar <- motifMatch(
  inputPWM = sox2.motif.pwms,
  align = "SWU",
  cc    = "PCC",
  database = jaspar,
  DBscores = jaspar.scores,
  top = 5
)
save(list=ls(), file="results/3rd/03motifdbSearch.rdat")

## output results with sequence logos
pdf("results/3rd/03motifdbSearch.pdf")
plot(oct4.jaspar, ncol = 2, top = 5, rev = FALSE,
     main = "Oct4 ChIP-seq", bysim = TRUE)
plot(sox2.jaspar, ncol = 2, top = 5, rev = FALSE,
     main = "Sox2 ChIP-seq", bysim = TRUE)
dev.off()
