context("Target packages")

test_that("bootstrap", {
  expect_that(exists("install_github"), is_false())
  expect_that("devtools" %in% .packages(), is_false())
})

test_that("target with no extra packages", {
  cleanup()
  m <- remake("remake_target_packages.yml")
  t <- m$targets[["will_not_load"]]
  expect_that(t$packages, is_null())
  x <- remake_make(m, "will_not_load")
  expect_that(x, is_false())
})

test_that("target that loads extra package", {
  cleanup()
  m <- remake("remake_target_packages.yml")
  t <- m$targets[["will_load"]]
  expect_that(t$packages, equals("devtools"))
  x <- remake_make(m, "will_load")
  expect_that(x, is_true())
  expect_that("devtools" %in% .packages(), is_false())
})
