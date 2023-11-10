test_that('No NA', {
  df1 <- data.frame(
    Grp = c('A', 'A', 'B'),
    Val = c(1,2,10)
  )
  expect_equal(fn.Summarize.by.Group(df1, 'Grp', 'Val')[1,2], 2)
  expect_equal(fn.Summarize.by.Group(df1, 'Grp', 'Val')[1,3], 3)
}
)


test_that('With NA', {
  df1 <- data.frame(
    Grp = c('A', 'A', 'B'),
    Val = c(1,NA,10)
  )
  expect_equal(fn.Summarize.by.Group(df1, 'Grp', 'Val')[1,2], 1)
  expect_equal(fn.Summarize.by.Group(df1, 'Grp', 'Val')[1,3], 1)
})


test_that('Numeric column mixed with strings', {
  df1 <- data.frame(
    Grp = c('A', 'A', 'B'),
    Val = c(1,'String',10)
  )
  expect_error(fn.Summarize.by.Group(df1, 'Grp', 'Val'))
})


test_that('Empty data frame', {
  df1 <- data.frame(
    Grp = NA,
    Val = NA
  )
  expect_error(fn.Summarize.by.Group(df1, 'Grp', 'Val'))
})


test_that('Group/Metric not found in df', {
  df1 <- data.frame(
    Grp = c('A', 'A', 'B'),
    Val = c(1,2,10)
  )
  expect_error(fn.Summarize.by.Group(df1, 'Group', 'Val'))
})