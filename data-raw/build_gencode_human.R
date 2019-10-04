library('sgejobs')
library('sessioninfo')

unlink('build_gencode_human.sh')
job_loop(
    loops = list(genome = c('hg19', 'hg38')),
    name = 'build_gencode_human',
    task_num = 1,
    create_shell = TRUE,
    queue = 'bluejay',
    email = 'a'
)

## Update the number of tasks to match the version numbers
array_submit('build_gencode_human.sh', task_ids = '23-32', submit = FALSE, restore = FALSE)

# ## Write the script to run
# cat(
# "## Build genomic state objects for multiple Gencode versions
#
# library('GenomicState')
# library('AnnotationDbi')
# library('sessioninfo')
#
# dir.create('gencode', showWarnings = FALSE)
# version <- Sys.getenv('SGE_TASK_ID')
#
# ## Build and save the TxDb object
# gencode_v\\${SGE_TASK_ID}_${genome}_txdb <- gencode_txdb(\\${SGE_TASK_ID}, '${genome}')
#
# ## Workaround for an RSQLite::sqliteCopyDatabase() error
# saveDb(gencode_v\\${SGE_TASK_ID}_${genome}_txdb, file = '~/gencode_v\\${SGE_TASK_ID}_${genome}_txdb.sqlite')
# system('mv ~/gencode_v\\${SGE_TASK_ID}_${genome}_txdb.sqlite gencode/gencode_v\\${SGE_TASK_ID}_${genome}_txdb.sqlite')
#
# ## Build and save the annotateTranscripts output
# gencode_v\\${SGE_TASK_ID}_${genome}_annotated_genes<- gencode_annotated_genes(gencode_v\\${SGE_TASK_ID}_${genome}_txdb)
# save(gencode_v\\${SGE_TASK_ID}_${genome}_annotated_genes, file = 'gencode/gencode_v\\${SGE_TASK_ID}_${genome}_annotated_genes.rda')
#
# ## Build and save the GenomicState
# gencode_v\\${SGE_TASK_ID}_${genome}_GenomicState <- gencode_genomic_state(gencode_v\\${SGE_TASK_ID}_${genome}_txdb)
# save(gencode_v\\${SGE_TASK_ID}_${genome}_GenomicState, file = 'gencode/gencode_v\\${SGE_TASK_ID}_${genome}_GenomicState.rda')
#
# ## Reproducibility information
# print('Reproducibility information:')
# Sys.time()
# proc.time()
# options(width = 120)
# session_info()
# ",
# file = 'build_gencode_human_run.R'
# )

## Update the script to run
script <- readLines('build_gencode_human.sh')
script[grepl('Rscript', script)] <- "Rscript -e \"library('GenomicState'); library('AnnotationDbi'); library('sessioninfo'); dir.create('gencode', showWarnings = FALSE); gencode_v\\${SGE_TASK_ID}_${genome}_txdb <- gencode_txdb('\\${SGE_TASK_ID}', '${genome}'); saveDb(gencode_v\\${SGE_TASK_ID}_${genome}_txdb, file = '~/gencode_v\\${SGE_TASK_ID}_${genome}_txdb.sqlite'); system('mv ~/gencode_v\\${SGE_TASK_ID}_${genome}_txdb.sqlite gencode/gencode_v\\${SGE_TASK_ID}_${genome}_txdb.sqlite'); gencode_v\\${SGE_TASK_ID}_${genome}_annotated_genes<- gencode_annotated_genes(gencode_v\\${SGE_TASK_ID}_${genome}_txdb); save(gencode_v\\${SGE_TASK_ID}_${genome}_annotated_genes, file = 'gencode/gencode_v\\${SGE_TASK_ID}_${genome}_annotated_genes.rda'); gencode_v\\${SGE_TASK_ID}_${genome}_GenomicState <- gencode_genomic_state(gencode_v\\${SGE_TASK_ID}_${genome}_txdb); save(gencode_v\\${SGE_TASK_ID}_${genome}_GenomicState, file = 'gencode/gencode_v\\${SGE_TASK_ID}_${genome}_GenomicState.rda'); print('Reproducibility information:'); Sys.time(); proc.time(); options(width = 120); session_info()\""
writeLines(script, 'build_gencode_human.sh')

## Now run with: sh build_gencode_human.sh
system('sh build_gencode_human.sh')

## Reproducibility information
print('Reproducibility information:')
Sys.time()
proc.time()
options(width = 120)
session_info()

# ─ Session info ───────────────────────────────────────────────────────────────────────────────────────────────────────
#  setting  value
#  version  R version 3.6.1 Patched (2019-09-06 r77160)
#  os       CentOS Linux 7 (Core)
#  system   x86_64, linux-gnu
#  ui       X11
#  language (EN)
#  collate  en_US.UTF-8
#  ctype    en_US.UTF-8
#  tz       US/Eastern
#  date     2019-10-03
#
# ─ Packages ───────────────────────────────────────────────────────────────────────────────────────────────────────────
#  package     * version date       lib source
#  assertthat    0.2.1   2019-03-21 [2] CRAN (R 3.6.1)
#  backports     1.1.4   2019-04-10 [2] CRAN (R 3.6.1)
#  cli           1.1.0   2019-03-19 [1] CRAN (R 3.6.1)
#  codetools     0.2-16  2018-12-24 [3] CRAN (R 3.6.1)
#  colorout    * 1.2-2   2019-09-26 [1] Github (jalvesaq/colorout@641ed38)
#  colorspace    1.4-1   2019-03-18 [2] CRAN (R 3.6.1)
#  crayon        1.3.4   2017-09-16 [1] CRAN (R 3.6.1)
#  digest        0.6.21  2019-09-20 [1] CRAN (R 3.6.1)
#  dplyr         0.8.3   2019-07-04 [1] CRAN (R 3.6.1)
#  ggplot2       3.2.1   2019-08-10 [1] CRAN (R 3.6.1)
#  glue          1.3.1   2019-03-12 [1] CRAN (R 3.6.1)
#  gtable        0.3.0   2019-03-25 [2] CRAN (R 3.6.1)
#  hms           0.5.1   2019-08-23 [2] CRAN (R 3.6.1)
#  htmltools     0.3.6   2017-04-28 [2] CRAN (R 3.6.1)
#  htmlwidgets   1.3     2018-09-30 [1] CRAN (R 3.6.1)
#  httpuv        1.5.2   2019-09-11 [1] CRAN (R 3.6.1)
#  jsonlite      1.6     2018-12-07 [2] CRAN (R 3.6.1)
#  later         0.8.0   2019-02-11 [2] CRAN (R 3.6.1)
#  lattice       0.20-38 2018-11-04 [3] CRAN (R 3.6.1)
#  lazyeval      0.2.2   2019-03-15 [2] CRAN (R 3.6.1)
#  lifecycle     0.1.0   2019-08-01 [1] CRAN (R 3.6.1)
#  lubridate     1.7.4   2018-04-11 [1] CRAN (R 3.6.1)
#  magrittr      1.5     2014-11-22 [1] CRAN (R 3.6.1)
#  munsell       0.5.0   2018-06-12 [2] CRAN (R 3.6.1)
#  pillar        1.4.2   2019-06-29 [1] CRAN (R 3.6.1)
#  pkgconfig     2.0.3   2019-09-22 [1] CRAN (R 3.6.1)
#  png           0.1-7   2013-12-03 [2] CRAN (R 3.6.1)
#  promises      1.0.1   2018-04-13 [2] CRAN (R 3.6.1)
#  pryr          0.1.4   2018-02-18 [2] CRAN (R 3.6.1)
#  purrr         0.3.2   2019-03-15 [2] CRAN (R 3.6.1)
#  R6            2.4.0   2019-02-14 [2] CRAN (R 3.6.1)
#  Rcpp          1.0.2   2019-07-25 [1] CRAN (R 3.6.1)
#  readr         1.3.1   2018-12-21 [1] CRAN (R 3.6.1)
#  rlang         0.4.0   2019-06-25 [1] CRAN (R 3.6.1)
#  rmote       * 0.3.4   2019-09-26 [1] Github (cloudyr/rmote@fbce611)
#  scales        1.0.0   2018-08-09 [2] CRAN (R 3.6.1)
#  servr         0.15    2019-08-07 [1] CRAN (R 3.6.1)
#  sessioninfo * 1.1.1   2018-11-05 [1] CRAN (R 3.6.1)
#  sgejobs     * 0.99.0  2019-09-26 [1] Github (LieberInstitute/sgejobs@94a6151)
#  stringi       1.4.3   2019-03-12 [2] CRAN (R 3.6.1)
#  stringr       1.4.0   2019-02-10 [1] CRAN (R 3.6.1)
#  tibble        2.1.3   2019-06-06 [1] CRAN (R 3.6.1)
#  tidyr         1.0.0   2019-09-11 [1] CRAN (R 3.6.1)
#  tidyselect    0.2.5   2018-10-11 [2] CRAN (R 3.6.1)
#  vctrs         0.2.0   2019-07-05 [1] CRAN (R 3.6.1)
#  withr         2.1.2   2018-03-15 [2] CRAN (R 3.6.1)
#  xfun          0.10    2019-10-01 [1] CRAN (R 3.6.1)
#  zeallot       0.1.0   2018-01-28 [1] CRAN (R 3.6.1)
#
# [1] /users/lcollado/R/3.6
# [2] /jhpce/shared/jhpce/core/conda/miniconda3-4.6.14/envs/svnR-3.6/R/3.6/lib64/R/site-library
# [3] /jhpce/shared/jhpce/core/conda/miniconda3-4.6.14/envs/svnR-3.6/R/3.6/lib64/R/library
