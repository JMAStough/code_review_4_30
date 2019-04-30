library(tidyverse)

spades_vlp <- read_tsv("data/spades_vlp_contig_qc.tsv")
spades_whole <- read_tsv("data/spades_whole_contig_qc.tsv")
megahit_vlp <- read_tsv("data/megahit_vlp_contig_qc.tsv")
megahit_whole <- read_tsv("data/megahit_whole_contig_qc.tsv")
megahit_coassembly_vlp <- read_tsv("data/megahit_coassembly_vlp_contig_qc.tsv")
megahit_coassembly_whole <- read_tsv("data/megahit_coassembly_whole_contig_qc.tsv")

contigqc <- bind_rows("spades_vlp" = spades_vlp, "spades_whole" = spades_whole, "megahit_vlp" = megahit_vlp, "megahit_whole" = megahit_whole,
                        "megahit_coassembly_vlp" = megahit_coassembly_vlp, "megahit_coassembly_whole" = megahit_coassembly_whole, .id="id")

num_scaffolds <- ggplot(contigqc, aes(x = id, y = n_scaffolds)) +
  geom_col() +
  labs(x = NULL, y = "Number of Scaffolds") +
  theme_classic()

n50_scaffolds <- ggplot(contigqc, aes(x = id, y = scaf_N50)) +
  geom_col() +
  labs(x = NULL, y = "N50") +
  theme_classic()

l50_scaffolds <- ggplot(contigqc, aes(x = id, y = scaf_L50)) +
  geom_col() +
  labs(x = NULL, y = "L50") +
  theme_classic()

n90_scaffolds <- ggplot(contigqc, aes(x = id, y = scaf_N90)) +
  geom_col() +
  labs(x = NULL, y = "N90") +
  theme_classic()

l90_scaffolds <- ggplot(contigqc, aes(x = id, y = scaf_L90)) +
  geom_col() +
  labs(x = NULL, y = "L90") +
  theme_classic()

assembly_score <- ggplot(contigqc, aes(x = id, y = asm_score)) +
  geom_col() +
  labs(x = NULL, y = "Assembly Score") +
  theme_classic()

max_scaffold <- ggplot(contigqc, aes(x = id, y = scaf_max)) +
  geom_col() +
  labs(x = NULL, y = "BP") +
  theme_classic()

scaf_over_50k <- ggplot(contigqc, aes(x = id, y = scaf_n_gt50K)) +
  geom_col() +
  labs(x = NULL, y = "Number of Scaffolds over 50kbp") +
  theme_classic()

num_bases_over_50k <- ggplot(contigqc, aes(x = id, y = scaf_l_gt50k)) +
  geom_col() +
  labs(x = NULL, y = "Number of Bases in Scaffolds over 50kbp") +
  theme_classic()
