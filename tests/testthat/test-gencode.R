txdb_v31_hg19_chr21 <- gencode_txdb('31', 'hg19', chrs = 'chr21')
txdb_v31_hg19_chr21_disk <- AnnotationDbi::loadDb(
    system.file('extdata', 'txdb_v31_hg19_chr21.sqlite',
        package = 'GenomicState')
)
genes_v31_hg19_chr21 <- gencode_annotated_genes(txdb_v31_hg19_chr21)
gs_v31_hg19_chr21 <- gencode_genomic_state(txdb_v31_hg19_chr21)

test_that("Gencode genomic states", {
    expect_equal(gencode_source_url(version = '31', genome = 'hg19'),
        'ftp://ftp.ebi.ac.uk/pub/databases/gencode/Gencode_human/release_31/GRCh37_mapping/gencode.v31lift37.annotation.gtf.gz'
    )
    expect_equal(gencode_source_url(version = '31', genome = 'hg38'),
        'ftp://ftp.ebi.ac.uk/pub/databases/gencode/Gencode_human/release_31/gencode.v31.annotation.gtf.gz'
    )

    expect_equivalent(txdb_v31_hg19_chr21, txdb_v31_hg19_chr21_disk)
    expect_equal(
        unique(seqnames(genes_v31_hg19_chr21)),
        factor('chr21')
    )
    expect_equal(
        any(grepl('\\.', genes_v31_hg19_chr21$Geneid)),
        FALSE
    )
    expect_equal(length(genes_v31_hg19_chr21), 823)

    ## Same gene symbols are used
    expect_equal(
        sort(unique(genes_v31_hg19_chr21$Gene)),
        sort(unique(unlist(gs_v31_hg19_chr21$fullGenome$symbol)))
    )
    expect_equal(
        sort(unique(genes_v31_hg19_chr21$Gene)),
        sort(unique(unlist(gs_v31_hg19_chr21$codingGenome$symbol)))
    )

})
