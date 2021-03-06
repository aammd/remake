context("Graph")

test_that("Simple order", {
  graph <- list(b=NULL,
                e="k",
                k=c("b", "i", "j"),
                g=c("k", "h"),
                i=NULL,
                j=NULL,
                h="i",
                c=c("j", "h"))
  order <- topological_order(graph)
  expect_that(order,
              equals(c("b", "i", "j", "k", "e", "h", "g", "c")))
  expect_that(topological_sort(graph),
              equals(graph[order]))
})

test_that("Cycle detection", {
  expect_that(topological_order(list(a="a")),
              throws_error("cyclic dependency"))
  expect_that(topological_order(list(a="b", b="c", c="a")),
              throws_error("cyclic dependency"))
})

test_that("Dependency filtering", {
  graph <- list(a="b", b="c", c="d", d=NULL)
  expect_that(dependencies("a", graph), equals(letters[1:4]))
  expect_that(dependencies("b", graph), equals(letters[2:4]))
  expect_that(dependencies("c", graph), equals(letters[3:4]))
  expect_that(dependencies("d", graph), equals("d"))
})
