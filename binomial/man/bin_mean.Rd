% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/function.R
\name{bin_mean}
\alias{bin_mean}
\title{bin_mean}
\usage{
bin_mean(trials, prob)
}
\arguments{
\item{trials}{the number of trials}

\item{prob}{the probability of success on each trial}
}
\value{
the mean of a random binomial variable
}
\description{
calculate the mean of a random binomial variable
}
\examples{
# the mean of 5 trials with the probability of success in each trial = 0.5
bin_mean(5, 0.5)
}
