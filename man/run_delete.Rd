% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/run_delete.R
\name{run_delete}
\alias{run_delete}
\title{Delete a Run}
\usage{
run_delete(thread_id, run_id, api_key)
}
\arguments{
\item{thread_id}{The Thread ID}

\item{run_id}{The Run ID}

\item{api_key}{The OpenAI Api key}
}
\value{
A Run object. See https://platform.openai.com/docs/api-reference/runs/object
}
\description{
Delete a Run
}
\examples{
run_delete()
}
