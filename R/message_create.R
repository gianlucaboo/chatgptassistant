#' Create a new message
#'
#' @param thread_id The thread id
#' @param message The new message
#' @param token The token
#'
#' @return A message list
#' @export
#'
#' @examples See ChatGPT

message_create <- function(thread_id, message, token){
  httr2::request(paste0("https://api.openai.com/v1/threads/", thread_id, "/messages")) |>
    httr2::req_auth_bearer_token(token=token) |>
    httr2::req_headers("Content-Type"="application/json", "OpenAI-Beta"="assistants=v2") |>
    httr2::req_body_json(data=list(role="user", content=message))|>
    httr2::req_perform() |>
    httr2::resp_body_json()
}
