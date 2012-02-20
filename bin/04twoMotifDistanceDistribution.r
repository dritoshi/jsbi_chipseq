library("ChIPpeakAnno")
library("MotIV")

load("results/3rd/04motifsearchInOverlappingPeakseq.rdat")

## calc. distance between motif event and summit
num.peaks <- length(oct4.motif.search.fwd)

num <- 0
motif.dist <- 0
for (peak in 1:num.peaks) {
  if (! identical(start(oct4.motif.search.fwd[[peak]]), integer(0))) {
    if (! identical(start(sox2.motif.search.fwd[[peak]]), integer(0))) {
      oct4 <- start(oct4.motif.search.fwd[[peak]])
      sox2 <- start(sox2.motif.search.fwd[[peak]])
      for (i in 1:length(oct4)) {
        for (j in 1:length(sox2)) {
          num <- num + 1 
          motif.dist[num] <- oct4[i] - sox2[j]
        }  
      }
    }      
  }    
}

save(list = ls(), file = "results/3rd/05twoMotifDistanceDistribution.rdat")

pdf("results/3rd/05twoMotifDistanceDistribution.pdf")
plot(density(motif.dist), main="Oct4-Sox2 / Motif distance distribution")
dev.off()
