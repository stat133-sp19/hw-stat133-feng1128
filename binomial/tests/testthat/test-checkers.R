context("Checkers")

test_that("check_prob with ok length", {

  expect_true(check_prob(0.5))
  expect_true(check_prob(1))
})

test_that("check_prob with invalid lengths", {

  expect_error(check_prob(1:5))
  expect_error(check_prob(c(1,2)))
})


test_that("check_prob with ok numbers", {

  expect_true(check_prob(0.2))
  expect_true(check_prob(0))
})

test_that("check_prob with invalid numbers", {

  expect_error(check_prob(-1))
  expect_error(check_prob(3))
})


test_that("check_prob with ok type", {

  expect_true(check_prob(0.3))
  expect_true(check_prob(0.4))
})

test_that("check_prob with invalid types", {

  expect_error(check_prob("zero"))
  expect_error(check_prob(NA))
})


test_that("check_trials with ok length", {

  expect_true(check_trials(10))
  expect_true(check_trials(100))
})

test_that("check_trials with invalid lengths", {

  expect_error(check_trials(1:10))
  expect_error(check_trials(c(3,4)))
})


test_that("check_trials with ok numbers", {

  expect_true(check_trials(5))
  expect_true(check_trials(0))
})

test_that("check_trials with invalid numbers", {

  expect_error(check_trials(-10))
})


test_that("check_trials with ok type", {

  expect_true(check_trials(11))
  expect_true(check_trials(28))
})

test_that("check_trials with invalid types", {

  expect_error(check_trials("ten"))
  expect_error(check_trials(NA))
})


test_that("check_success with ok lengths", {

  expect_true(check_success(success = 5, trials = 10))
  expect_true(check_success(success = 0:5, trials = 10))
})

test_that("check_success with invalid lengths", {

  expect_error(check_success(success = 5, trials = 6:10))
  expect_error(check_success(success = 0:5, trials = c(7,8)))
})


test_that("check_success with ok numbers", {

  expect_true(check_success(success = 5, trials = 10))
  expect_true(check_success(success = 0:5, trials = 10))
})

test_that("check_success with invalid numbers", {

  expect_error(check_success(success = 5, trials = 4))
  expect_error(check_success(success = 0:5, trials = 4))
  expect_error(check_success(success = -3, trials = -4))
})


test_that("check_success with ok types", {

  expect_true(check_success(success = 5, trials = 7))
  expect_true(check_success(success = 0:5, trials = 5))
})

test_that("check_success with invalid types", {

  expect_error(check_success(success = "five", trials = 7))
  expect_error(check_success(success = 5, trials = "seven"))
  expect_error(check_success(success = NA, trials = "8"))
  expect_error(check_success(success = 5, trials = NA))
})
