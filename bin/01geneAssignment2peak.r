library("ChIPpeakAnno")
data(TSS.mouse.NCBIM37)

load("results/3rd/00bed2rangedData.rdat")

sox2.anno <- annotatePeakInBatch(
  sox2.gr,
  AnnotationData = TSS.mouse.NCBIM37,
  output = "both"
)
oct4.anno <- annotatePeakInBatch(
  oct4.gr,
  AnnotationData = TSS.mouse.NCBIM37,
  output = "both"
)

write.table(
  as.data.frame(sox2.anno),
  file = "results/3rd/Sox2_peaks_anno.txt",
  row.names = F,
  col.names = T,
  quote = F,
  sep   = "\t"
)
write.table(
  as.data.frame(oct4.anno),
  file = "results/3rd/Oct4_peaks_anno.txt",
  row.names = F,
  col.names = T,
  quote = F,
  sep   = "\t"
)
save(list=ls(), file = "results/3rd/01geneAssignment2peak.rdat")
