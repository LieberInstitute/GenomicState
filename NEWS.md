# GenomicState 0.99.11

BUG FIXES

* GenomicState now requires derfinder version 1.21.7 or newer to fix a bug
on `derfinder::makeGenomicState()` introduced by the change in R 4.0 on the
default behavior of `data.frame(stringsAsFactors = FALSE)` which used to be
`TRUE`. This error didn't break `derfinder` but was breaking
`gencode_genomic_state()`.

# GenomicState 0.99.10

SIGNIFICANT USER-VISIBLE CHANGES

* Documentation website is now available at
http://LieberInstitute.github.io/GenomicState/. It gets updated with every
commit on the master branch (bioc-devel) using GitHub Actions and pkgdown.


# GenomicState 0.99.5

SIGNIFICANT USER-VISIBLE CHANGES

* The data is now live through `AnnotationHub::AnnotationHub()` and thus through
`GenomicStateHub()`. The documentation now reflects this change.

# GenomicState 0.99.2

SIGNIFICANT USER-VISIBLE CHANGES

* Addressed issues reported at http://bioconductor.org/spb_reports/GenomicState_buildreport_20191007121957.html
* Added the function `GenomicStateHub()` which will work once the data is
uploaded to `AnnotationHub`.
* Edited the vignette links.

# GenomicState 0.99.1

BUG FIXES

* Fixed some minor bugs.

# GenomicState 0.99.0

NEW FEATURES

* Added a `NEWS.md` file to track changes to the package.
* Added the functions `gencode_txdb()`, `gencode_annotated_genes()` and
`gencode_genomic_state()` for creating GenomicState objects from Gencode
annotation files for human genome versions hg38 and hg19.
* Added `local_metadata()` for finding the data locally, particularly at
JHPCE.
