% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/impute_rit.R
\name{impute_rit_simple_average}
\alias{impute_rit_simple_average}
\title{Use simple averaging to impute missing rows}
\usage{
impute_rit_simple_average(cdf, interpolate_only = TRUE)
}
\arguments{
\item{cdf}{a CDF data frae}

\item{interpolate_only}{should the scaffold return ALL seasons, ever, or only
ones in between the student's first/last test?}
}
\value{
a CDF data frame with imputed rows
}
\description{
Use simple averaging to impute missing rows
}
