txdb_v31_hg38_chr22 <- gencode_txdb(chrs = 'chr22')
txdb_v31_hg38_chr22_disk <- AnnotationDbi::loadDb(
    system.file('extdata', 'txdb_v31_hg38_chr22.db',
        package = 'GenomicState')
)
genes_v31_hg38_chr22 <- gencode_annotated_genes(txdb_v31_hg38_chr22)
gs_v31_hg38_chr22 <- gencode_genomic_state(txdb_v31_hg38_chr22)

test_that("Gencode genomic states", {
    expect_equal(gencode_source_url(version = '31', genome = 'hg19'),
        'ftp://ftp.ebi.ac.uk/pub/databases/gencode/Gencode_human/release_31/GRCh37_mapping/gencode.v31lift37.annotation.gtf.gz'
    )
    expect_equal(gencode_source_url(version = '31', genome = 'hg38'),
        'ftp://ftp.ebi.ac.uk/pub/databases/gencode/Gencode_human/release_31/gencode.v31.annotation.gtf.gz'
    )

    expect_equivalent(txdb_v31_hg38_chr22, txdb_v31_hg38_chr22_disk)
    ## Dunno why chrM is not here
    expect_equal(
        unique(seqnames(genes_v31_hg38_chr22)),
        factor('chr22', levels = paste0('chr', c(1:22, 'X', 'Y')))
    )
    expect_equal(
        any(grepl('\\.', genes_v31_hg38_chr22$Geneid)),
        FALSE
    )
    expect_equal(length(genes_v31_hg38_chr22), 1384)

    ## Same gene symbols are used
    expect_equal(
        sort(unique(genes_v31_hg38_chr22$Gene)),
        sort(unique(unlist(gs_v31_hg38_chr22$fullGenome$symbol)))
    )
    expect_equal(
        sort(unique(genes_v31_hg38_chr22$Gene)),
        sort(unique(unlist(gs_v31_hg38_chr22$codingGenome$symbol)))
    )

})
