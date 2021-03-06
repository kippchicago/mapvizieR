context("mapvizier filter tests")

test_that("mapvizier filters cdf year", {
  filter_ex <- mv_filter(
    mapvizieR_obj = mapviz, 
    cdf_filter = quote(map_year_academic == 2013)
  )
  
  expect_equal(nrow(filter_ex[['cdf']]), 6558)
  expect_equal(unique(filter_ex[['cdf']]$map_year_academic), 2013)

  filter_ex <- mv_filter(
    mapvizieR_obj = mapviz, 
    cdf_filter = quote(map_year_academic == 2012)
  )
  
  expect_equal(nrow(filter_ex[['cdf']]), 1993)
  expect_equal(unique(filter_ex[['cdf']]$map_year_academic), 2012)
})
  

test_that("mapvizier filters cdf grade", {
  filter_ex <- mv_filter(
    mapvizieR_obj = mapviz, 
    cdf_filter = quote(grade == 6)
  )
  
  expect_equal(nrow(filter_ex[['cdf']]), 1185)
  expect_equal(unique(filter_ex[['cdf']]$grade), 6)
  expect_equal(unique(filter_ex[['cdf']]$map_year_academic), c(2013, 2012))
})
  

test_that("mapvizier filters cdf year and grade", {
  filter_ex <- mv_filter(
    mapvizieR_obj = mapviz, 
    cdf_filter = quote(map_year_academic == 2013 & grade == 6)
  )
  
  expect_equal(nrow(filter_ex[['cdf']]), 837)
  expect_equal(unique(filter_ex[['cdf']]$grade), 6)
  expect_equal(unique(filter_ex[['cdf']]$map_year_academic), 2013)
})



test_that("mapvizier filters roster one category", {
  filter_ex <- mv_filter(
    mapvizieR_obj = mapviz, 
    roster_filter = quote(schoolname == "Three Sisters Elementary School")
  )
  expect_equal(unique(filter_ex[['roster']]$schoolname), "Three Sisters Elementary School")
  expect_equal(nrow(filter_ex[['cdf']]), 1883)
  expect_true(
    all(unique(filter_ex[['cdf']]$studentid) %in% unique(filter_ex[['roster']]$studentid))
  )
})


test_that("mapvizier filters roster two categories", {
  #students who were ever in the 3rd grade (kind of weird - remember that roster has *all* enrollments)
  filter_ex <- mv_filter(
    mapvizieR_obj = mapviz, 
    roster_filter = quote(schoolname == "Three Sisters Elementary School" &  grade == 3)
  )
  
  expect_equal(nrow(filter_ex[['cdf']]), 656)
})


test_that("mapvizier filters cdf AND roster", {
  #students who were ever in the 3rd grade (kind of weird - remember that roster has *all* enrollments)
  filter_ex <- mv_filter(
    mapvizieR_obj = mapviz, 
    cdf_filter = quote(map_year_academic == 2013),
    roster_filter = quote(schoolname == "Three Sisters Elementary School")
  )
  
  expect_equal(nrow(filter_ex[['cdf']]), 1401)
})


test_that("mapvizier filters errors if not given at least one option", {
  expect_error(
    mv_filter(mapvizieR_obj = mapviz), "at least one type of filter needed"
  )
})