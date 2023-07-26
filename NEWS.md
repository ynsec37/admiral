# admiral 0.12.0

## New Features

## Updates of Existing Functions
- The functions `derive_param_bmi()` and `derive_param_bsa()` are updated to have the option of producing more values at visits when only weight is collected (#1228).

- The function `derive_vars_dy()` is updated to avoid potential error when the input `dataset` with columns ending with `temp`. (#2012)


## Breaking Changes
- The following functions, which were deprecated in previous `{admiral}` versions, have been removed: (#1950)

  - `derive_var_disposition_status()`
  - `derive_vars_disposition_reason()`
  - `format_eoxxstt_default()`
  - `format_reason_default()`
  - `derive_var_worst_flag()`

- The following functions have been deprecated from previous `{admiral}` versions using the next phase of the deprecation process: (#1950)

  - `derive_param_extreme_event()`
  - `derive_vars_last_dose()`
  - `derive_var_last_dose_amt()`
  - `derive_var_last_dose_date()`
  - `derive_var_last_dose_grp()`
  - `derive_var_basetype()`
  - `derive_var_merged_cat()`
  - `derive_var_merged_character()`
  
- The arguments `dataset_adsl` in the function `derive_param_exist_flag()` and
`subject_keys` have been deprecated versions using the next phase of the deprecation process. (#1950)

- The `filter` argument in `derive_extreme_records()` was deprecated in favor of
the `filter_add` using the next phase of the deprecation process. (#1950)

## Documentation


## Various

- The list of package authors/contributors has been reformatted so that those who are actively maintaining the code base are now marked as *authors*, whereas those who made a significant contribution in the past are now down as *contributors*. All other acknowledgements have been moved to README section (#1941).

# admiral 0.11.1

- Fix bug in `derive_param_tte()`. (#1962)
- Get Started page now points to correct article. (#1969)

# admiral 0.11.0

## New Features

- In the function `derive_var_anrind()`, added argument `use_a1hia1lo` to turn the usage of `A1HI` and `A1LO` off and on, with the default being off. (#1795)

- Added a "Report a bug" link to `{admiral}` website. (#1836)

- New function `compute_age_years()` for converting a vector of age values to years. (#1794)

- New functions `filter_exist()` and `filter_not_exist()` for selecting records from
a dataset dependent on the existence of the corresponding by groups in a filtered 
source dataset. (#1699)

- New function `derive_param_extreme_record()` that adds parameter based on the first or last record from multiple sources. (#1822)

- New ADPPK template script available `ad_adppk.R` which creates Population PK Analysis Dataset based on forthcoming CDISC Implementation guide. (#1772)

- New function `compute_egfr()` for calculating Estimated Glomerular Filtration Rate (eGFR) and Creatinine Clearance for Kidney Function. (#1826)

## Updates of Existing Functions

- `derive_extreme_records()` was enhanced such that it includes the
functionality of `derive_param_extreme_event()`. (#1725)

- For the `set_values_to` argument expressions are accepted now. For example,
`set_values_to = exprs(PARAMCD = str_to_upper(QSTESTCD))`. This affects
`censor_source()`, `derive_expected_records()`, `derive_extreme_event()`,
`derive_extreme_records()`, `derive_param_bmi()`, `derive_param_bsa()`,
`derive_param_computed()`, `derive_param_doseint()`, `derive_param_exposure()`,
`derive_param_framingham()`, `derive_param_map()`, `derive_param_exist_flag()`,
`derive_param_extreme_event()`, `derive_param_qtc()`, `derive_param_rr()`,
`derive_param_wbc_abs()`, `derive_summary_records()`, `event_source()`,
`get_summary_records()`. (#1727)

- For the `order` argument expressions are accepted now. (#1727)

- `derive_vars_merged()` updates: (#1727)
    - The `missing_values` argument to assign values to
the new variables for non-matching observations was added.
    - The `new_vars` argument accepts expressions now.
    
- `derive_vars_joined()` updates: (#1727)
    - The `missing_values` argument to assign values to the new variables for
      non-matching observations was added.
    - The `new_vars` and the `join_vars` argument accept expressions now.

- The `date` field of `date_source()` accepts expressions now. This affects
`derive_var_extreme_dt()` and `derive_var_extreme_dtm()`. (#1727)

- The `date` and `dthcaus` field of `dthcaus_source()` accept expressions now.
This affects `derive_var_dthcaus()`. (#1727)

- The `date` field of `event_source()` and `censor_source()` accepts expressions
now. This affects `derive_param_tte()`. (#1727)

- The `derive_param_computed()` function was enhanced: (#1873)
    - The new `dataset_add` argument allows to consider parameters from a
      different dataset than the input dataset.
    - The new `analysis_var` argument allows to specify the variable to be
      populated, e.g., `AVALC`.
    - For `parameters` and `constant_parameters` a list of expressions can be
      specified now. This allows to create temporary parameter codes, e.g., if
      SDTM data is used as input.
    - The `analysis_value` argument was enhanced such that any variable of the
      form `<variable>.<parameter>` can be used, e.g., `QSORRES.CHSF13`.

## Breaking Changes

- `create_query_data()` and `derive_vars_query()` updated to rename variables in 
    query data set as follows: (#1907)

    - `VAR_PREFIX` to `PREFIX`
    - `QUERY_NAME` to `GRPNAME`
    - `QUERY_ID` to `GRPID`
    - `QUERY_SCOPE` to `SCOPE`
    - `QUERY_SCOPE_NUM` to `SCOPEN`
    - `TERM_LEVEL` to `SRCVAR`
    - `TERM_NAME` to `TERMNAME`
    - `TERM_ID` to `TERMID`
  
    Users need to adjust their `get_terms()` function accordingly.

- The `aval_fun` argument of `derive_param_exist_flag()` was deprecated in favor
of the `set_values_to` argument. (#1727)

- `derive_var_merged_cat()` and `derive_var_merged_character()` have been
deprecated in favor of `derive_vars_merged()`. (#1727)

- The following functions, which were deprecated in previous `{admiral}` versions, have been removed: (#1747)

  - `derive_vars_merged_dt()`
  - `derive_vars_merged_dtm()`
  - `derive_var_agegr_ema()`
  - `derive_var_agegr_fda()`
  - `derive_param_first_event()`
  - `derive_derived_param()`
  - `derive_var_confirmation_flag()`
  - `filter_confirmation()`

- The following functions have been deprecated from previous `{admiral}` versions using the next phase of the deprecation process: (#1747)

  - `derive_var_disposition_status()`
  - `derive_vars_disposition_reason()`
  - `format_eoxxstt_default()`
  - `format_reason_default()`
  - `derive_var_worst_flag()`

- `derive_param_extreme_event()` was deprecated in favor of
`derive_extreme_records()`. (#1725)

- The `filter` argument in `derive_extreme_records()` was deprecated in favor of
the `filter_add` argument. (#1725)

- `derive_vars_last_dose()`, `derive_var_last_dose_amt()`, `derive_var_last_dose_date()`, `derive_var_last_dose_grp()`,
were deprecated in favor of `derive_vars_joined()`. (#1797)

- `derive_var_basetype()` was deprecated in favor of `derive_basetype_records()`. (#1796)

- In the function `derive_param_exist_flag()` the arguments `dataset_adsl` and
`subject_keys` have been renamed to `dataset_ref` and `by_vars` respectively. (#1793)

## Documentation

- Updated example dataset to trigger deterioration flags in the vignette "Creating Questionnaire ADaMs". (#1853, #1854)

- Updated PK Programming vignette to include new Population PK Template `ad_adppk.R`. (#1772)

- Updated "Lab Grading" Vignette to link to grading metadata available in `{admiral}` and clarify how abnormal baseline
values are assigned in NCI-CTCAEv5. (#1863)

- Updated "Visit and Period Variables" Vignette to add more detail about Study Specific Code that is required. (#1831)

- Increased documentation for those functions which are regarded as wrapper functions. (#1726)

- Examples in function documentation no longer rely on `library(admiral.test)`. (#1752) 

- Conferences where `{admiral}` was presented were updated on the `README.md`. (#1890)

## Various

- `vars()` which was used in the admiral function calls that expected a list of
quosures has been removed. The admiral option `force_admiral_vars` was removed
as well. (#1694)

- `derive_vars_dtm()` and `derive_vars_dt()` had a bug pertaining to imputations associated with supplying both `min_dates` and `max_dates` that has now been resolved. (#1843)

- Examples for `derive_var_extreme_flag()` were reworked to reduce runtime that occasionally led to failing CI check. (#1780)

- `create_period_dataset()` had a bug that led to an error when both DT and DTM columns existed. (#1845)

- External functions are now consistently imported via namespace. `package::function()` calls have been removed from `admiral` functions. (#1842)

- `restrict_derivation()` had a bug which led to failure if the `derivation` argument was not in the global environment. (#1765)

# admiral 0.10.2

- Changing package maintainer from Thomas Neitmann to Ben Straub. (#1848)

# admiral 0.10.1

- Fix checks on `derive_vars_dtm()` and `derive_vars_dt()` 
that were too restrictive. (#1810)


# admiral 0.10.0

## New Features

- Using `{testthat}` 3rd edition for unit testing. This is stricter in 
that messages must be addressed and deprecated functions throw errors. (#1754) 

- New function `consolidate_metadata()` for consolidating multiple meta datasets
into a single one. (#1479)

- New function `compute_scale()` for computing the average of a vector and 
transforming the result from a source to a target range. (#1692)

- New ADPC template script available `ad_adpc.R` which creates PK Concentration
Analysis Dataset (#849). This script includes formatting suitable for
Non-Compartmental Analysis (ADNCA). (#851)

- New function `derive_expected_records()` for adding expected records. (#1729)

- New function `derive_extreme_event()` for adding the worst or best observation 
for each by group as new records. (#1755)

## Updates of Existing Functions

- Arguments `analysis_var`, `keep_vars` were added to `derive_locf_records()`,   
`analysis_var` allows to specify analysis variable, `keep_vars` keeps variables 
that need carrying the last observation forward other than `analysis_var` 
(e.g., `PARAMN`, `VISITNUM`). (#1636)

-   The function `create_single_dose_dataset()` adds support for
    expanding relative nominal time (e.g. NFRLT) used in Pharmacokinetic
    (PK) analyses. The new parameter `nominal_time` defaults as `NULL`
    and does not change the normal operation of the function. If a
    `nominal_time` is specified such as NFRLT (Nominal Relative Time
    from First Dose) then the nominal time is incremented by the
    interval specified in `EXDOSFRQ` for example for "QD" records the
    NFRLT is incremented by 24 hours, e.g. 0, 24, 48... (#1640)
    
-   `create_single_dose_dataset()` is also updated for values of
    `EXDOSFRQ` with units in days but expected values less than 24
    hours, such as "BID", "TID", and "QID". Previously these values of
    `EXDOSFRQ` may result in duplicate records where the day values are
    incremented but the time values are not. (#1643)
    
- The function `derive_var_confirmation_flag()` and `filter_confirmation()`
gained the `tmp_obs_nr_var` argument. It helps flagging or selecting consecutive
observations or the first or last observation in a by group. (#1724)

- The functions `derive_vars_merged()`, `derive_var_merged_cat()`, 
`derive_var_merged_character()`, `derive_var_merged_exist_flag()`, 
`derive_var_merged_summary()`, and `derive_vars_merged_lookup()` were updated to 
allow renaming in the argument `by_vars`. (#1680)

- The units "min" and "sec" are added as valid values of `out_unit` in `compute_duration()` and `derive_vars_duration()`. (#1647)

- The function `derive_vars_query()` now includes a consistency check for
`QUERY_SCOPE` and `QUERY_SCOPE_NUM` values. (#652)

- Argument `new_var` in `derive_param_extreme_event()` is made optional. (#1630)

- `derive_vars_last_dose()` no longer fails if `USUBJID` is not included in the
input dataset. (#1787)

## Breaking Changes

- All function arguments which expected a list of quosures created by `vars()`
are now expecting a list of expressions created by `exprs()`. For example,
instead of `by_vars = vars(STUDYID, USUBJID)` `by_vars = exprs(STUDYID,
USUBJID)` must be used now.

    To enable running old scripts using `vars()` in the admiral function calls
    admiral redefines the `vars()` function such that it returns a list of
    expressions. This can be disabled by the admiral option `force_admiral_vars`
    (see `set_admiral_options()`). Please note that this is a temporary solution
    and will be removed in a future admiral release. (#1627)

- Function `derive_param_tte()` has been updated such that only observations are
added for subjects who have both an event or censoring and an observation in
`dataset_adsl`. (#1576)

- Function `derive_var_disposition_status()` has been deprecated, please use `derive_var_merged_cat()` instead. (#1681)

- Function `derive_var_worst_flag()` has been deprecated, in favor of `slice_derivation()`/`derive_var_extreme_flag()`. (#1682)

- Function `derive_vars_disposition_reason()` has been deprecated, in favor of `derive_vars_merged()`. (#1683)
  
- The following functions have been deprecated from previous `{admiral}` versions using the next phase of the deprecation process: (#1712)

  - `derive_derived_param()` 
  - `derive_param_first_event()` 
  - `derive_vars_merged_dt()`
  - `derive_vars_merged_dtm()`
  - `derive_var_agegr_ema()`
  - `derive_var_agegr_fda()`

- The following functions, which were deprecated in previous `{admiral}` versions, have been removed: (#1712)

  - `derive_var_ady()`
  - `derive_var_aendy()`
  - `derive_var_astdy()`
  - `derive_var_atirel()`
  - `derive_vars_suppqual()`
  - `smq_select()`
  - `sdg_select()`

- The following parameters, which were deprecated in previous `{admiral}` versions, have been removed: (#1712)

  - `meddra_version`, `whodd_version`, `get_smq_fun` and `get_sdg_fun` from the `create_query_data()` function
  - `date_imputation`, `time_imputation` and `preserve` parameters from `date_source()` function
  - `filter` parameter from `derive_var_extreme_flag()`

- `ADLB` metadata data set called `atoxgr_criteria_ctcv5` updated to remove unit check for
`HYPERURICEMIA` as grade criteria based on `ANRHI` only.  This metadata holds criteria for lab grading
based on [Common Terminology Criteria for Adverse Events (CTCAE) v5.0](https://ctep.cancer.gov/protocoldevelopment/electronic_applications/ctc.htm). (#1650)

- Renamed `derive_var_confirmation_flag()` and `filter_confirmation()` to 
`derive_var_joined_exist_flag()` and `filter_joined()` respectively. (#1738)

## Documentation

- New vignette "Creating a PK NCA ADaM (ADPC/ADNCA)". (#1639)

- New vignette "Hy's Law Implementation". (#1637)

- New vignette "Creating Questionnaire ADaMs". (#1715)

- The expected value for the `derivation` argument of `restrict_derivation()`,
`slice_derivation()`, and `call_derivation()` is described now. (#1698)

- Removed authors from function documentation, as we will now only be tracking an overall list of 
authors for admiral. (#1673)

- Added an imputation example for `create_single_source_dataset()` in function documentation. (#1408, #1760)

- Updates to examples for `derive_var_age_years()` and `derive_vars_duration()`. (#1620, #1634)

- Increased the level of documentation for `derive_var_age_years()` to describe the data type of the newly created `new_var` column. (#970)

## Various

- Functions `derive_vars_dtm()` and `derive_vars_dt()` had a bug pertaining to imputations associated with `NA` values that has now been fixed. (#1646)

# admiral 0.9.1

- Implement changes to `if_else()` from the release of `dplyr` version 1.1.0, which
affects `derive_vars_dtm()` and `and compute_tmf()`. (#1641)

# admiral 0.9.0

## New Features

- The new function `derive_vars_joined()` adds variables from an additional
dataset. The selection of the observations can depend on variables from both
datasets. This can be used for adding `AVISIT`, `AWLO`, `AWHI` based on time
windows and `ADY` or deriving the lowest value (nadir) before the current
observation. (#1448)

- New function `derive_var_trtemfl()` for deriving treatment emergent flags. (#989)

- The new function `chr2vars()` turns a character vector into a list of quosures. (#1448)

- New function `derive_var_relative_flag()` for flagging observations before or
after a condition is fulfilled. (#1453)

- New functions `get_admiral_option()` and `set_admiral_options()` to allow more 
flexibility on common function inputs; e.g. like `subject_keys` to avoid several 
find and replace instances of `vars(STUDYID, USUBJID)`. (#1338)

- The new function `create_period_dataset()` for creating a reference dataset
for subperiods, periods, or phases from the ADSL dataset was added. The
reference dataset can be used to create subperiod, period, and phase variables
in OCCDS and BDS datasets. (#1477)

- The new function `derive_vars_period()` adds subperiod, period, or phase
variables to ADSL. The values for the new variables are provided by a period
reference dataset. (#1477)

- New function `derive_var_merged_summary()` adds a variable of summarized
values to the input dataset. (#1564)

- A `print()` method was added for all S3 objects defined by admiral, e.g.,
`date_source()`, `dthcaus_source()`, ... (#858)

- New metadata data set called `atoxgr_criteria_ctcv5` which holds criteria for lab grading
based on [Common Terminology Criteria for Adverse Events (CTCAE) v5.0](https://ctep.cancer.gov/protocoldevelopment/electronic_applications/ctc.htm).

- Removed the `{assertthat}` dependency in `{admiral}`. (#1392)

- Removed R Version 3.6 check in CI/CD workflows in favor of the three most recent versions: 4.0, 4.1 and 4.2. (#1556)

- The new function `derive_locf_records()` adds LOCF records as new observations. 
This can be used when the input dataset does not contain observations for missed 
visits/time points or when `AVAL` is `NA` for particular visits/time points. (#1316)

- New function `convert_na_to_blanks()` to convert character `NA` to blanks. (#1624)


## Updates of Existing Functions

- Function `derive_param_first_event()` has been replaced by a more generalized `derive_param_extreme_event()` function with new argument `mode` allowing for the selection of either the `"first"` or `"last"` event record according to the conditions provided. Also the `date_var` argument has been replaced with the `order` argument instead. In addition, three new arguments `new_var`, `true_value`, and `false_value` have been added to allow the user to choose what variable is used to indicate whether an event happened, and the values it is given. (#1317, #1242)

- Argument `ignore_time_for_ref_end_date` was added to `derive_var_ontrtfl()`,
which controls if time is considered for the condition if `start_date` is after
`ref_end_date` + `ref_end_window` days. (#989)

- `derive_var_atoxgr_dir()` default value of `atoxgr_criteria_ctcv4` removed for
parameter `meta_criteria`. Can now also choose `atoxgr_criteria_ctcv5` for parameter 
`meta_criteria`, to implement NCI-CTCAEv5 grading criteria.

- _Environment_ objects were consolidated into a single `admiral_environment` object under `R/admiral__environment.R`. (#1572)

- The default value of the `keep_source_vars` argument in
`create_single_dose_dataset()` was updated such that it takes the values of the
other arguments into account and the `start_datetime` and `end_datetime`
arguments are optional now. (#1598)

- Function `create_query_data()` has been updated such that the dictionary
version is stored in the output dataset. (#1337)

## Breaking Changes

- Function `derive_param_first_event()` has been deprecated. Please use `derive_param_extreme_event()` with the `order` argument instead of the `date_var` argument. (#1317)

- Functions `smq_select()` and `sdg_select()` have been deprecated and replaced with `basket_select()`. In the `create_query_data()` function, `meddra_version` and `whodd_version` argument has been replaced by `version` and `get_smq_fun` and `get_sdg_fun` argument by `get_terms_fun`. (#1597) 

## Documentation

- New vignette "Generic Functions". (#734)
- New vignette "Visit and Period Variables". (#1478)

## Various

- Function `derive_param_tte()` had a bug that set `ADT` to `NA` when `start_date` 
was missing, which has now been fixed. (#1540)

- Function `derive_vars_merged()` had an improperly formatted error message 
which has been corrected. (#1473)

- Templates now save datasets as `.rds` instead of `.rda`. (#1501)

- Function `create_single_dose_dataset()` no longer fails if the input dataset
contains observations with dose frequency `"ONCE"`. (#1375)

# admiral 0.8.4

- Fixed a bug where a recent update to `{lifecylce}` caused several `admiral` tests to break (#1500)

# admiral 0.8.3

- Second attempt to address issue where CRAN identified a failing test when "a strict Latin-1* locale" is used (#1469)
- Fixed a bug in `derive_vars_duration()` that surfaced after changes in R-devel (#1486)

# admiral 0.8.2

- Fixed an issue where CRAN identified a failing test when "a strict Latin-1* locale" is used (#1469)

# admiral 0.8.1

- `derive_var_extreme_dt()` and `derive_var_extreme_dtm()` were updated such
that source observations where the date is `NA` are excluded (#1419)

# admiral 0.8.0

## New Features

- `get_summary_records()` creates summary records e.g. derive analysis value (`AVAL`) from multiple records, only keeping the derived observations (#525)

- `derive_param_framingham()` adds a Parameter for Framingham Heart Study Cardiovascular Disease 10-Year Risk Score (#977)

- `compute_qual_imputation()` imputes values when qualifier exists in character result (#976)

- `derive_vars_merged_lookup()` maps lookup tables (#940)

- `filter_confirmation()` filters out confirmed observations
(#1292) including supporting functions `count_vals()`, `min_cond()`, and
`max_cond()`.

- `derive_var_confirmation_flag()` derives a flag which
depends on other observations of the input dataset (#1293)

- `derive_var_atoxgr()` derives lab toxicity/severity grade `ATOXGR`
from `ATOXGRL` and `ATOXGRH`. `ATOXGRL` holds toxicity/severity grade for low lab values,
and `ATOXGRH` holds toxicity/severity grade for high lab values.

- `derive_var_atoxgr_dir()` derives lab toxicity/severity grade for low
lab values (`ATOXGRL`) or for high lab values (`ATOXGRH`). The grading is created from
metadata.

- New metadata data set called `atoxgr_criteria_ctcv4` which holds criteria for lab grading
based on [Common Terminology Criteria for Adverse Events (CTCAE) v4.0](https://ctep.cancer.gov/protocoldevelopment/electronic_applications/ctc.htm)


## Updates of Existing Functions

- `list_tte_source_objects()` gains a `package` parameter and is now exported (#1212)

- `list_all_templates()` and `use_ad_template()` gain a `package` parameter which
can be used to indicate in which package to look for templates (#1205)

- Randomization Date `RANDDT` variable added to ADSL template and vignette (#1126)

- Renamed `derive_derived_param()` to `derive_param_computed()` and added a 
deprecation notice (#1229)

- `derive_vars_duration()` updated to not display units when there is missing duration (#1207)

- `value_var` parameter added to `derive_vars_atc()` (#1120)

- `format_eoxxstt_default()` - Updated the default value of EOSSTT for screen failure patients (#885)

- The imputation functions (`derive_vars_dtm()`, `derive_vars_dt()`,
`convert_dtc_to_dtm()`, `convert_dtc_to_dt()`) have been enhanced to address
users feedback (#1300):

    - Partial dates with missing components in the middle like
    `"2003-12-15T-:15:18"`, `"2003-12-15T13:-:19"`, `"2020-07--T00:00"` are
    handled now.
  
    - The control of the level of imputation has been refined by adding the
      `highest_imputation` argument. For example, `highest_imputation = "D"`
      requests imputation for day and time but not for year and month.
  
      (For the `date_imputation` and the `time_imputation` argument `NULL` is no
      longer a permitted value.)
  
    - It is now possible to impute completely missing dates by specifying
    `highest_imputation = "Y"` and the `min_dates` or `max_dates` argument.

- `order` parameter added to `dthcaus_source()` which allows an additional 
character vector to be used for sorting the `dataset`, `derive_vars_dthcaus()` 
updated to process additional parameter (#1125).

- `create_single_dose_dataset()` Fixed bug where `ASTDTM` and `AENDTM` were not updated when `start_date = ASTDT` and `end_date = AENDT`. The function has been amended to now require `start_datetime` and `end_datetime` parameters in addition to `start_date` and `end_date`.The `keep_source_vars` has been added to specify the variables to be retained from the source dataset (#1224)

## Breaking Changes

- Moved all developer-facing functions and vignettes to `{admiraldev}`. `{admiraldev}` is now a dependency of `{admiral}` (#1231)

- All ADaM datasets but `admiral_adsl` have been removed from the package (#1234)

- `derive_var_agegr_ema()` and `derive_var_agegr_fda()` have been deprecated (#1333)

- Imputation related arguments have been deprecated for all functions except the
imputation functions themselves (#1299). I.e., if a derivation like last known alive
date is based on dates, DTC variables have to be converted to numeric date or
datetime variables in a preprocessing step. For examples see the [ADSL
vignette](https://pharmaverse.github.io/admiral/cran-release/articles/adsl.html).
  The following arguments were deprecated:

  - `date_imputation`, `time_imputation`, and `preserve` in `date_source()`
  
  The following arguments no longer accept DTC variables:
  
  - `date` in `date_source()`, `dthcaus_source()`, `censor_source()`, and
  `event_source()`
  - `dose_date` and `analysis_date` in `derive_vars_last_dose()`,
  `derive_var_last_dose_amt()`, `derive_var_last_dose_date()`,
  `derive_var_last_dose_grp()`
  
  The following functions were deprecated:
  
  - `derive_vars_merged_dt()`
  - `derive_vars_merged_dtm()`
  
- For the `date_imputation` and the `time_imputation` argument of the imputation
functions (`derive_vars_dtm()`, `derive_vars_dt()`, `convert_dtc_to_dtm()`,
`convert_dtc_to_dt()`) `NULL` is no longer a permitted value. The level of
imputation can be controlled by the `highest_imputation` argument now.

- The following functions, which were deprecated in previous {admiral} versions,
have been removed:

  - `derive_var_disposition_dt()`
  - `derive_var_lstalvdt()`
  - `lstalvdt_source()`
  - `derive_var_trtedtm()`
  - `derive_var_trtsdtm()`

- The following functions and parameters, which were deprecated in previous
{admiral} versions, are now defunct and will output an ERROR if used:

  - `derive_var_ady()` 
  - `derive_var_aendy()` 
  - `derive_var_astdy()`
  - `derive_var_atirel()`
  - `filter` parameter in `derive_var_extreme_flag()` and `derive_var_worst_flag()`

## Documentation

- New ADMH template script can be accessed using `admiral::use_ad_template("admh")` (#502)

- New vignette "Higher Order Functions" (#1047)

- New vignette "Lab Grading" (#1369)

- Fixed `derive_var_disposition_status()` argument to render correctly (#1268)

- Added link to [pharmaverse YouTube channel](https://www.youtube.com/channel/UCxQFEv8HNqM01DXzdQLCy6Q) to README

## Various

- Restructured Reference page and updated **all** functions to use `family` tag 
in roxygen headers for finding similar functions.  (#1105)

- Rename "Articles" page on website to "User Guides" and moved developer vignettes to `{admiraldev}` website (#1356)


# admiral 0.7.1

- `derive_vars_last_dose()` no longer fails when a variable renamed in `new_vars` is supplied
to the `dose_date` parameter (#1206)

- `derive_vars_duration()` updated to not display units when there is missing
duration (#1207)

- `derive_param_first_event()` was updated (#1214) such that
    - `AVAL` is derived instead of `AVALN` and
    - all variables from the source dataset are kept.
    
- `create_single_dose_dataset()` Fixed bug where ASTDTM and AENDTM were not updated when `start_date=ASTDT` and `end_date=AENDT`. The function has been amended to now require start_datetime and end_datetime parameters in addition to start_date and end_date.The keep_source_vars has been added to specify the variables to be retained from the source dataset.

- `slice_derivation()` was updated such that it no longer fails if a slice is
empty (#1309)

# admiral 0.7.0

## New Features

- Updates to date/time imputation functions (#761):

  - `convert_date_to_dtm()` and `convert_dtc_to_dtm()` now have time_imputation = "00:00:00" as default 
  
  - `derive_vars_dt()`now has flag_imputation = "auto" as default

- New functions for merging variables (#607):

  - `derive_vars_merged()` - Merge Variables from a Dataset to the Input Dataset
  - `derive_vars_merged_dt()` - Merge a (Imputed) Date Variable
  - `derive_vars_merged_dtm()` - Merge a (Imputed) Datetime Variable
  - `derive_var_merged_cat()` - Merge a Categorization Variable
  - `derive_var_merged_exist_flag()` - Merge an Existence Flag
  - `derive_var_merged_character()` - Merge a Character Variable
  

- `create_query_data()` is provided to create the [queries
dataset](https://pharmaverse.github.io/admiral/cran-release/articles/queries_dataset.html) required as input for `derive_vars_query()` (#606)

- `create_single_dose_dataset()` - Derives dataset of single dose from aggregate dose information (#660)

- New functions for deriving first or last dates from multiple source datasets (#753):

  - `derive_var_extreme_dtm()` - Derive First or Last Datetime from Multiple Sources
  - `derive_var_extreme_dt()` - Derive First or Last Date from Multiple Sources


- New function `derive_extreme_records()` for adding the first or last
observation within each by group to the dataset (#1042)

- New function `derive_param_first_event()`: Add a new parameter for the first
event occurring in a dataset. (#1063)

- New function `derive_param_exist_flag()`: Add a new parameter indicating that
a certain event exists in a dataset. (#1064)

- New high order functions (#701):

  - `restrict_derivation()` - Execute a derivation on a subset of the input dataset
  - `slice_derivation()` - The input dataset is split into slices (subsets) and
  for each slice a derivation is called separately. Some or all arguments of the
  derivation may vary depending on the slice.

- `filter_relative()` - Selects observations before or after the observation
where a specified condition is fulfilled. For example, all observations up to
first disease progression. (#1023)
  
### ADLB

  - New ADLB template script available `ad_adlb.R`, specific ADLB functions developed and
  [BDS Finding vignette](https://pharmaverse.github.io/admiral/cran-release/articles/bds_finding.html) has examples enhanced with ADLB functions. (#1122)

  - `derive_var_shift()` - Derives a character shift variable containing concatenated shift in values based on user-defined pairing (#944)
  - `derive_var_analysis_ratio()` - Derives a ratio variable based on user-supplied variables from a BDS dataset, e.g. ADLB. (#943)
  - `derive_param_wbc_abs()` - Adds a parameter for lab differentials converted to absolute values. (#941)


### ADPP

  - New ADPP template script available `ad_adpp.R` which creates Pharmacokinetics Parameters Analysis Dataset (#850)

## Updates of Existing Functions

- Datasets internal to the package have been renamed with prefix `admiral_`, e.g. `adsl` has been renamed to `admiral_adsl`. Corresponding SDTM datasets in `{admiral.test}` have also been renamed, e.g.`dm` to `admiral_dm`. These changes will impact examples,
vignettes, unit tests and templates (#1108 and #1088)

- When `derive_vars_dtm_to_tm()` was called for variables created by
`derive_vars_dtm()` the function failed. This bug was fixed (#1097).

- `impute_dtc()` - Fixed imputation bug. A user setting `date_imputation = MID` and 
`preserve = FALSE` would expect the date `2019---07` to be imputed to `2019-06-30`, 
but the function was returning `2019-06-15`. Now returns it correctly. This bug fix 
also addresses the issue in the downstream functions `derive_vars_dt()` and `derive_vars_dtm()`. (#1081)

- `format_eoxxstt_default()` - Updated to have a more meaningful parameter name i.e. the parameter that was x is now status (#911)

## Breaking Changes

- `derive_var_lstalvdt()` has been deprecated in favor of `derive_var_extreme_dt()` (#753).
- `derive_vars_disposition_reason()` now is updated such that the default is populating `DCSREASP` only when `DSDECOD` is equal to `'OTHER'`, which is consistent with ADaMIG_v1.3 (#886).
- `derive_vars_suppqual()` has been removed from {admiral} as adding supplementary qualifiers is now done in another package called [{metatools}](https://github.com/pharmaverse/metatools) in a function called `combine_supp()` and is available on CRAN (#950)

- The `filter` parameter in `derive_var_extreme_flag()` and
`derive_var_worst_flag()` has been deprecated in favor of
`restrict_derivation()` (#701).

- The following functions and parameters, which were deprecated in previous {admiral} versions, have been removed (#1056):

  - `derive_agegr_ema()`
  - `derive_agegr_fda()`
  - `derive_disposition_dt()`
  - `derive_disposition_status()`
  - `derive_extreme_flag()`
  - `derive_worst_flag()`
  - `derive_obs_number()`
  - `derive_disposition_reason()`
  - `derive_var_basec()`
  - `derive_baseline()` 
  - `derive_params_exposure()` 
  - `derive_last_dose()`
  - `dataset` parameter in `lstalvdt_source` and `dthcaus_source`
  

- The following functions were deprecated in favor of `derive_vars_dy()`
(#1076):

    - `derive_var_ady()` - Derive Analysis Study Day
    - `derive_var_aendy()` - Derive Analysis End Relative Day
    - `derive_var_astdy()` - Derive Analysis Start Relative Day

- The following functions were deprecated in favor of `derive_vars_merged_dtm()`
(#1076):

    - `derive_var_trtedtm()` - Derive Datetime of Last Exposure to Treatment
    - `derive_var_trtsdtm()` - Derive Datetime of First Exposure to Treatment

- The `derive_var_disposition_dt()` function was deprecated in favor of
`derive_vars_merged_dt()` (#1076)

- The `derive_var_atirel()` function was deprecated, as it is deemed as too
specific for admiral. Derivations like this can be implemented calling
`mutate()` and `case_when()`.

## Documentation


- Additional explanation added to `derive_param_*` and `derive_derived_param` functions regarding which variables are populated in the additional rows (#939)


- Updated `derive_var_worst_flag()` and `derive_var_extreme_flag()` vignettes to clarify their purpose (#691)

- Added example of ASEQ derivation in ADCM to 
[OCCDS vignette](https://pharmaverse.github.io/admiral/cran-release/articles/occds.html#aseq)
(#720)

- Examples have been added for `format_reason_default()`, `format_eoxxstt_default()`, `extend_source_datasets()` and `filter_date_sources()` (#745)

## Various

-  Naming convention of admiral.xxx packages change to admiralxxx from this point onwards (#968)
 

# admiral 0.6.3

Address [CRAN comments](https://github.com/pharmaverse/admiral/issues/946) raised after submitting v0.6.2 (#946)

# admiral 0.6.2

Address [CRAN comments](https://github.com/pharmaverse/admiral/issues/925) raised after submitting v0.6.1 (#925)

# admiral 0.6.1

Address [CRAN comments](https://github.com/pharmaverse/admiral/issues/918) raised after submitting v0.6.0 (#918)

# admiral 0.6.0

## New Features

- `derive_vars_dy()` derives the analysis day from one or more `--DT(M)` variables
(#700)


## Updates of Existing Functions

- The `derive_last_dose()` function has been split into a general function 
`derive_vars_last_dose()` and three wrapper functions `derive_var_last_dose_amt()`, 
`derive_var_last_dose_date()`, and `derive_var_last_dose_grp()` (#385)

- `derive_var_ontrtfl()` now has a `new_var` parameter to support the derivation of `ONTRxxFL` and `ONTRTwFL` variables (#721)

- `derive_vars_dtm()`, `derive_var_disposition` and `derive_var_lstalvdt` now have `preserve` argument. A user can preserve partial dates when doing date imputation, e.g. `2019---07` would become `2019-06-07` by setting `preserve` to `TRUE` when doing date_imputation (#592)


- `derive_vars_dtm()` now has `ignore_seconds_flag` argument so users can suppress `"S"` flag if seconds are not recorded in the data (#589)

## Breaking Changes

- `derive_agegr_ema()`, `derive_agegr_fda()`, `derive_disposition_dt()`,
`derive_disposition_status()`,`derive_extreme_flag()`, `derive_worst_flag()`,
`derive_obs_number()`, `derive_disposition_reason()` have been deprecated and
renamed in favor of `derive_var_agegr_ema()`, `derive_var_agegr_fda()`,
`derive_var_disposition_dt()`, `derive_var_disposition_status()`,
`derive_var_extreme_flag()`, `derive_var_worst_flag()`,
`derive_var_last_dose()`, `derive_var_obs_number()`, and
`derive_vars_disposition_reason()` respectively (#738)

- `derive_var_basec()` and `derive_baseline()` have been deprecated in favor of the extended `derive_var_base()` function (#695)

- `derive_params_exposure()` has been deprecated and renamed as `derive_param_exposure()` (#722)

- The `derive_last_dose()` function has been deprecated in favor of
`derive_var_last_dose_date()` (#385)

- The behavior of all functions providing the `date_imputation` parameter, e.g., `derive_vars_dtm()` and
`derive_vars_dt()`, has changed for `date_imputation = "mid"`. Before the date was imputed as June 15th
if both month and day were missing. Now it is imputed as June 30th. For the old behavior please specify
`date_imputation = "06-15"`. Please note the behavior has not changed if only the day is missing. In
this case the day is imputed as `15` (#592)

- `derive_var_ontrtfl()` now has a `new_var` parameter to support the derivation of `ONTRxxFL` and `ONTRTwFL` variables (#721)

- The following functions and parameters, which were deprecated in previous {admiral} versions, were removed (#513):
  
  - `derive_aage()`, `derive_duration()`, `derive_query_vars()`, and
  `derive_suppqual_vars()` function
  - `fns` and `filter_rows` parameters in `derive_summary_records()`
  - `date_var` and `traceabilty_vars` parameters in `dthcaus_source()`
  - `flag_filter` parameter in `derive_extreme_flag()`
  - `flag_filter` parameter in `derive_var_extreme_flag()`
  - `date_var` parameter in `lstalvdt_source()`
  - `date` parameter in `derive_var_ontrtfl()`
  
- `derive_var_agegr_fda()` has been updated to use ranges <18, 18-64, >=65 (#829)

## Documentation

- README and site homepage has been updated with important new section around expectations of {admiral}, as well as other useful references such as links to conference talks (#868 & #802)

- New vignette [Development Process](https://pharmaverse.github.io/admiraldev/main/articles/development_process.html) and improvements made to contribution vignettes (#765 & #758)

- Updated [Pull Request Review Guidance](https://pharmaverse.github.io/admiraldev/main/articles/pr_review_guidance.html) on using `task-list-completed` workflow (#817)

## Various

- GitHub repo moved to pharmaverse org and associated broken site links fixed (#803 & #820)

- Examples have been added for `format_reason_default`, `format_eoxxstt_default`, `extend_source_datasets` and `filter_date_sources` (#745)

# admiral 0.5.0

- The first truly open source release licensed under Apache 2.0 (#680)

- New vignette [Contributing to admiral](https://pharmaverse.github.io/admiral/cran-release/articles/contribution_model.html) (#679)

- New vignette [Unit Test Guidance](https://pharmaverse.github.io/admiraldev/main/articles/unit_test_guidance.html) (#679)

- Broken links in README have been fixed (#564)

# admiral 0.4.0

## New Features

### General

- `derive_vars_dtm_to_tm()` enables the easy conversion of datetime to time variables (#551)

- `derive_var_age_years()` derives age in years from a variable providing the
age in different units (#569)

### BDS

- `derive_param_tte()` derives time-to-event-parameters (#546)

- For common time-to-event endpoints [event and censoring source
objects](https://pharmaverse.github.io/admiral/cran-release/reference/index.html#section-pre-defined-time-to-event-sources) are
provided (#612)

### Developer

- `assert_list_element()` checks if an element of a list of lists/classes
fulfills a condition

- `assert_one_to_one()` checks if there is a one to one mapping between two
lists of variables

- `negate_vars()` negates a list of variables to remove them from a dataset with
`select()`

## Updates of Existing Functions

- Unit checks in `derive_param_*()` functions are no longer case sensitive (#631)

- `derive_agegr_ema()` and `derive_agegr_fda()` gain a `age_unit` parameter used
to specify the unit of the input age (#569)

## Breaking Changes

- All SDTM datasets have been moved to the {admiral.test} package (#639)

- The `min_dates` and `max_dates` parameters of `derive_vars_dt()` and `derive_vars_dtm()` no longer expect a `list()` but `vars()` as input (#405)

## Bug Fixes

- `derive_vars_dtm()` no longer shifts the time of the input `--DTC` variable (#436)

- `derive_vars_dtm()` Change the min_dates with max_dates in the `lapply` statement when computing max_dates (#687)

## Documentation

- New vignette [Creating a BDS Time-to-Event ADaM](https://pharmaverse.github.io/admiral/cran-release/articles/bds_tte.html) (#549)

- New vignette [Queries Dataset Documentation](https://pharmaverse.github.io/admiral/cran-release/articles/queries_dataset.html) (#561)

- New vignette [Writing Vignettes](https://pharmaverse.github.io/admiraldev/main/articles/writing_vignettes.html) (#334)

- New vignette [Pull Request Review Guidance](https://pharmaverse.github.io/admiraldev/main/articles/pr_review_guidance.html) (#554)

- A section on handling missing values when working with {admiral} has been added to the "Get Started" vignette (#577)

- Package installation instructions have been added to the README (#558)

- The documentation of `derive_vars_dtm()` falsely stated that the `flag_imputation` parameter should be either `TRUE` or `FALSE`. It now correctly states that the possible values are `"time"`, `"date"` or `"auto"` (#539)


# admiral 0.3.0

## New Features

### General

- `convert_blanks_to_na()` can be used to convert SAS blanks, i.e. `""`, into proper R `NA` values (#482)

- `call_derivation()` enables users to call the same function multiple times with some parameters being fixed across iterations and others varying (#403)

- `derive_vars_dtm_to_dt()` enables the easy conversion of datetime to date variables (#376)

- `derive_var_ontrtfl()` can now handle events with a start and end date rather than just a single assessment date (#395)

- `derive_worst_flag()` enables the flagging of worst records (#300)

### BDS

- `derive_derived_param()` can be used to derive a new parameter from existing parameters in a BDS dataset (#325)

- `derive_param_bmi()`, `derive_param_bsa()` and `derive_param_map()` enables the derivation of the body mass index, body surface area and mean arterial pressure parameters respectively (#368)

- `derive_param_qtc()` enables the derivation of corrected QT intervals according to the formula of Bazett, Fridericia or Sagie (#325)

- `derive_param_rr()` enables the derivation of the RR interval (#325)

- `derive_params_exposure()` enables the derivation of summary exposure parameters (#400)

- `derive_param_doseint()` enables the derivation of dose intensity (#179)

### OCCDS

- `derive_var_atirel()` enables the derivation of the "Analysis Time Relative to Reference" (#397)

- `derive_vars_atc()` can be used to add ATC variables from FACM to ADCM (#396)

## Updates of Existing Functions

- `derive_var_anrind()` now checks whether the `AVAL` variable is present in the input dataset (#486)

- All derivation functions check whether the input dataset is grouped and throw an error if it is (#408)

- `use_ad_template()` has been refactored to no longer make use of the {usethis} package which is no longer a dependency of {admiral} (#433)

- A performance issue in `derive_vars_dt()` has been resolved (#384)

## Breaking Changes

- The `drop_values_from` parameter has been removed from `derive_summary_records()` (#425)

- The format of the `date_imputation` parameter of `derive_vars_dt()` and `derive_vars_dtm()` has been changed from "dd-mm" to "mm-dd". Thus, "01-12" now refers to January 12th rather than December 1st (#492)

- Several functions have been renamed. The old names are now deprecated. They can still be used but a warning will be issued (#507)
    - `derive_aage()` -> `derive_vars_aage()`
    - `derive_duration()` -> `derive_vars_duration()`
    - `derive_query_vars()` -> `derive_vars_query()`
    - `derive_suppqual_vars()` -> `derive_vars_suppqual()`
    
- The `date_var` parameter of `lstalvdt_source()` has been renamed to `date`

- The `filter_rows` parameter of `derive_summary_records()` has been renamed to `filter`. The `fns` parameter has been deprecated in favor of `analysis_var` and `summary_fun` (#491)

- The `date_var` and `traceabilty_vars` parameters of `dthcaus_source()` have been renamed to `date` and `traceability_vars`, respectively (#493)

- The `flag_filter` parameter of `derive_extreme_flag()` has been renamed to `filter` (#487)

## Bug Fixes

- `derive_agegr_fda()` used to return `NA` for ages less than or equal 18. It now returns `<=18` (#441)

## Documentation

- New vignette on "Date and Time Imputation" has been created (#198)

- A "Guidance for git Usage" has been created (#266)

- "OCCDS" has been added as a new section on the reference page on the package website (#485)

- The Programming Strategy has been updated (#495)

- A search feature has been added to the package website (#438)

- New template scripts for ADEX (#181), ADCM (#268) and ADEG (#258) have been created

- New vignette for programming ADEX has been created (#372)

- A section on how to create query variables (e.g. SMQs in ADAE) has been added to the Occurrence datasets vignette (#370)

- The BDS vignette has been updated to incorporate examples of ADVS and ADEG specific functions (#371)


# admiral 0.2.1

- Fixed a critical bug in `use_ad_template()` that prevented the function from being usable at all (#326)


# admiral 0.2.0

## New Features

### General

- Function argument checks have been completely re-written to provide clearer error messages to users (#263, #288)

- SDTM `SUPP--` datasets can be merged onto their parent domain using `derive_suppqual_vars()` (#145)

- In case a derivation detects duplicate records after applying a `filter`, the dataset of duplicate records is made available to users via `get_duplicates_dataset()` (#202)

- `derive_vars_dt()` and `derive_vars_dtm()` gain a `min_dates` and `max_dates` parameter which can be used to ensure that the imputed date(time) is not before the `min_dates` nor after the `max_dates`, e.g. avoid that `AENDT` is after the data cut date or `ASTDT` is before the first treatment date (#158)

- `use_ad_template()` can be used to open a template script for an ADaM dataset; all available templates can be displayed using `list_all_templates()` (#110)

### ADSL

- EMA and FDA defined age groupings can be derived using `derive_agegr_ema()` and `derive_agegr_fda()`, respectively

- Disposition Status can be derived using `derive_disposition_status()` (#92)

- Disposition Reason can be derived using `derive_disposition_reason()`

- Disposition Dates can be derived using `derive_disposition_dt()` (#91)

- Date Last Known Alive can be derived using `derive_var_lstalvdt()` (#94)

- Cause of Death can be derived using `derive_var_dthcaus()` (#93)

### BDS

- Summary records for BDS datasets, e.g. with `DTYPE == "AVERAGE"`, can be derived using `derive_summary_records()` (#177)

### OCCDS

- Last Dose Date(time) can be derived using `derive_last_dose()`

## Breaking Changes

- `derive_merged_vars()` has been removed from {admiral} in favor of smaller special purpose functions, e.g. `derive_disposition_status()` (#167)

- Function arguments no longer accept expressions created with `expr()` or `exprs()` as inputs; instead filter expressions can be passed "as is" and multiple variables have to be wrapped inside `vars()` (#187)

  **Old:**

  ```r
  derive_extreme_flag(
    vs,
    new_var = LASTFL,
    by_vars = exprs(USUBJID, VSTESTCD, VISIT),
    order = exprs(VSTPTNUM),
    mode = "last",
    flag_filter = expr(VISIT != "BASELINE")
  )
  ```

  **New:**

  ```r
  derive_extreme_flag(
    vs,
    new_var = LASTFL,
    by_vars = vars(USUBJID, VSTESTCD, VISIT),
    order = vars(VSTPTNUM),
    mode = "last",
    flag_filter = VISIT != "BASELINE"
  )
  ```
  
- `read_dap_m3()` and `initialize()` have been migrated to {admiral.roche} (#272)

- The `start_date` and `end_date` parameters of `derive_var_ady()`, `derive_var_aendy()` and `derive_var_astdy()` have been renamed to `reference_date` and `date`, respectively (#121)


## Bug Fixes

- `derive_var_basetype()` no longer drops records which do not match any condition defined in the `basetype` argument (#226)

- Join warnings like "Column `USUBJID` has different attributes on LHS and RHS of join when using left_join()" are no longer displayed (#271)

- For datetimes with time imputed to "00:00:00" the time part is now displayed (#206)


## Documentation

- [Frequently Asked Questions](https://pharmaverse.github.io/admiral/cran-release/articles/faq.html)

- [Creating ADSL](https://pharmaverse.github.io/admiral/cran-release/articles/adsl.html)

- [Creating a BDS Finding ADaM](https://pharmaverse.github.io/admiral/cran-release/articles/bds_finding.html)

- [Creating an OCCDS ADaM](https://pharmaverse.github.io/admiral/cran-release/articles/occds.html)
