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
#' @param ... Arguments passed to
#' [AnnotationHub()][AnnotationHub::AnnotationHub-objects].
#'
#' @return The [AnnotationHub()][AnnotationHub::AnnotationHub-objects] query
#' for the file you requested.
#' @author Leonardo Collado-Torres
#' @seealso [gencode_txdb()] [gencode_annotated_genes()]
#' [gencode_genomic_state()]
#'
#' @export
#' @examples
#'
#' ## Query AnnotationHub for the GenomicState object for Gencode v31 on
#' ## hg19 coordinates
#' hub_gs_gencode_v31_hg19 <- GenomicStateHub(version = '31', genome = 'hg19',
#'     filetype = 'GenomicState')
#' hub_gs_gencode_v31_hg19
#'
#'
#' ## Check the metadata
#' mcols(hub_gs_gencode_v31_hg19)
#'
#' ## Access the file through AnnoationHub
#' if(length(hub_gs_gencode_v31_hg19) == 1) {
#'     gs_gencode_v31_hg19 <- hub_gs_gencode_v31_hg19[[1]]
#' }
#'

GenomicStateHub <- function(version = '31', genome = c('hg38', 'hg19'),
    filetype = c('TxDb', 'AnnotatedGenes', 'GenomicState'),
    ...) {

    ## Inputs
    version <- as.character(version)
    genome <- match.arg(genome)
    filetype <- match.arg(filetype)

    ## Build the query
    if(filetype == 'AnnotatedGenes') filetype <- 'Annotated genes'
    tags <- paste0('Gencode:v', version, ':', genome)
    title <- paste(filetype, 'for Gencode', paste0('v', version), 'on', genome,
        'coordinates')

    ## Query AnnotationHub
    ah <- AnnotationHub::AnnotationHub(...)
    q <- query(ah, pattern = c(tags, title))
    return(q)
}
