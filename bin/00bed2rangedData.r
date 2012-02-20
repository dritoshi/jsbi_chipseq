library("ChIPpeakAnno")

sox2.df <- read.table("results/macs2/Sox2_peaks.bed", header = FALSE)
oct4.df <- read.table("results/macs2/Oct4_peaks.bed", header = FALSE)

sox2.gr <- BED2RangedData(sox2.df, header = FALSE)
oct4.gr <- BED2RangedData(oct4.df, header = FALSE)

save(list=ls(), file = "results/3rd/00bed2rangedData.rdat")
