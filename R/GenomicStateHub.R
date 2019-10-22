#' Access GenomicState objects through AnnotationHub
#'
#' This function uses `AnnotationHub` to obtain the objects provided by this
#' package. These are: the `TxDb` object made with [gencode_txdb()], the
#' annotated genes object made with [gencode_annotated_genes()] or the
#' GenomicState object made with [gencode_genomic_state()].
#'
#' @inheritParams gencode_txdb
#' @param filetype A `character()` with either `TxDb`, `AnnotatedGenes` or
#' `GenomicState`.
#' @param ah An `AnnotationHub` object
#' [AnnotationHub-class][AnnotationHub::AnnotationHub-class].
#'
#' @return The [AnnotationHub-class][AnnotationHub::AnnotationHub-class] query
#' for the file you requested.
#' @author Leonardo Collado-Torres
#' @seealso [gencode_txdb()] [gencode_annotated_genes()]
#' [gencode_genomic_state()]
#'
#' @export
#' @import AnnotationHub
#' @examples
#'
#' ## Query AnnotationHub for the GenomicState object for Gencode v31 on
#' ## hg19 coordinates
#' hub_query_gs_gencode_v31_hg19 <- GenomicStateHub(version = '31',
#'     genome = 'hg19',
#'     filetype = 'GenomicState')
#' hub_query_gs_gencode_v31_hg19
#'
#'
#' ## Check the metadata
#' mcols(hub_query_gs_gencode_v31_hg19)
#'
#' ## Access the file through AnnotationHub
#' if(length(hub_query_gs_gencode_v31_hg19) == 1) {
#'     hub_gs_gencode_v31_hg19 <- hub_query_gs_gencode_v31_hg19[[1]]
#'
#'     hub_gs_gencode_v31_hg19
#' }
#'

GenomicStateHub <- function(version = '31', genome = c('hg38', 'hg19'),
    filetype = c('TxDb', 'AnnotatedGenes', 'GenomicState'),
    ah = AnnotationHub::AnnotationHub()) {

    ## Inputs
    version <- as.character(version)
    genome <- match.arg(genome)
    filetype <- match.arg(filetype)
    stopifnot(is(ah, 'AnnotationHub'))

    ## Build the query
    if(filetype == 'AnnotatedGenes') filetype <- 'Annotated genes'
    tags <- c('Gencode', paste0('v', version), genome)
    title <- paste(filetype, 'for Gencode', paste0('v', version), 'on', genome,
        'coordinates')

    ## Query AnnotationHub
    q <- AnnotationHub::query(ah, pattern = c(tags, title))
    return(q)
}
