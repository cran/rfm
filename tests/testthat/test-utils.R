test_that('output from bins is as expected', {

  actual <- bins(mtcars, "mpg", 5)
  expected <- c(16.20, 18.92, 22.00, 25.08)
  expect_equal(actual, expected)

})

test_that('output from bins_lower is as expected', {

  actual <- bins_lower(mtcars, "mpg", 5)
  expected <- c(10.4, 5.0)
  expect_equal(actual, expected)
})

test_that('output from bins_upper is as expected', {

  actual <- bins_upper(mtcars, "mpg", 5)
  expected <- c(5.0, 34.9)
  expect_equal(actual, expected)
})

test_that('output from rfm_heatmap_data is as expected', {

  analysis_date <- as.Date('2006-12-31')

  actual <-
    rfm_table_order(rfm_data_orders, customer_id, order_date, revenue, analysis_date) %>%
    rfm_heatmap_data() %>%
    use_series(monetary) %>%
    sum() %>%
    round()

  expected <- 12634
  expect_equal(actual, expected)

})

test_that('output from check_levels is as expected', {

  analysis_date <- as.Date('2006-12-31')

  actual <-
    rfm_table_order(rfm_data_orders, customer_id, order_date, revenue, analysis_date) %>%
    rfm_heatmap_data() %>%
    check_levels(column = "recency_score")

  expected <- c(1, 2, 3, 4, 5)
  expect_equal(actual, expected)

})

test_that('output from modify_rfm is as expected', {

  analysis_date <- as.Date('2006-12-31')

  heat <-
    rfm_table_order(rfm_data_orders, customer_id, order_date, revenue, analysis_date) %>%
    rfm_heatmap_data()

  clevel <- check_levels(heat, column = 2)

  actual <-
    modify_rfm(heat, 5, clevel) %>%
    use_series(monetary) %>%
    sum() %>%
    round()

  expected <- 12634
  expect_equal(actual, expected)

})
