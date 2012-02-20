library("ChIPpeakAnno")

load("results/3rd/00bed2rangedData.rdat")

oct4.sox2.overlap <- findOverlappingPeaks(oct4.gr, sox2.gr, multiple=T)

save(list=ls(), file = "results/3rd/01findOverlappingPeaks.rdat")

pdf("results/3rd/01findOverlappingPeaks.pdf")
pie( table(oct4.sox2.overlap$OverlappingPeaks$overlapFeature) )
oct4.sox2.overlap.count <- makeVennDiagram(
  RangedDataList(oct4.gr, sox2.gr),
  NameOfPeaks = c("Oct4", "Sox2"),
  totalTest   = 3000,
)
dev.off()
