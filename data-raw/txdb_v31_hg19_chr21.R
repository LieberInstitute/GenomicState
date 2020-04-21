## code to prepare `txdb_v31_hg19_chr21` dataset goes here


txdb_v31_hg19_chr21 <- GenomicState::gencode_txdb(
    chrs = "chr21",
    genome = "hg19"
)

## Export the data that can be re-loaded with AnnotationDbi::loadDb().
dir.create(here::here("inst/extdata"), recursive = TRUE, showWarnings = FALSE)
AnnotationDbi::saveDb(txdb_v31_hg19_chr21,
    file = here::here("inst/extdata/txdb_v31_hg19_chr21.sqlite")
)
