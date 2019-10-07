
<!-- README.md is generated from README.Rmd. Please edit that file -->

# GenomicState

[![Travis-CI build
status](https://travis-ci.org/LieberInstitute/GenomicState.svg?branch=master)](https://travis-ci.org/LieberInstitute/GenomicState)
[![AppVeyor build
status](https://ci.appveyor.com/api/projects/status/github/LieberInstitute/GenomicState?branch=master&svg=true)](https://ci.appveyor.com/project/LieberInstitute/GenomicState)
[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
[![Codecov test
coverage](https://codecov.io/gh/LieberInstitute/GenomicState/branch/master/graphs/badge.svg)](https://codecov.io/gh/LieberInstitute/GenomicState?branch=master)

This package provides functions for building `GenomicState` objects from
diverse annotation sources such as
[`Gencode`](https://www.gencodegenes.org/human/releases.html). It also
provides a way to load pre-computed `GenomicState` objects if you are
working at [JHPCE](https://jhpce.jhu.edu/). These `GenomicState` objects
are normally created using
[derfinder::makeGenomicState()](https://rdrr.io/bioc/derfinder/man/makeGenomicState.html)
and can be used for annotating regions with
[derfinder::annotateRegions()](https://rdrr.io/bioc/derfinder/man/annotateRegions.html)
which are in turn used by
[derfinderPlot::plotRegionCoverage()](https://rdrr.io/bioc/derfinderPlot/man/plotRegionCoverage.html).

# Installation instructions

Get the latest stable `R` release from
[CRAN](http://cran.r-project.org/). Then install `GenomicState` using
the following code:

``` r
## If needed:
if (!requireNamespace("remotes", quietly = TRUE))
   install.packages("remotes")

## Install with:
remotes::install_github('LieberInstitute/GenomicState')
```

# Citation

Below is the citation output from using `citation('GenomicState')` in R.
Please run this yourself to check for any updates on how to cite
**GenomicState**.

``` r
citation('GenomicState')
#> 
#> To cite package 'GenomicState' in publications use:
#> 
#>   Leonardo Collado-Torres (2019). GenomicState: Build and access
#>   GenomicState objects for use with derfinder tools from sources
#>   like Gencode. R package version 0.99.2.
#>   https://github.com/LieberInstitute/GenomicState
#> 
#> A BibTeX entry for LaTeX users is
#> 
#>   @Manual{,
#>     title = {GenomicState: Build and access GenomicState objects for use with derfinder
#> tools from sources like Gencode},
#>     author = {Leonardo Collado-Torres},
#>     year = {2019},
#>     note = {R package version 0.99.2},
#>     url = {https://github.com/LieberInstitute/GenomicState},
#>   }
```

# Testing

Testing on Bioc-devel is feasible thanks to [R
Travis](http://docs.travis-ci.com/user/languages/r/).
