% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/function.R
\name{bin_skewness}
\alias{bin_skewness}
\title{bin_skewness}
\usage{
bin_skewness(trials, prob)
}
\arguments{
\item{trials}{the number of trials}

\item{prob}{the probability of success on each trial}
}
\value{
the skewness of a random binomial variable
}
\description{
calculate the skewness of a random binomial variable
}
\examples{
# the skewness of 5 trials with the probability of success in each trial = 0.5
bin_skewness(5, 0.5)
}
