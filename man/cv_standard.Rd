% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/cv_standard.R
\name{cv_standard}
\alias{cv_standard}
\title{The standard cross-validator (CV)}
\usage{
cv_standard(
  datasource,
  classifier,
  feature_preprocessors,
  result_metrics = NULL,
  num_resample_runs = 50,
  test_only_at_training_time = FALSE,
  run_parallel = TRUE
)
}
\arguments{
\item{datasource}{A datasource (DS) object that will generate the training
and test data.}

\item{classifier}{A classifier (CS) object that will learn parameters based
on the training data and will generate predictions based on the test data.}

\item{feature_preprocessors}{A list of feature preprocessor (FP) objects that
learn preprocessing parameters from the training data and apply
preprocessing of both the training and test data based on these parameters.}

\item{result_metrics}{A list of result metric (RM) objects that are used to
evaluate the classification performance. If this is set to null then the
rm_main_results(), rm_confusion_matrix() results metrics will be used.}

\item{num_resample_runs}{The number of times the cross-validation should be
run (i.e., "resample runs"), where on each run, new training and test sets
are generated. If pseudo-populations are used (e.g., with the ds_basic),
then new pseudo-populations will be generated on each resample run as well.}

\item{test_only_at_training_time}{A boolean indicated whether the classifier
should only be trained and tested at the same time point (i.e., if TRUE a
temporal cross-decoding analysis will NOT be run). Setting this to true can
potentially speed up the analysis and save memory at the cost of not
calculated the temporal cross decoding results.}

\item{run_parallel}{A boolean to indicate whether the code should be run in
parallel. It is useful to set this to FALSE for debugging purposes or
if you are running a job that takes a lot of memory and runtime is not
of much concern.}
}
\description{
This object runs a decoding analysis where a classifier is repeatedly trained
and tested using cross-validation.
}
\details{
A cross-validator object takes a datasource (DS), a classifier (CL),
feature preprocessors (FP) and result metric (RM) objects, and runs
multiple cross-validation cycles where:
\enumerate{
\item A datasource (DS) generates training and test data splits of the data
\item Feature preprocessors (FPs) do preprocessing of the data
\item A classifier (CL) is trained and predictions are generated on a test set
\item Result metrics (RMs) assess the accuracy of the predictions and compile
the results.
}
}
\examples{
data_file <- system.file("extdata/ZD_150bins_50sampled.Rda",
  package = "NDTr"
)

ds <- ds_basic(data_file, "stimulus_ID", 18)
fps <- list(fp_zscore())
cl <- cl_max_correlation()

cv <- cv_standard(ds, cl, fps)


}
\concept{cross-validator}
