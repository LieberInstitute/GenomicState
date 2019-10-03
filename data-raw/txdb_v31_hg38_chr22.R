## code to prepare `txdb_v31_hg38_chr22` dataset goes here


txdb_v31_hg38_chr22 <- GenomicState::gencode_txdb(chrs = 'chr22')

## Export the data that can be re-loaded with AnnotationDbi::loadDb().
dir.create(here::here('inst/extdata'), recursive = TRUE, showWarnings = FALSE)
AnnotationDbi::saveDb(txdb_v31_hg38_chr22,
    file = here::here('inst/extdata/txdb_v31_hg38_chr22.db'))
