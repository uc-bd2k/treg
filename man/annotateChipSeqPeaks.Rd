\name{annotateChipSeqPeaks}
\alias{annotateChipSeqPeaks}
\title{Function to match each peaks to associated genes in terms of RefID}
\description{
  This function is intended to search all peaks within up and down distances for each gene. Users could specify their own platforms or the function will download platform from UCSC as default.
}
\usage{
annotateChipSeqPeaks(chip.seq,transcriptDB = NULL, species = "Hs", distanceRange = c(-1e+06,1e+06), file = NULL)
}
\arguments{
  \item{chip.seq}{ A matrix listing all CHIP-Seq peaks in which the chromosome ID for all peaks are listed in the first column, peaks' start positions are listed in the second column, peaks' end position are listed in the third column, peaks' ID are listed in the forth column and the fifth column lists peaks' score.}
  \item{transcriptDB}{Transcript definition table created by makeTranscriptDbFromUCSC function.}
  \item{distanceRange}{The up- and downstream window aroung gene TSS to be used in associating peaks to a gene. The default is c(-1e+06,1e+06)}
}
\details{
  This function is intended to search all peaks within up and down distances for each gene.
}
\value{
  This function returns a matrix in which the first column contains the RefSeqID, the second column contains Entrez ID , the third column contains chromosome ID, the fourth column contains the absolute distance from each peak to transcription start site and the fifth column contains chip-seq score. 
}
\references{ Publication forthcoming. }
\author{Zhen Hu }
\seealso{}
\examples{
library(treg)
data(erAlpha)
RefTable<-makeTranscriptDbFromUCSC(genome="hg18",tablename="refGene")
ChipSeq<-annotateChipSeqPeaks(chip.seq=erAlpha[[3]],transcriptDB=RefTable,distanceRange=c(-1e+06,1e+06))
tregBindingERalpha<-chipSeqWeightedSum(ChipSeq,verbose=T,genome=RefTable)
}
\keyword{ chip-seq }

