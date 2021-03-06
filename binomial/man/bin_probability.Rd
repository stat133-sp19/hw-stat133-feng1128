% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/function.R
\name{bin_probability}
\alias{bin_probability}
\title{bin_probability}
\usage{
bin_probability(success, trials, prob)
}
\arguments{
\item{success}{the number of successes}

\item{trials}{the number of trials}

\item{prob}{the probability of success on each trial}
}
\value{
if all of trials, prob and success are valid, then return the binomial probability

if any of trials, prob and success is invalid, then stop and return an error message
}
\description{
calculate the binomial probability of which k successes can occur in n trials with p, the probability of success on each trial
}
\examples{
# probability of getting 2 successes in 5 trials
# assume the probability of success in each trial is 0.5
bin_probability(success = 2, trials = 5, prob = 0.5)
}
