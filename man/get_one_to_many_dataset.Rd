% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/assertions.R
\name{get_one_to_many_dataset}
\alias{get_one_to_many_dataset}
\title{Get One to Many Values that Led to a Prior Error}
\usage{
get_one_to_many_dataset()
}
\description{
Get One to Many Values that Led to a Prior Error
}
\details{
If \code{assert_one_to_one()} detects an issue, the one to many values are stored
in a dataset. This dataset can be retrieved by \code{get_one_to_many_dataset()}.

Note that the function always returns the one to many values from the last
error that has been thrown in the current R session. Thus, after restarting
the R sessions \code{get_one_to_many_dataset()} will return \code{NULL} and after a
second error has been thrown, the dataset of the first error can no longer be
accessed (unless it has been saved in a variable).
}
\examples{
data(adsl)

try(
  assert_one_to_one(adsl, vars(STUDYID), vars(SITEID))
)

get_one_to_many_dataset()
}
\author{
Stefan Bundfuss
}
\keyword{user_utility}