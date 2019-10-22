# GenomicState 0.99.5

* The data is now live through `AnnotationHub::AnnotationHub()` and thus through
`GenomicStateHub()`. The documentation now reflects this change.

# GenomicState 0.99.2

* Addressed issues reported at http://bioconductor.org/spb_reports/GenomicState_buildreport_20191007121957.html
* Added the function `GenomicStateHub()` which will work once the data is
uploaded to `AnnotationHub`.
* Edited the vignette links.

# GenomicState 0.99.1

* Fixed some minor bugs.

# GenomicState 0.99.0

* Added a `NEWS.md` file to track changes to the package.
* Added the functions `gencode_txdb()`, `gencode_annotated_genes()` and
`gencode_genomic_state()` for creating GenomicState objects from Gencode
annotation files for human genome versions hg38 and hg19.
* Added `local_metadata()` for finding the data locally, particularly at
JHPCE.
