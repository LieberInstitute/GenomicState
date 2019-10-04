#' Annotation the genes for a given Gencode TxDb object
#'
#' Based on a `TxDb` object built by [gencode_txdb()] this function annotates
#' the genes. This information is then used by packages like `derfinder` and
#' `derfinderPlot`.
#'
#' @param txdb A [GenomicFeatures::TxDb-class] object built with
#' [gencode_txdb()].
#'
#' @return The annotated genes resulting from
#' [bumphunter::annotateTranscripts()].
#' @export
#' @author Leonardo Collado-Torres.
#' @references Based on code for the `brainflowprobes` package at:
#' <https://github.com/LieberInstitute/brainflowprobes/blob/master/data-raw/create_sysdata.R>
#'
#' @seealso [gencode_txdb()] [gencode_genomic_state()]
#'
#' @examples
#'
#' \dontrun{
#'     ## Start from scratch if you want:
#'     txdb_v31_hg38_chr22 <- gencode_txdb(chrs = 'chr22')
#' }
#'
#' ## or read in the txdb object for hg38 chr22 from this package
#' txdb_v31_hg38_chr22 <- AnnotationDbi::loadDb(
#'     system.file('extdata', 'txdb_v31_hg38_chr22.sqlite',
#'         package = 'GenomicState')
#' )
#'
#' ## Obtain the annotated genes for the Gencode TxDb object
#' genes_v31_hg38_chr22 <- gencode_annotated_genes(txdb_v31_hg38_chr22)
#'
#' ## Explore the result
#' genes_v31_hg38_chr22
#'

gencode_annotated_genes <- function(txdb) {
    message(paste(Sys.time(), 'annotating the transcripts'))
    genes <- bumphunter::annotateTranscripts(txdb,
        by = 'gene',
        mappingInfo = list('column' = 'ENTREZID', 'keytype' = 'ENSEMBL',
            'multiVals' = 'first'),
        simplifyGeneID = TRUE
    )
    return(genes)
}
