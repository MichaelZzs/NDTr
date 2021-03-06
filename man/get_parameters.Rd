% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/generic_functions.R
\name{get_parameters}
\alias{get_parameters}
\title{Get parameters of an NDTr object}
\usage{
get_parameters(ndtr_obj)
}
\arguments{
\item{ndtr_obj}{An object from the NDTr package to get the parameters from.}
}
\value{
Returns a data frame with a single row that contains all the NDTr
object's parameter values (e.g., values that were set in the object's
constructor).
}
\description{
Returns the parameters set in an NDTr object to enable reproducible analyses.
}
\details{
This is a generic function that returns a data frame with the parameters of
an NDTr object. All NDTr objects (i.e., DS, FP, CL, RM and CV) need to define
a method that implements this generic function. The CV object's
\code{get_parameters()} method usually will call all the DS, FP, CL, RM and CV
\code{get_parameters()} methods and aggregate and return all the parameters
aggregated from these objects. These aggregated parameters can then be used
to save the results of a particular analysis based on the parameters using
the \code{\link[=log_save_results]{log_save_results()}} function. This method is most frequently used
privately by other NDTr objects to save all the parameters that were used in
an analysis.
}
