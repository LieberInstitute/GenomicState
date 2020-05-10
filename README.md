
<!-- README.md is generated from README.Rmd. Please edit that file -->
GenomicState
============

<!-- badges: start -->
[![Lifecycle: stable](https://img.shields.io/badge/lifecycle-stable-brightgreen.svg)](https://www.tidyverse.org/lifecycle/#stable) [![BioC status](http://bioconductor.org/images/shields/availability/all.svg)](http://bioconductor.org/packages/release/data/annotation/html/GenomicState.html#archives) [![Codecov test coverage](https://codecov.io/gh/LieberInstitute/GenomicState/branch/master/graph/badge.svg)](https://codecov.io/gh/LieberInstitute/GenomicState?branch=master) [![R build status](https://github.com/LieberInstitute/GenomicState/workflows/R-CMD-check-bioc/badge.svg)](https://github.com/LieberInstitute/GenomicState/actions) [![Support site activity, last 6 months: tagged questions/avg. answers per question/avg. comments per question/accepted answers, or 0 if no tagged posts.](http://www.bioconductor.org/shields/posts/GenomicState.svg)](https://support.bioconductor.org/t/GenomicState/) [![GitHub issues](https://img.shields.io/github/issues/LieberInstitute/GenomicState)](https://github.com/LieberInstitute/GenomicState/issues) <!-- badges: end -->

This package provides functions for building `GenomicState` objects from diverse annotation sources such as [`Gencode`](https://www.gencodegenes.org/human/releases.html). It also provides a way to load pre-computed `GenomicState` objects if you are working at [JHPCE](https://jhpce.jhu.edu/). These `GenomicState` objects are normally created using [derfinder::makeGenomicState()](http://lcolladotor.github.io/derfinder/reference/makeGenomicState.html) and can be used for annotating regions with [derfinder::annotateRegions()](http://lcolladotor.github.io/derfinder/reference/annotateRegions.html) which are in turn used by [derfinderPlot::plotRegionCoverage()](http://leekgroup.github.io/derfinderPlot/reference/plotRegionCoverage.html).

Documentation
-------------

For more information about `GenomicState` check the vignettes [through Bioconductor](http://bioconductor.org/packages/GenomicState) or at the [documentation website](http://lieberinstitute.github.io/GenomicState).

Installation instructions
-------------------------

Get the latest stable `R` release from [CRAN](http://cran.r-project.org/). Then install `GenomicState` using from [Bioconductor](http://bioconductor.org/) the following code:

``` r
if (!requireNamespace("BiocManager", quietly = TRUE))
    install.packages("BiocManager")

BiocManager::install("GenomicState")
```

Citation
--------

Below is the citation output from using `citation('GenomicState')` in R. Please run this yourself to check for any updates on how to cite **GenomicState**.

``` r
print(citation('GenomicState'), bibtex = TRUE)
#> 
#> Collado-Torres L (2020). _Build and access GenomicState objects for use
#> with derfinder tools from sources like Gencode_. doi:
#> 10.18129/B9.bioc.GenomicState (URL:
#> https://doi.org/10.18129/B9.bioc.GenomicState),
#> https://github.com/LieberInstitute/GenomicState - R package version
#> 0.99.12, <URL: http://www.bioconductor.org/packages/GenomicState>.
#> 
#> A BibTeX entry for LaTeX users is
#> 
#>   @Manual{,
#>     title = {Build and access GenomicState objects for use with derfinder tools from sources like Gencode},
#>     author = {Leonardo Collado-Torres},
#>     year = {2020},
#>     url = {http://www.bioconductor.org/packages/GenomicState},
#>     note = {https://github.com/LieberInstitute/GenomicState - R package version 0.99.12},
#>     doi = {10.18129/B9.bioc.GenomicState},
#>   }
```

Please note that the `GenomicState` was only made possible thanks to many other R and bioinformatics software authors, which are cited either in the vignettes and/or the paper(s) describing this package.

Code of Conduct
---------------

Please note that the derfinderPlot project is released with a [Contributor Code of Conduct](https://contributor-covenant.org/version/2/0/CODE_OF_CONDUCT.html). By contributing to this project, you agree to abide by its terms.

Development tools
-----------------

-   Continuous code testing is possible thanks to [GitHub actions](https://www.tidyverse.org/blog/2020/04/usethis-1-6-0/) through *[usethis](https://CRAN.R-project.org/package=usethis)*, *[remotes](https://CRAN.R-project.org/package=remotes)*, *[sysreqs](https://github.com/r-hub/sysreqs)* and *[rcmdcheck](https://CRAN.R-project.org/package=rcmdcheck)* customized to use [Bioconductor's docker containers](https://www.bioconductor.org/help/docker/) and *[BiocCheck](https://bioconductor.org/packages/3.11/BiocCheck)*.
-   Code coverage assessment is possible thanks to [codecov](https://codecov.io/gh) and *[covr](https://CRAN.R-project.org/package=covr)*.
-   The [documentation website](http://lieberinstitute.github.io/GenomicState) is automatically updated thanks to *[pkgdown](https://CRAN.R-project.org/package=pkgdown)*.
-   The code is styled automatically thanks to *[styler](https://CRAN.R-project.org/package=styler)*.
-   The documentation is formatted thanks to *[devtools](https://CRAN.R-project.org/package=devtools)* and *[roxygen2](https://CRAN.R-project.org/package=roxygen2)*.

For more details, check the `dev` directory.
