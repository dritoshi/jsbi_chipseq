library("ChIPpeakAnno")
library("MotIV")

load("results/3rd/01peak_fa.rdat")
load("results/3rd/04motifsearchInPeakseq.rdat")

## Load summit data
oct4.sm.df <- read.table("results/macs2/Oct4_summits.bed", header=F)
sox2.sm.df <- read.table("results/macs2/Sox2_summits.bed", header=F)
oct4.sm.gr <- BED2RangedData(oct4.sm.df, header=FALSE)
sox2.sm.gr <- BED2RangedData(sox2.sm.df, header=FALSE)

## calc. distance between motif event and summit
num.peaks <- length(oct4.motif.search.fwd)
oct4.motif.summit.dist <- rep(0, num.peaks)

summit.on.peak <- start(oct4.sm.gr) - start(oct4.gr)

num.peaks <- length(oct4.motif.search.fwd)
num <- 0
oct4.motif.summit.dist <- 0
for (peak in 1:num.peaks) {
  if (! identical(start(oct4.motif.search.fwd[[peak]]), integer(0))) {
    dists <- start(oct4.motif.search.fwd[[peak]]) - summit.on.peak[peak]

    if (length(dists) == 1) {
      num <- num + 1
      oct4.motif.summit.dist[num] <- dists
    } else if (length(dists) > 1) {
      for(i in 1:length(dists)) {
        num <- num + 1
        oct4.motif.summit.dist[num] <- dists[i]
      }
    }
  }    
}

## calc. distance between motif event and summit
num.peaks <- length(sox2.motif.search.fwd)
sox2.motif.summit.dist <- rep(0, num.peaks)

summit.on.peak <- start(sox2.sm.gr) - start(sox2.gr)

num.peaks <- length(sox2.motif.search.fwd)
num <- 0
sox2.motif.summit.dist <- 0
for (peak in 1:num.peaks) {
  if (! identical(start(sox2.motif.search.fwd[[peak]]), integer(0))) {
    dists <- start(sox2.motif.search.fwd[[peak]]) - summit.on.peak[peak]

    if (length(dists) == 1) {
      num <- num + 1
      sox2.motif.summit.dist[num] <- dists
    } else if (length(dists) > 1) {
      for(i in 1:length(dists)) {
        num <- num + 1
        sox2.motif.summit.dist[num] <- dists[i]
      }
    }
  }    
}

save(list = ls(), file = "results/3rd/05motifDistribution.rdat")

pdf("results/3rd/05motifDistribution.pdf")
plot(density(oct4.motif.summit.dist), main="Oct4 / Motif distribution (m1)")
plot(density(sox2.motif.summit.dist), main="Sox2 / Motif distribution (m1)")
dev.off()
