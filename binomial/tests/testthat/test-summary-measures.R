context("Summary Measures")


test_that("aux_mean with invalid lengths", {

  expect_error(aux_mean(trials = 1:5, prob = 0.5))
  expect_error(aux_mean(trials = 5, prob = c(0.4,0.5)))
})


test_that("aux_mean with invalid numbers", {

  expect_error(aux_mean(trials = 5, prob = 2))
  expect_error(aux_mean(trials = -5, prob = 0.5))
  expect_error(aux_mean(trials = 5, prob = -2))
})


test_that("aux_mean with invalid types", {

  expect_error(aux_mean(trials = "five", prob = "point five"))
  expect_error(aux_mean(trials = NA, prob = 0.3))
  expect_error(aux_mean(trials = 5, prob = NA))
})


test_that("aux_variance with invalid lengths", {

  expect_error(aux_variance(trials = 1:5, prob = 0.5))
  expect_error(aux_variance(trials = 5, prob = c(0.4,0.5)))
})


test_that("aux_variance with invalid numbers", {

  expect_error(aux_variance(trials = 5, prob = 2))
  expect_error(aux_variance(trials = -5, prob = 0.5))
  expect_error(aux_variance(trials = 5, prob = -2))
})


test_that("aux_variance with invalid types", {

  expect_error(aux_variance(trials = "five", prob = "point five"))
  expect_error(aux_variance(trials = NA, prob = 0.3))
  expect_error(aux_variance(trials = 5, prob = NA))
})


test_that("aux_mode with invalid lengths", {

  expect_error(aux_mode(trials = 1:5, prob = 0.5))
  expect_error(aux_mode(trials = 5, prob = c(0.4,0.5)))
})


test_that("aux_mode with invalid numbers", {

  expect_error(aux_mode(trials = 5, prob = 2))
  expect_error(aux_mode(trials = -5, prob = 0.5))
  expect_error(aux_mode(trials = 5, prob = -2))
})


test_that("aux_mode with invalid types", {

  expect_error(aux_mode(trials = "five", prob = "point five"))
  expect_error(aux_mode(trials = NA, prob = 0.3))
  expect_error(aux_mode(trials = 5, prob = NA))
})


test_that("aux_skewness with invalid lengths", {

  expect_error(aux_skewness(trials = 1:5, prob = 0.5))
  expect_error(aux_skewness(trials = 5, prob = c(0.4,0.5)))
})


test_that("aux_skewness with invalid numbers", {

  expect_error(aux_skewness(trials = 5, prob = 2))
  expect_error(aux_skewness(trials = -5, prob = 0.5))
  expect_error(aux_skewness(trials = 5, prob = -2))
})


test_that("aux_skewness with invalid types", {

  expect_error(aux_skewness(trials = "five", prob = "point five"))
  expect_error(aux_skewness(trials = NA, prob = 0.3))
  expect_error(aux_skewness(trials = 5, prob = NA))
})


test_that("aux_kurtosis with invalid lengths", {

  expect_error(aux_kurtosis(trials = 1:5, prob = 0.5))
  expect_error(aux_kurtosis(trials = 5, prob = c(0.4,0.5)))
})


test_that("aux_kurtosis with invalid numbers", {

  expect_error(aux_kurtosis(trials = 5, prob = 2))
  expect_error(aux_kurtosis(trials = -5, prob = 0.5))
  expect_error(aux_kurtosis(trials = 5, prob = -2))
})


test_that("aux_kurtosis with invalid types", {

  expect_error(aux_kurtosis(trials = "five", prob = "point five"))
  expect_error(aux_kurtosis(trials = NA, prob = 0.3))
  expect_error(aux_kurtosis(trials = 5, prob = NA))
})
