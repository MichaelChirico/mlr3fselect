% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/fselect.R
\name{fselect}
\alias{fselect}
\title{Function for Feature Selection}
\usage{
fselect(
  method,
  task,
  learner,
  resampling,
  measures,
  term_evals = NULL,
  term_time = NULL,
  store_models = FALSE,
  ...
)
}
\arguments{
\item{method}{(\code{character(1)})\cr
Key to retrieve fselector from \link{mlr_fselectors} dictionary.}

\item{task}{(\link[mlr3:Task]{mlr3::Task})\cr
Task to operate on.}

\item{learner}{(\link[mlr3:Learner]{mlr3::Learner}).}

\item{resampling}{(\link[mlr3:Resampling]{mlr3::Resampling})\cr
Uninstantiated resamplings are instantiated during construction
so that all configurations are evaluated on the same data splits.}

\item{measures}{(list of \link[mlr3:Measure]{mlr3::Measure})\cr
Measures to optimize.
If \code{NULL}, \CRANpkg{mlr3}'s default measure is used.}

\item{term_evals}{(\code{integer(1)})\cr
Number of allowed evaluations.}

\item{term_time}{(\code{integer(1)})\cr
Maximum allowed time in seconds.}

\item{store_models}{(\code{logical(1)}).
Store models in benchmark result?}

\item{...}{(named \code{list()})\cr
Named arguments to be set as parameters of the fselector.}
}
\value{
\code{FSelectInstanceSingleCrit} | \code{FSelectInstanceMultiCrit}
}
\description{
Function to optimize the feature set of a \link[mlr3:Learner]{mlr3::Learner}.
}
\examples{
task = tsk("pima")

instance = fselect(
  method = "random_search",
  task = task,
  learner = lrn("classif.rpart"),
  resampling = rsmp ("holdout"),
  measures = msr("classif.ce"),
  term_evals = 4)

# subset task to optimized feature set
task$select(instance$result_feature_set)
}
