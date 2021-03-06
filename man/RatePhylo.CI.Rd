\name{RatePhylo.CI}
\alias{RatePhylo.CI}
\title{
Confidence intervals for rate parameters

}
\description{
Calculates approximate confidence intervals for all rate parameters. CIs are esimated for one rate 
parameters while fixing others at a given value (usually the maximum likelihood estimate).

These are reliable (given the asympotic assumptions of the chi-square distribution) if only two 
groups are being compared but should be regarded only as a rough approximation for =>3 different 
rate categories. If the rates are correlated the CIs may be underestimated.}
\usage{
RatePhylo.CI(rateData, MLrate = NULL, fixed, rateMIN = 0.001, rateMAX = 50, common.mean = FALSE, lambda.est=TRUE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{rateData}{
an object of class "rateData"
}
  \item{MLrate}{
a vector of relative rate parameters. The length of the vector is equal to the number of rates being
estimated. If \code{rate=NULL} then rates are equal. Normally these will be the maximum likelihood 
rate estimates.}
  \item{fixed}{
A vector stating whether each parameter should be allowed to vary (either \code{FALSE} which results
in a start value of 1, or a numeric start value) or should be fixed (\code{TRUE}).}
   \item{rateMIN}{
Minimum value for the rate parameters}
  \item{rateMAX}{
Maximum value for the rate parameters}
  \item{common.mean}{
a logical specififying whether each rate category should have its own mean (\code{common.mean=FALSE})
or all categories should have the same mean (\code{common.mean=FALSE}). See Thomas et al. (2009) for
a discussion on the impact of assumptions about mean on rate estimates.}
\item{lambda.est}{
Logical. Estimate Pagel's lambda. }
}

\value{

\item{rateLci }{Lower confidence interval for rate estimate}
\item{rateUci }{Upper confidence interval for rate estimate}

}
\references{
Thomas GH, Freckleton RP, & Szekely T. 2006. Comparative analyses of the influence of developmental
mode on phenotypic diversification rates in shorebirds. Proceedings of the Royal Society B 273, 
1619-1624.

Thomas GH, Meiri S, & Phillimore AB. 2009. Body size diversification in Anolis: novel environments
and island effects. Evolution 63, 2017-2030.}
\author{
Gavin Thomas, Rob Freckleton}


%% ~Make other sections like Warning with \section{Warning }{....} ~


\examples{
data(anolis.tree)
data(anolis.data)

## Convert data to class rateData with a rateMatrix object as input
anolis.rateMatrix <- as.rateMatrix(phy=anolis.tree, x="geo_ecomorph", data=anolis.data)

anolis.rateData <- as.rateData(y="Female_SVL", x="geo_ecomorph", 
rateMatrix = anolis.rateMatrix, phy=NULL, data=anolis.data, log.y=TRUE)

# A model with a different rate in each of the four groups. The 'fixed' command is used to determine 
# whether a particular rate is to be constrained or not. Use '1' to fix a group and 'FALSE' to show 
# that the parameter is not fixed and should be estimated. The values should be entered in the same
# order as the ranking of the groups. That is, group 0 (small islands) takes position one in the 
# fixed vector, group 1 (large island trunk crown and trunk ground) takes position 2 and so on. The
# default is to allow each group to take a different mean. 

#anole.ML <- optim.likRatePhylo(rateData=anolis.rateData, rate=NULL, fixed=c(FALSE,FALSE,FALSE, FALSE),
#common.mean=FALSE) # ML estimates

# Confidence intervals for each parameter in turn
# Not run
# RatePhylo.CI(rateData=anolis.rateData, MLrate = anole.ML$MLRate, fixed=c(FALSE, TRUE, TRUE, TRUE), 
#rateMIN = 0.001, rateMAX = 50, common.mean = FALSE)

# Not run
#RatePhylo.CI(rateData=anolis.rateData, MLrate = anole.ML$MLRate, fixed=c(TRUE, FALSE, TRUE, TRUE), 
#rateMIN = 0.001, rateMAX = 50, common.mean = FALSE)

# Not run
#RatePhylo.CI(rateData=anolis.rateData, MLrate = anole.ML$MLRate, fixed=c(TRUE, TRUE, FALSE, TRUE), 
#rateMIN = 0.001, rateMAX = 50, common.mean = FALSE)

# Not run
#RatePhylo.CI(rateData=anolis.rateData, MLrate = anole.ML$MLRate, fixed=c(TRUE, TRUE, FALSE, TRUE), 
#rateMIN = 0.001, rateMAX = 50, common.mean = FALSE)

# All confidence intervals together
# Not run
#RatePhylo.allCI(rateData=anolis.rateData, MLrate = anole.ML$MLRate, fixed = NULL, rateMIN = 0.001, 
#rateMAX = 50, common.mean = FALSE) 
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
