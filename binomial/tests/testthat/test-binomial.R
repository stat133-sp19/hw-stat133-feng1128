context("binomial")

test_that("bin_choose with invalid numbers", {

  expect_error(bin_choose(n = 5,k = 10))
})


test_that("bin_probability with invalid lengths", {

  expect_error(bin_probability(success = 2, trials = 5:10, prob = 0.5))
  expect_error(bin_probability(success = 2, trials = 5, prob = c(0.4,0.5)))
})


test_that("bin_probability with invalid numbers", {

  expect_error(bin_probability(success = 6, trials = 5, prob = 0.5))
  expect_error(bin_probability(success = 2, trials = 5, prob = 2))
  expect_error(bin_probability(success = -1, trials = 2, prob = 1))
})


test_that("bin_probability with invalid types", {

  expect_error(bin_probability(success = "two", trials = 5, prob = 0.5))
  expect_error(bin_probability(success = 2, trials = "five", prob = 0.5))
  expect_error(bin_probability(success = 2, trials = "five", prob = NA))
  expect_error(bin_probability(success = NA, trials = 3, prob = 0.1))
})


test_that("bin_distribution with invalid lengths", {

  expect_error(bin_distribution(trials = 5, prob = c(0,4,0.5)))
  expect_error(bin_distribution(trials = 1:5, prob = 0.5))
})


test_that("bin_distribution with invalid numbers", {

  expect_error(bin_distribution(trials = 5, prob = 2))
  expect_error(bin_distribution(trials = -3, prob = 0.5))
  expect_error(bin_distribution(trials = 3, prob = -0.5))
})


test_that("bin_distribution with invalid types", {

  expect_error(bin_distribution(trials = "five", prob = 0.5))
  expect_error(bin_distribution(trials = 5, prob = "point five"))
  expect_error(bin_distribution(trials = NA, prob = 0.5))
  expect_error(bin_distribution(trials = 5, prob = NA))
})


test_that("bin_cumulative with invalid lengths", {

  expect_error(bin_cumulative(trials = 5, prob = c(0,4,0.5)))
  expect_error(bin_cumulative(trials = 1:5, prob = 0.5))
})


test_that("bin_cumulative with invalid numbers", {

  expect_error(bin_cumulative(trials = 5, prob = 2))
  expect_error(bin_cumulative(trials = -3, prob = 0.5))
  expect_error(bin_cumulative(trials = 3, prob = -0.5))
})


test_that("bin_cumulative with invalid types", {

  expect_error(bin_cumulative(trials = "five", prob = 0.5))
  expect_error(bin_cumulative(trials = 5, prob = "point five"))
  expect_error(bin_cumulative(trials = NA, prob = 0.5))
  expect_error(bin_cumulative(trials = 5, prob = NA))
})


test_that("bin_variable with invalid lengths", {

  expect_error(bin_variable(trials = 5, prob = c(0,4,0.5)))
  expect_error(bin_variable(trials = 1:5, prob = 0.5))
})


test_that("bin_variable with invalid numbers", {

  expect_error(bin_variable(trials = 5, prob = 2))
  expect_error(bin_variable(trials = -3, prob = 0.5))
  expect_error(bin_variable(trials = 3, prob = -0.5))
})


test_that("bin_variable with invalid types", {

  expect_error(bin_variable(trials = "five", prob = 0.5))
  expect_error(bin_variable(trials = 5, prob = "point five"))
  expect_error(bin_variable(trials = NA, prob = 0.5))
  expect_error(bin_variable(trials = 5, prob = NA))
})
