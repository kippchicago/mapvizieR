% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/cgp_prep.R
\name{preferred_cdf_baseline}
\alias{preferred_cdf_baseline}
\title{composite / preferred cdf baseline}
\usage{
preferred_cdf_baseline(cdf, start_fws, start_year_offset, end_fws,
  end_academic_year, start_fws_prefer)
}
\arguments{
\item{cdf}{conforming cdf}

\item{start_fws}{two or more seasons}

\item{start_year_offset}{vector of integers. 
0 if start season is same, -1 if start is prior year.}

\item{end_fws}{ending season}

\item{end_academic_year}{ending academic year}

\item{start_fws_prefer}{which term is preferred?}
}
\value{
cdf with one row per student/subject
}
\description{
given a vector of preferred baselines, will return
one row per student
}
