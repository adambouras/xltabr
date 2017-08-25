test_that("Run through style_catalogue functions from reading style sheet to adding to final style_catalogue and wb", {

  path <- system.file("extdata", "styles.xlsx", package = "xltabr")
  num_path <- system.file("extdata", "style_to_excel_number_format_alt.csv", package = "xltabr")

  tab <- style_catalogue_initialise(list(), styles_xlsx = path, num_styles_csv = num_path)

  style_key_test <- "fontName_Calibri|fontSize_12|textDecoration_BOLD%ITALIC"

  t1 <- xltabr:::style_key_parser(style_key_test)

  expect_true(all(names(t1) == c("fontName", "fontSize", "textDecoration")))
  expect_true(t1[["fontName"]] == "Calibri")
  expect_true(t1[["fontSize"]] == "12")
  expect_true(all(t1[["textDecoration"]] == c("BOLD","ITALIC")))

  expect_true(xltabr:::create_style_key(t1) == style_key_test)

})
