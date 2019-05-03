#' @title bin_choose
#' @description calculate the number of combinations in which k successes can occur in n trials
#' @param n number of trials
#' @param k number of successes
#' @return if n > k,then return he number of combinations in which k successes can occur in n trials
#' @return if n < k, then stop and return an error message
#' @export
#' @examples
#' # the number of combinations in which 2 successes can occur in 5 trials
#' bin_choose(n = 5,k = 2)
bin_choose <- function(n, k){

  if (!(is.numeric(n) & is.numeric(k))) {
    stop("\n'n' and 'k' must be numeric")
  }
  if (any(is.na(n)) | any(is.na(k))) {
    stop("\n'n' and 'k' cannot contain missing values")
  }
  if (any(n < 0) | any(k < 0)) {
    stop("\n'n' and 'k' must be non-negative")
  }
  if (k > n){
    stop("\n'k' cannot be greater than 'n'")
  }
  factorial(n)/(factorial(k)*factorial(n-k))
}


#' @title bin_probability
#' @description calculate the binomial probability of which k successes can occur in n trials with p, the probability of success on each trial
#' @param success the number of successes
#' @param trials the number of trials
#' @param prob the probability of success on each trial
#' @return if all of trials, prob and success are valid, then return the binomial probability
#' @return if any of trials, prob and success is invalid, then stop and return an error message
#' @export
#' @examples
#' # probability of getting 2 successes in 5 trials
#' # assume the probability of success in each trial is 0.5
#' bin_probability(success = 2, trials = 5, prob = 0.5)
bin_probability <- function(success, trials, prob){
  check_trials(trials)
  check_prob(prob)
  check_success(success, trials)
  bin_choose(trials, success)*(prob^success)*((1-prob)^(trials-success))
}


#' @title bin_distribution
#' @description create a data frame with the probability distribution
#' @param trials the number of trials
#' @param prob the probability of success on each trial
#' @return a data frame with the probability distribution
#' @export
#' @examples
#' # the probability distribution of 5 trials
#' # assume the probability of success in each trial is 0.5
#' bin_distribution(trials =5, prob = 0.5)
bin_distribution <- function(trials, prob){
  v <- vector()
  for(i in 1:(trials+1)){
    v[i] <- bin_probability(i-1, trials, prob)
    }
  df <- data.frame(success = 0:trials,
                   probability = v)
  class(df) <- c("bindis", "data.frame")
  df
}


#' @export
plot.bindis <- function(dis1){
  barplot(dis1$probability,
          xlab = "successes",
          ylab = "probability")
}


#' @title bin_cumulative
#' @description create a data frame with the binomial cumulative distribution
#' @param trials the number of trials
#' @param prob the probability of success on each trial
#' @return a data frame with the probability distribution and cumulative probabilities
#' @export
#' @examples
#' # the binomial cumulative distribution of 5 trials
#' # assume the probability of success in each trial is 0.5
#' bin_cumulative(trials =5, prob = 0.5)
bin_cumulative <- function(trials, prob){
  a <- vector()
  b <- vector()
  for(i in 1:(trials+1)){
    a[i] <- bin_probability(i-1, trials, prob)
    if(i == 1){
      b[i] <- a[i]
    }
    if(i > 1){
      b[i] <- a[i] + b[i-1]
    }
  }
  df1 <- data.frame(success = 0:trials,
                    probability = a,
                    cumulative = b)
  class(df1) <- c("bincum", "data.frame")
  df1
}


#' @export
plot.bincum <- function(dis2){
  plot(dis2$success, dis2$cumulative,
       type = "o",
       xlab = "successes",
       ylab = "probability")
}


#' @title bin_variable
#' @description create a list with named elements trials and prob
#' @param trials the number of trials
#' @param prob the probability of success on each trial
#' @return a list with named elements trials and prob
#' @export
#' @examples
#' # the binomial probability of 5 trials
#' # assume the probability of success in each trial is 0.5
#' bin_variable(trials =5, prob = 0.5)
bin_variable <- function(trials, prob){
  check_trials(trials)
  check_prob(prob)
  object <- list(trials = trials,
                 prob = prob)
  class(object) <- "binvar"
  object
}


#' @export
print.binvar <- function(x){
    cat('"Binomial variable"\n\n')
    cat("Parameters","\n")
    cat(sprintf('- number of trials: %s', x$trials[[1]]), "\n")
    cat(sprintf('- prob of success: %s', x$prob[[1]]), "\n")
    invisible(x)
}


#' @export
summary.binvar <- function(x) {
  trials <- x$trials[[1]]
  prob <- x$prob[[1]]
  mean <- aux_mean(x$trials[[1]], x$prob[[1]])
  variance <- aux_variance(x$trials[[1]], x$prob[[1]])
  mode <- aux_mode(x$trials[[1]], x$prob[[1]])
  skewness <- aux_skewness(x$trials[[1]], x$prob[[1]])
  kurtosis <- aux_kurtosis(x$trials[[1]], x$prob[[1]])
  object1 <- list(trials = trials,
              prob = prob,
              mean = mean,
              variance = variance,
              mode = mode,
              skewness = skewness,
              kurtosis = kurtosis)
  class(object1) <- "summary.binvar"
  object1
}


#' @export
print.summary.binvar <- function(x) {
  cat('"Summary Binomial"\n\n')
  cat("Parameters","\n")
  cat(sprintf('- number of trials: %s', x$trials), "\n")
  cat(sprintf('- prob of success: %s', x$prob), "\n")
  cat("\n")
  cat("Measures","\n")
  cat(sprintf('- mean: %s', x$mean), "\n")
  cat(sprintf('- variance: %s', x$variance), "\n")
  cat(sprintf('- mode: %s', x$mode), "\n")
  cat(sprintf('- skewness: %s', x$skewness), "\n")
  cat(sprintf('- kurtosis: %s', x$kurtosis), "\n")
  invisible(x)
}


#' @title bin_mean
#' @description calculate the mean of a random binomial variable
#' @param trials the number of trials
#' @param prob the probability of success on each trial
#' @return the mean of a random binomial variable
#' @export
#' @examples
#' # the mean of 5 trials with the probability of success in each trial = 0.5
#' bin_mean(5, 0.5)
bin_mean <- function(trials, prob){
  check_trials(trials)
  check_prob(prob)
  aux_mean(trials, prob)
}


#' @title bin_variance
#' @description calculate the variance of a random binomial variable
#' @param trials the number of trials
#' @param prob the probability of success on each trial
#' @return the variance of a random binomial variable
#' @export
#' @examples
#' # the variance of 5 trials with the probability of success in each trial = 0.5
#' bin_variance(5, 0.5)
bin_variance <- function(trials, prob){
  check_trials(trials)
  check_prob(prob)
  aux_variance(trials, prob)
}


#' @title bin_mode
#' @description calculate the mode of a random binomial variable
#' @param trials the number of trials
#' @param prob the probability of success on each trial
#' @return the mode of a random binomial variable
#' @export
#' @examples
#' # the mode of 5 trials with the probability of success in each trial = 0.5
#' bin_mode(5, 0.5)
bin_mode <- function(trials, prob){
  check_trials(trials)
  check_prob(prob)
  aux_mode(trials, prob)
}


#' @title bin_skewness
#' @description calculate the skewness of a random binomial variable
#' @param trials the number of trials
#' @param prob the probability of success on each trial
#' @return the skewness of a random binomial variable
#' @export
#' @examples
#' # the skewness of 5 trials with the probability of success in each trial = 0.5
#' bin_skewness(5, 0.5)
bin_skewness <- function(trials, prob){
  check_trials(trials)
  check_prob(prob)
  aux_skewness(trials, prob)
}


#' @title bin_kurtosis
#' @description calculate the kurtosis of a random binomial variable
#' @param trials the number of trials
#' @param prob the probability of success on each trial
#' @return the kurtosis of a random binomial variable
#' @export
#' @examples
#' # the kurtosis of 5 trials with the probability of success in each trial = 0.5
#' bin_kurtosis(5, 0.5)
bin_kurtosis <- function(trials, prob){
  check_trials(trials)
  check_prob(prob)
  aux_kurtosis(trials, prob)
}


# private function to check the value of input probability
check_prob <- function(prob) {
  if (length(prob) != 1) {
    stop("\n'prob' must be a vector of length 1")
  }
  if (!is.numeric(prob)) {
    stop("\n'prob' must be numeric ")
  }
  if (any(is.na(prob))) {
    stop("\n'prob' cannot contain missing values")
  }
  if (any(prob < 0) | any(prob > 1)) {
    stop("\n'prob' values must be between 0 and 1")
  }
  TRUE
}

# private function to check the value of input trials
check_trials <- function(trials) {
  if (length(trials) != 1) {
    stop("\n'trials' must be a vector of length 1")
  }
  if (!is.numeric(trials)) {
    stop("\n'trials' must be numeric")
  }
  if (any(is.na(trials))) {
    stop("\n'trials' cannot contain missing values")
  }
  if (any(trials < 0)) {
    stop("\n'trials' values must be non-negative")
  }
  TRUE
}

# private function to check the value of successes
check_success <- function(success, trials) {
  if (length(trials) != 1) {
    stop("\n'trials' must be a vector of length 1")
  }
  if (!(is.numeric(success) & is.numeric(trials))) {
    stop("\n'success' and 'trials' must be numeric")
  }
  if (any(is.na(success)) | any(is.na(trials))) {
    stop("\n'success' and 'trials' cannot contain missing values")
  }
  if (any(trials < 0) | any(success < 0) | any(success > trials)) {
    stop("\n'success' and 'trials' must be non-negative and 'success' cannot be greater than 'trials'")
  }
  TRUE
}

# private function to compute the mean
aux_mean <- function(trials, prob){
  if (length(trials) != 1 | length(prob) != 1) {
    stop("\n'trials' and 'prob' must be a vector of length 1")
  }
  if (!(is.numeric(trials) & is.numeric(prob))) {
    stop("\n'prob' and 'trials' must be numeric")
  }
  if (any(is.na(prob)) | any(is.na(trials))) {
    stop("\n'prob' and 'trials' cannot contain missing values")
  }
  if (any(trials < 0) | any(prob < 0) | any(prob > 1)) {
    stop("\n'trials' must be non-negative and 'prob' should be between 0 and 1")
  }
  trials*prob
}

# private function to compute the variance
aux_variance <- function(trials, prob){
  if (length(trials) != 1 | length(prob) != 1) {
    stop("\n'trials' and 'prob' must be a vector of length 1")
  }
  if (!(is.numeric(trials) & is.numeric(prob))) {
    stop("\n'prob' and 'trials' must be numeric")
  }
  if (any(is.na(prob)) | any(is.na(trials))) {
    stop("\n'prob' and 'trials' cannot contain missing values")
  }
  if (any(trials < 0) | any(prob < 0) | any(prob > 1)) {
    stop("\n'trials' must be non-negative and 'prob' should be between 0 and 1")
  }
  trials*prob*(1-prob)
}

# private function to compute the mode
aux_mode <- function(trials, prob){
  if (length(trials) != 1 | length(prob) != 1) {
    stop("\n'trials' and 'prob' must be a vector of length 1")
  }
  if (!(is.numeric(trials) & is.numeric(prob))) {
    stop("\n'prob' and 'trials' must be numeric")
  }
  if (any(is.na(prob)) | any(is.na(trials))) {
    stop("\n'prob' and 'trials' cannot contain missing values")
  }
  if (any(trials < 0) | any(prob < 0) | any(prob > 1)) {
    stop("\n'trials' must be non-negative and 'prob' should be between 0 and 1")
  }
  m <- trials*prob+prob
  n <- as.integer(m)
  if(m %% n == 0){
    output <- c(n, n-1)
    output
  }
  else{
    n
  }
}

# private function to compute the skewness
aux_skewness <- function(trials, prob){
  if (length(trials) != 1 | length(prob) != 1) {
    stop("\n'trials' and 'prob' must be a vector of length 1")
  }
  if (!(is.numeric(trials) & is.numeric(prob))) {
    stop("\n'prob' and 'trials' must be numeric")
  }
  if (any(is.na(prob)) | any(is.na(trials))) {
    stop("\n'prob' and 'trials' cannot contain missing values")
  }
  if (any(trials < 0) | any(prob < 0) | any(prob > 1)) {
    stop("\n'trials' must be non-negative and 'prob' should be between 0 and 1")
  }
  (1-2*prob)/(sqrt(trials*prob*(1-prob)))
}

# private function to compute the kurtosis
aux_kurtosis <- function(trials, prob){
  if (length(trials) != 1 | length(prob) != 1) {
    stop("\n'trials' and 'prob' must be a vector of length 1")
  }
  if (!(is.numeric(trials) & is.numeric(prob))) {
    stop("\n'prob' and 'trials' must be numeric")
  }
  if (any(is.na(prob)) | any(is.na(trials))) {
    stop("\n'prob' and 'trials' cannot contain missing values")
  }
  if (any(trials < 0) | any(prob < 0) | any(prob > 1)) {
    stop("\n'trials' must be non-negative and 'prob' should be between 0 and 1")
  }
  (1-6*prob*(1-prob))/(trials*prob*(1-prob))
}
