#' Locate local metadata outside of AnnotationHub
#'
#' @param local_path A `character(1)` pointing to where the data is stored
#' locally
#'
#' @return The AnnotationHub metadata `data.frame()` for the data in this
#' package with `RDataPath` updated to point to the `local_path`. It includes
#' an addtional column called `loadCode` which you can evaluate with
#' `eval(parse(text = entry))`.
#'
#' @author Leonardo Collado-Torres
#' @seealso [AnnotationHubData::makeAnnotationHubMetadata()]
#' @export
#'
#' @examples
#'
#' ## Get the local metadata
#' meta <- local_metadata()
#'
#' ## Subset to the data of interest, lets say hg19 TxDb for v31
#' interest <- subset(meta, RDataClass == 'TxDb' & Tags == 'Gencode:v31:hg19')
#'
#' ## Inspect the result
#' interest
#'
#' ## Next you can load the data
#' if(file.exists(interest$RDataPath)) {
#'     ## This only works at JHPCE
#'     eval(parse(text = interest$loadCode))
#'
#'     ## Explore the loaded object (would be gencode_v31_hg19_txdb in this case)
#'     gencode_v31_hg19_txdb
#' }
#'

local_metadata <- function(
    local_path = '/dcl01/lieber/ajaffe/lab/GenomicState/data-raw') {

    ## Locate and read AnnotationHub csv files
    csv_files <- dir(system.file('extdata', package = 'GenomicState'),
        pattern = '^metadata.*\\.csv$', full.names = TRUE)
    meta <- do.call(rbind, lapply(csv_files, utils::read.csv,
        stringsAsFactors = FALSE,
        row.names = NULL))

    ## Replace the RDataPath
    meta$RDataPath <- file.path(local_path, gsub('GenomicState/', '',
        meta$RDataPath))

    meta$loadCode <- paste0(
        gsub('\\.rda|\\.sqlite', '', basename(meta$RDataPath)),
        ' <- ',
        ifelse(meta$DispatchClass == 'SQLiteFile', 'AnnotationDbi::loadDb',
            'load'),
        '("',
        meta$RDataPath,
        '")'
    )

    return(meta)
}
