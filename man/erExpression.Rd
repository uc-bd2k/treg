\name{erExpression}
\alias{erExpression}
\docType{data}
\title{
GSE8597 Gene expression analysis of hormone treated MCF7 breast cancer cells
}
\description{
Gene expression analysis of hormone treated MCF7 breast cancer cells in the presence or absence of cycloheximide
}
\usage{data(erExpression)}
\format{
  The format is:
List of 3
 $ metaInfo    :'data.frame':	2 obs. of  7 variables:
  ..$ cID     : num [1:2] 7 8
  ..$ expName : chr [1:2] "gse8597eset" "gse8597eset"
  ..$ platform: chr [1:2] "GPL570Platform" "GPL570Platform"
  ..$ variable: chr [1:2] "E2 Treatment With CHX" "E2 Treatment"
  ..$ Level1  : chr [1:2] "MCF7 CHX+E2" "MCF7 DMSO+E2"
  ..$ Level2  : chr [1:2] "MCF7 CHX+EtOH" "MCF7 DMSO+EtOH"
  ..$ label   : chr [1:2] "E2 Treatment of MCF7 Cells With CHX" "E2 Treatment of MCF7 Cells"
 $ pValues     :'data.frame':	21371 obs. of  3 variables:
  ..$ geneID: chr [1:21371] "10000" "10001" "10002" "10003" ...
  ..$ cID_7 : num [1:21371] 0.535 0.156 0.437 0.359 0.064 ...
  ..$ cID_8 : num [1:21371] 0.601502 0.115783 0.24914 0.651149 0.000393 ...
 $ coefficients:'data.frame':	21371 obs. of  3 variables:
  ..$ geneID: chr [1:21371] "10000" "10001" "10002" "10003" ...
  ..$ cID_7 : num [1:21371] -0.0137 0.1049 -0.0458 -0.0456 -0.1347 ...
  ..$ cID_8 : num [1:21371] 0.0219 -0.1306 -0.1102 -0.0132 -0.7151 ...
}
\details{
Bourdeau V, Deschênes J, Laperrière D, Aid M et al. Mechanisms of primary and secondary estrogen target gene regulation in breast cancer cells. Nucleic Acids Res 2008 Jan;36(1):76-93.
}
\source{
http://www.eh3.uc.edu/GenomicsPortals/analyzeExp_tl.jsp?exp=GSE8597&db=GPL570Platform
}
\references{
Bourdeau V, Deschênes J, Laperrière D, Aid M et al. Mechanisms of primary and secondary estrogen target gene regulation in breast cancer cells. Nucleic Acids Res 2008 Jan;36(1):76-93.
}
\examples{
data(erExpression)
## maybe str(erExpression) ; plot(erExpression) ...
}
\keyword{datasets}
