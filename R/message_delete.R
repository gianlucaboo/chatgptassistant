#' Delete a Message
#'
#' @param thread_id The Thread ID
#' @param message_id The Message ID
#' @param api_key The OpenAI Api key
#'
#' @return Information on the deleted Message object. See https://platform.openai.com/docs/api-reference/messages/object
#' @export
#'
#' @import httr2
#' @examples See platform.openai.com/docs/api-reference/messages/deleteMessage

message_delete <- function(thread_id, message_id, api_key){
  httr2::request(paste0("https://api.openai.com/v1/threads/", thread_id, "/messages/", message_id)) |>
    httr2::req_auth_bearer_token(token=api_key) |>
    httr2::req_headers("Content-Type"="application/json", "OpenAI-Beta"="assistants=v2") |>
    httr2::req_method("DELETE") |>
    httr2::req_perform() |>
    httr2::resp_body_json()
}
