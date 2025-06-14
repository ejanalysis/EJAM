
# some functions may not be exported like fixmapheadernamescolname()

test_that("varinfo() works for test case1", {

  t1 <- t2 <- t3 <- t4 <- tt1 <- tt2 <- tt3 <- tt4 <- NA
  x = "rname"
  x = "long" # fails if just using varinfo2

  # t1 <-
  expect_no_error(
    suppressWarnings({
      z <- varinfo(var =   'pctmin',       info = 'decimals')
    })
  )
expect_true("data.frame" %in% class(z))
})

test_that("varinfo() works for test case2", {

  t1 <- t2 <- t3 <- t4 <- tt1 <- tt2 <- tt3 <- tt4 <- NA
  x = "rname"
  x = "long" # fails if just using varinfo2


  # t2 <-
  expect_no_error({
    z <- varinfo(var = c('pctmin','pm'), info = 'decimals')
    })
  expect_true("data.frame" %in% class(z))
})

test_that("varinfo() works for test case3", {

  t1 <- t2 <- t3 <- t4 <- tt1 <- tt2 <- tt3 <- tt4 <- NA
  x = "rname"
  x = "long" # fails if just using varinfo2

  # t3 <-
  expect_no_error({
    z <- varinfo(var =   'pctmin',       info = c('decimals', x))
    })
  expect_true("data.frame" %in% class(z))
})

test_that("varinfo() works for test case4", {

  t1 <- t2 <- t3 <- t4 <- tt1 <- tt2 <- tt3 <- tt4 <- NA
  x = "rname"
  x = "long" # fails if just using varinfo2

  # t4 <-
  expect_no_error({
    tested <- c('pctmin','pm')
    z <- varinfo(var = tested, info = c('decimals', x))
    })
  expect_true("data.frame" %in% class(z))
  expect_equal(rownames(z), tested)
})

testthat::test_that("varinfo() output is of expected class, format for 1 or more values of var and 1 or more values of info", {
  x = "long"
  expect_type(    varinfo(var = c('pctmin','pm'), info = c('decimals', x)), "list")

  expect_s3_class(varinfo(var = c('pctmin' ),     info = c('decimals'   )), "data.frame") # 1 and 1
  expect_s3_class(varinfo(var = c('pctmin','pm'), info = c('decimals'   )), "data.frame") # n and 1
  expect_s3_class(varinfo(var = c('pctmin'     ), info = c('decimals', x)), "data.frame") # 1 and n
  expect_s3_class(varinfo(var = c('pctmin','pm'), info = c('decimals', x)), "data.frame") # n and n

})
