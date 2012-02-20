library("ChIPpeakAnno")
library(org.Mm.eg.db)

load("results/3rd/01geneAssignment2peak.rdat")

oct4.go <- getEnrichedGO(
  oct4.anno,
  orgAnn    = "org.Mm.eg.db",
  maxP      = 0.01,
  multiAdj  = TRUE,
  minGOterm = 10,
  multiAdjMethod = "BH"
)

sox2.go <- getEnrichedGO(
  sox2.anno,
  orgAnn    = "org.Mm.eg.db",
  maxP      = 0.01,
  multiAdj  = TRUE,
  minGOterm = 10,
  multiAdjMethod = "BH"
)

oct4.bp.goterm <- unique(oct4.go$bp[order(oct4.go$bp[,10]), c(2,10)])
oct4.cc.goterm <- unique(oct4.go$cc[order(oct4.go$cc[,10]), c(2,10)])
oct4.mf.goterm <- unique(oct4.go$mf[order(oct4.go$mf[,10]), c(2,10)])

sox2.bp.goterm <- unique(sox2.go$bp[order(sox2.go$bp[,10]), c(2,10)])
sox2.cc.goterm <- unique(sox2.go$cc[order(sox2.go$cc[,10]), c(2,10)])
sox2.mf.goterm <- unique(sox2.go$mf[order(sox2.go$mf[,10]), c(2,10)])

save(list=ls(), file = "results/3rd/03goAssignment2peak.rdat")
