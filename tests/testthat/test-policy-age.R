context("Policy: Age")

test_that("normal ages are fine", {
  expect_length(policyAgeEvaluation(18L), 0)
  expect_length(policyAgeEvaluation(22L), 0)
  expect_length(policyAgeEvaluation(40L), 0)
  expect_length(policyAgeEvaluation(50L), 0)
  expect_length(policyAgeEvaluation(55L), 0)
})

test_that("under age triggers a violation", {
  # theoretically even babies could get a loan
  for (age in c(0L, 1L, 12L, 17L)) {
    expect_length(policyAgeEvaluation(age), 1)
    expect_match(policyAgeEvaluation(age), c("AGE-U"))
  }
})

test_that("negative age triggers an error", {
  expect_error(policyAgeEvaluation(-1L))
  expect_error(policyAgeEvaluation(-12L))
  expect_error(policyAgeEvaluation(-17L))
})

test_that("over age triggers a violation", {
  # higher risk for people above a certain age
  for (age in c(56L, 60L, 100L)) {
    expect_length(policyAgeEvaluation(age), 1)
    expect_match(policyAgeEvaluation(age), c("AGE-O"))
  }
})

test_that("invalid values trigger an error", {
  expect_error(policyAgeEvaluation("error"))
  expect_error(policyAgeEvaluation(1.1))
})
