base_dir = Dir.pwd
$LOAD_PATH.push("#{base_dir}/lib")

require "yaml"
require "pp"

desc "Run Unit Test"
task :default => [:view_config]

param = ""
File.open("./config.yaml") {|io|
  YAML.load_documents(io) {|obj|
    obj.keys.each do |key|
      param = obj[key]
    end
  }
}

desc "00: Convert BED to BioC RangedData"
task :bed2rangedData do
  sh "R -q -f bin/00bed2rangedData"
end

## Annotation and enriched GO 
desc "01: Assign gene to peaks"
task :geneAssignment2peak do
  sh "R -q -f bin/01geneAssignment2peak.r"
end
desc "02: Assign go term to peaks"
task :goAssignment2peak do
  sh "R -q -f bin/02goAssignment2peak.r"
end

## Stat.
desc "01: Draw pie chart inside feature of peak position"
task :pieInsideFeature do
  sh "R -q -f bin/01pieInsideFeature.r"
end

## motif
desc "01: Make fasta file in peaks"
task :peak2fa do
  sh "R -q -f bin/01peak2fa.r"
end
desc "02: De novo motif discovary"
task :denovoMotif do
  sh "R -q -f bin/02denovoMotif.r"
end
desc "03: motif db search"
task :motifdbSearch do
  sh "R -q -f bin/03motifdbSearch.r"
end
desc "04: motif search in peak sequences"
task :motifsearchInPeakseq do
  sh "R -q -f bin/04motifsearchInPeakseq.r"
end  
desc "05: Draw motif distribution"
task :motifDistribution do
  sh "R -q -f bin/05motifDistribution.r"
end  

## overlap
desc "01: Find overlapping peaks"
task :findOverlappingPekas do
  sh "R -q -f bin/01findOverlappingPekas.r"
end
desc "02: Make fasta file of overlapping peaks"
task :overlappingPeak2fa do
  sh "R -q -f bin/02overlappingPeak2fa.r"
end
desc "03: Motif search in overlapping peaks"
task :motifsearchInOverlappingPeakseq do
  sh "R -q -f bin/03motifsearchInOverlappingPeakseq.r"
end
desc "04: Draw two motif distance distribution"
task :motifsearchInOverlappingPeakseq do
  sh "R -q -f bin/03twoMotifDistanceDistribution.r"
end
