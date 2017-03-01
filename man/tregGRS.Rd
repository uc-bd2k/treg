\name{tregGRS}
\alias{tregGRS}
\title{Function to calculate the Generalized Random Set statistic to perform Functional Annotation by Primary Genomics Data}
\description{
  This function is intended to compare a new genomics dataset to existing primary genomics data by using the Generalized Random Set approach to compute the concordance of gene lists based on corresponding p-values 
}
\usage{
tregGRS(query.p, reference.p, query.gL = NULL, reference.gL = NULL, na.rm = TRUE, estimateNullDistr = TRUE, nullDistrQuantiles = c(0.9, 0.95, 0.99), nullDistrN = 100, tolerateWarnings=TRUE, pAdjust.method.query=NULL, pAdjust.method.reference=NULL, lambda=0.005,rescale=T)
}
\arguments{
  \item{query.p}{ Query p-values. A vector, a matrix with two columns where the first column contains the geneIDs and the second column contains the p-values, or a matrix with three columns where the first column contains the geneIDs, the second contains the scores and the third contains probability. If the query.p is a vector and query.gL is NULL, query.p and reference.p are assumed to have the same number of genes and genes are in the same order.}
  \item{reference.p}{ Reference p-values. A vector, a matrix with two columns where the first column contains the geneIDs and the second column contains the p-values, or a matrix with three columns where the first column contains the geneIDs, the second contains the scores and the third contains probability. If the reference.p is a vector and reference.gL is NULL, query.p and reference.p are assumed to have the same number of genes and genes are in the same order.}
  \item{query.gL}{ If query.p is a vector of p-values, this parameters is expected to contain a vector of corresponding gene IDs of same length.  Otherwise it is ignored. }
  \item{reference.gL}{ If reference.p is a vector of p-values, this parameters is expected to contain a vector of corresponding gene IDs of same length.  Otherwise it is ignored. }
  \item{na.rm}{If TRUE, any NA's in query.p and/or reference.p are removed before computing the GRS score.}
  \item{estimateNullDistr}{If TRUE, an empirical distribution of the gene-specific GRS score is estimated.}
  \item{nullDistrQuantiles}{If 'estimateNullDistr' is TRUE, specifies the desired quantiles of the null-distribution.}
  \item{nullDistrN}{If 'estimateNullDistr' is TRUE, specifies the number of iterations for the estimation function.}
  \item{tolerateWarnings}{If FALSE, function returns (with the warning message as character string). This parameter is intended when using GRS() by the Genomics Portals.}
  \item{pAdjust.method.query}{If NULL, the probability of differential expression is set to posterior probability of diff expression based on query.p, else 1-adjusted pvalue is used from the p.adjust function.}
  \item{pAdjust.method.reference}{If NULL, the probability of differential expression is set to posterior probability of diff expression based on reference.p, else 1-adjusted pvalue is used from the p.adjust function.}
  \item{lambda}{To be passed to qvalue() function which estimates the proportion of non-differentially expressed genes.}
  \item{rescale}{If TRUE (default) quantile normalization is performed between scores and probabilities of differential gene expression and TREG binding profiles.}
}
\details{
  This function is intended to compare a new genomics dataset to existing primary genomics data by using the Generalized Random Set approach to compute the concordance of gene lists based on corresponding p-values.
}
\value{
  This function returns a list:
  \item{p.value }{GRS p-value.  Under the null-hypothesis, the two gene lists are not concordant.}
  \item{z.score }{GRS z-score}
  \item{geneTable}{Table where the first column contains the common gene IDs and the second column contains the geney-specific GRS score.}
  \item{EvalueNullDistrQ}{If 'estimateNullDistr' is TRUE, this list item gives the quantiles of the null-distribution specified by 'nullDistrQuantiles' parameter.}
}
\references{ Publication forthcoming. }
\author{Johannes Freudenberg }
\seealso{\code{\link{convertGeneTable}},  \code{\link{runCLEAN}}, \code{\link{LRpath}}}
\examples{
library(treg)
data(erAlpha)
data(erExpression)

RefTable<-makeTranscriptDbFromUCSC(genome="hg18",tablename="refGene")
ChipSeq<-annotateChipSeqPeaks(chip.seq=erAlpha[[3]],transcriptDB=RefTable,distanceRange=c(-1e+06,1e+06))
tregBindingERalpha<-chipSeqWeightedSum(ChipSeq,verbose=T,genome=RefTable)

bindingExpressionConcordance<-tregGRS(query.p=erExpression$pValues[,c("geneID","cID_7")],reference.p=tregBindingERalpha)
bindingExpressionConcordance[1:2]
}
\keyword{ multivariate }
\keyword{ htest }
