test_that("Test for eris_convert_dtc", {
  eris_convert_dtc_input <- haven::read_sas(file.path(
    test_path("eris", "data"),
    "eris_convert_dtc_input.sas7bdat"
  ))

  expected_output <- haven::read_sas(file.path(
    test_path("eris", "data"),
    "eris_convert_dtc_output.sas7bdat"
  )) %>% purrr::modify(function(x) {
    attr(x, "format.sas") <- NULL
    x
  })

  actual_output <- eris_convert_dtc_input %>%
    derive_vars_dtm(new_vars_prefix = "AST", dtc = MHSTDTC, flag_imputation = "none") %>%
    derive_vars_dt(new_vars_prefix = "AST", dtc = MHSTDTC, flag_imputation = "none") %>%
    derive_vars_dtm_to_tm(exprs(ASTDTM))

  expect_dfs_equal(
    base = expected_output,
    compare = actual_output,
    keys = c("MHSTDTC")
  )
})

# For variables only have date part, eris do not create the DTM and TM
# but the admiral impute with "00::00:00"
