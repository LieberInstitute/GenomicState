#' Build a GenomicState object for Gencode TxDb objects
#'
#' Based on a `TxDb` object built by [gencode_txdb()] this function builds a
#' `GenomicState` object which you can then use with
#' [derfinder::annotateRegions()]. This information is then used by packages
#' like `derfinderPlot`.
#'
#' Note that not all genes will have symbols as many will be `NA`.
#'
#' @inheritParams gencode_annotated_genes
#'
#' @return A GenomicState object with the gene symbols as built using
#' [derfinder::makeGenomicState()].
#' @export
#' @author Leonardo Collado-Torres
#' @references Based on code for the `brainflowprobes` package at:
#' <https://github.com/LieberInstitute/brainflowprobes/blob/master/data-raw/create_sysdata.R>
#'
#' @seealso [gencode_txdb()] [gencode_annotated_genes()]
#'
#' @examples
#'
#' ## Start from scratch if you want:
#' \dontrun{
#' txdb_v31_hg19_chr21 <- gencode_txdb("31", "hg19", chrs = "chr21")
#' }
#'
#' ## or read in the txdb object for hg19 chr21 from this package
#' txdb_v31_hg19_chr21 <- AnnotationDbi::loadDb(
#'     system.file("extdata", "txdb_v31_hg19_chr21.sqlite",
#'         package = "GenomicState"
#'     )
#' )
#'
#' ## Now build the GenomicState object
#' gs_v31_hg19_chr21 <- gencode_genomic_state(txdb_v31_hg19_chr21)
#'
#' ## Explore the result
#' gs_v31_hg19_chr21
gencode_genomic_state <- function(txdb) {
    message(paste(Sys.time(), "making the GenomicState object"))
    GenomicState <- derfinder::makeGenomicState(txdb)


    ## Add the gene symbols
    message(paste(Sys.time(), "finding gene symbols"))
    gene_gr <- GenomicFeatures::genes(txdb)
    gene_gr$symbol <- AnnotationDbi::mapIds(
        org.Hs.eg.db::org.Hs.eg.db,
        gsub("\\..*", "", gene_gr$gene_id),
        "SYMBOL", "ENSEMBL"
    )
    # table(is.na(gene_gr$symbol))

    message(paste(Sys.time(), "adding gene symbols to the GenomicState"))
    GenomicState <- lapply(GenomicState, function(gs) {
        stopifnot(max(unlist(gs$gene)) == length(gene_gr))
        gs$symbol <- IRanges::extractList(gene_gr$symbol, gs$gene)
        return(gs)
    })

    return(GenomicState)
}
