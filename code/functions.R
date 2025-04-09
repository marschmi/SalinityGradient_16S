### scale_reads function
#################################################################################### 
# Function to scale reads: http://deneflab.github.io/MicrobeMiseq/ 
# Scales reads by 
# 1) taking proportions
# 2) multiplying by a given library size of n
# 3) rounding 
# Default for n is the minimum sample size in your library
# Default for round is floor

matround <- function(x){trunc(x+0.5)}

scale_reads <- function(physeq, n = min(sample_sums(physeq)), round = "round") {
  
  # transform counts to n
  physeq.scale <- transform_sample_counts(physeq, function(x) {(n * x/sum(x))})
  
  # Pick the rounding functions
  if (round == "floor"){
    otu_table(physeq.scale) <- floor(otu_table(physeq.scale))
  } else if (round == "round"){
    otu_table(physeq.scale) <- round(otu_table(physeq.scale))
  } else if (round == "matround"){
    otu_table(physeq.scale) <- matround(otu_table(physeq.scale))
  }
  
  # Prune taxa and return new phyloseq object
  physeq.scale <- prune_taxa(taxa_sums(physeq.scale) > 0, physeq.scale)
  return(physeq.scale)
}
