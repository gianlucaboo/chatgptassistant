#' Create a Message
#'
#' @param thread_id The Thread ID
#' @param message The message
#' @param api_key The OpenAI Api key
#'
#' @return A Message object. See https://platform.openai.com/docs/api-reference/messages/object
#' @export
#'
#' @import httr2
#' @examples See platform.openai.com/docs/api-reference/messages/createMessage

message_create <- function(thread_id, message, api_key){
  httr2::request(paste0("https://api.openai.com/v1/threads/", thread_id, "/messages")) |>
    httr2::req_auth_bearer_token(token=api_key) |>
    httr2::req_headers("Content-Type"="application/json", "OpenAI-Beta"="assistants=v2") |>
    httr2::req_body_json(data=list(role="user", content=message))|>
    httr2::req_perform() |>
    httr2::resp_body_json()
}
