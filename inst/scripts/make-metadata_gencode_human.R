library('GenomicState')
library('glue')
library('here')
library('sessioninfo')

params <- expand.grid(genome = c('hg19', 'hg38'), version = as.character(23:32))

outdir <- 'gencode'
pkgname <- 'GenomicState'

meta <- do.call(rbind, apply(params, 1, function(x) {
    genome <- x[1]
    version <- x[2]

    meta <- data.frame(
        Title = paste(c('TxDb', 'Annotated genes', 'GenomicState'),
            glue('for Gencode v{version} on {genome} coordinates')),
        Description = paste(glue('Gencode v{version}'), c(
                'TxDb object',
                'annotated genes from bumphunter::annotateTranscripts()',
                'GenomicState from derfinder::makeGenomicState()'
            ),
            glue('on {genome} coordinates.'),
            'This is useful for packages such as derfinder and derfinderPlot.',
            'For more information, check the GenomicState package.'
        ),
        BiocVersion = "3.10",
        Genome = ifelse(genome == 'hg38', 'GRCh38', 'GRCh37'),
        SourceType = "GTF",
        SourceUrl = gencode_source_url(version = version, genome = genome),
        SourceVersion = "Oct 03 2019",
        Species = "Homo sapiens",
        TaxonomyId = 9606,
        Coordinate_1_based = TRUE,
        DataProvider = "GENCODE",
        Maintainer = "Leonardo Collado-Torres <lcolladotor@gmail.com>",
        RDataClass = c('TxDb', 'GRanges', 'list'),
        DispatchClass = c('SQLiteFile', 'Rda', 'Rda'),
        RDataPath = file.path(pkgname, outdir, c(
            glue('gencode_v{version}_{genome}_txdb.sqlite'),
            glue('gencode_v{version}_{genome}_annotated_genes.rda'),
            glue('gencode_v{version}_{genome}_GenomicState.rda')
        )),
        Tags = as.character(glue('Gencode:v{version}:{genome}')),
        row.names = NULL,
        stringsAsFactors = FALSE
    )
}))

write.csv(meta,
    file = here::here('inst', 'extdata', 'metadata_gencode_human.csv'),
    row.names = FALSE)

## Check
if(FALSE) {
    AnnotationHubData::makeAnnotationHubMetadata(here::here())
}

## Reproducibility information
print('Reproducibility information:')
Sys.time()
proc.time()
options(width = 120)
session_info

# ─ Session info ───────────────────────────────────────────────────────────────────────────────────────────────────────
#  setting  value
#  version  R version 3.6.1 (2019-07-05)
#  os       macOS Mojave 10.14.6
#  system   x86_64, darwin15.6.0
#  ui       RStudio
#  language (EN)
#  collate  en_US.UTF-8
#  ctype    en_US.UTF-8
#  tz       America/New_York
#  date     2019-10-04
#
# ─ Packages ───────────────────────────────────────────────────────────────────────────────────────────────────────────
#  package      * version date       lib source
#  assertthat     0.2.1   2019-03-21 [1] CRAN (R 3.6.0)
#  backports      1.1.4   2019-04-10 [1] CRAN (R 3.6.0)
#  callr          3.3.2   2019-09-22 [1] CRAN (R 3.6.1)
#  cli            1.1.0   2019-03-19 [1] CRAN (R 3.6.0)
#  colorout     * 1.2-1   2019-05-07 [1] Github (jalvesaq/colorout@7ea9440)
#  crayon         1.3.4   2017-09-16 [1] CRAN (R 3.6.0)
#  desc           1.2.0   2018-05-01 [1] CRAN (R 3.6.0)
#  devtools     * 2.2.1   2019-09-24 [1] CRAN (R 3.6.1)
#  digest         0.6.21  2019-09-20 [1] CRAN (R 3.6.0)
#  ellipsis       0.3.0   2019-09-20 [1] CRAN (R 3.6.0)
#  fs             1.3.1   2019-05-06 [1] CRAN (R 3.6.0)
#  GenomicState * 0.99.0  2019-10-04 [1] Bioconductor
#  glue         * 1.3.1   2019-03-12 [1] CRAN (R 3.6.0)
#  here         * 0.1     2017-05-28 [1] CRAN (R 3.6.0)
#  magrittr       1.5     2014-11-22 [1] CRAN (R 3.6.0)
#  memoise        1.1.0   2017-04-21 [1] CRAN (R 3.6.0)
#  packrat        0.5.0   2018-11-14 [1] CRAN (R 3.6.0)
#  pkgbuild       1.0.5   2019-08-26 [1] CRAN (R 3.6.1)
#  pkgload        1.0.2   2018-10-29 [1] CRAN (R 3.6.0)
#  prettyunits    1.0.2   2015-07-13 [1] CRAN (R 3.6.0)
#  processx       3.4.1   2019-07-18 [1] CRAN (R 3.6.0)
#  ps             1.3.0   2018-12-21 [1] CRAN (R 3.6.0)
#  R6             2.4.0   2019-02-14 [1] CRAN (R 3.6.0)
#  Rcpp           1.0.2   2019-07-25 [1] CRAN (R 3.6.0)
#  remotes        2.1.0   2019-06-24 [1] CRAN (R 3.6.0)
#  rlang          0.4.0   2019-06-25 [1] CRAN (R 3.6.0)
#  rprojroot      1.3-2   2018-01-03 [1] CRAN (R 3.6.0)
#  rstudioapi     0.10    2019-03-19 [1] CRAN (R 3.6.0)
#  sessioninfo  * 1.1.1   2018-11-05 [1] CRAN (R 3.6.0)
#  testthat     * 2.2.1   2019-07-25 [1] CRAN (R 3.6.0)
#  usethis      * 1.5.1   2019-07-04 [1] CRAN (R 3.6.0)
#  withr          2.1.2   2018-03-15 [1] CRAN (R 3.6.0)
#
# [1] /Library/Frameworks/R.framework/Versions/3.6/Resources/library
