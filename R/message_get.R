#' Get a specific message
#'
#' @param thread_id The thread id
#' @param message_id The message id
#' @param token The token
#'
#' @return Object
#' @export
#'
#' @examples See ChatGPT

message_get <- function(thread_id, message_id, token){
  httr2::request(paste0("https://api.openai.com/v1/threads/", thread_id, "/messages/", message_id)) |>
    httr2::req_auth_bearer_token(token=token) |>
    httr2::req_headers("Content-Type"="application/json", "OpenAI-Beta"="assistants=v2") |>
    httr2::req_perform() |>
    httr2::resp_body_json()
}
