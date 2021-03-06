% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/local_metadata.R
\name{local_metadata}
\alias{local_metadata}
\title{Locate local metadata outside of AnnotationHub}
\usage{
local_metadata(local_path = "/dcl01/lieber/ajaffe/lab/GenomicState/data-raw")
}
\arguments{
\item{local_path}{A \code{character(1)} pointing to where the data is stored
locally}
}
\value{
The AnnotationHub metadata \code{data.frame()} for the data in this
package with \code{RDataPath} updated to point to the \code{local_path}. It includes
an addtional column called \code{loadCode} which you can evaluate with
\code{eval(parse(text = entry))}.
}
\description{
Locate local metadata outside of AnnotationHub
}
\examples{

## Get the local metadata
meta <- local_metadata()

## Subset to the data of interest, lets say hg19 TxDb for v31
interest <- subset(meta, RDataClass == "TxDb" & Tags == "Gencode:v31:hg19")

## Inspect the result
interest

## Next you can load the data
if (file.exists(interest$RDataPath)) {
    ## This only works at JHPCE
    eval(parse(text = interest$loadCode))

    ## Explore the loaded object (would be gencode_v31_hg19_txdb in this case)
    gencode_v31_hg19_txdb
}
}
\seealso{
\code{\link[AnnotationHubData:makeAnnotationHubMetadata]{AnnotationHubData::makeAnnotationHubMetadata()}}
}
\author{
Leonardo Collado-Torres
}
