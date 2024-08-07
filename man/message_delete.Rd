% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/message_delete.R
\name{message_delete}
\alias{message_delete}
\title{Delete a Message}
\usage{
message_delete(thread_id, message_id, api_key)
}
\arguments{
\item{thread_id}{The Thread ID}

\item{message_id}{The Message ID}

\item{api_key}{The OpenAI Api key}
}
\value{
Information on the deleted Message object. See https://platform.openai.com/docs/api-reference/messages/object
}
\description{
Delete a Message
}
\examples{
message_delete()
}
