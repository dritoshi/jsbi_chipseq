library("ChIPpeakAnno")

load("results/3rd/01geneAssignment2peak.rdat")

pdf("results/3rd/01pieInsideFeature.pdf")
pie(table(as.data.frame(sox2.anno)$insideFeature))
pie(table(as.data.frame(oct4.anno)$insideFeature))
dev.off()
