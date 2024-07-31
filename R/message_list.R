#' List Messages
#'
#' @param thread_id The Thread ID
#' @param api_key The OpenAI Api key
#'
#' @return A list of Message objects. See https://platform.openai.com/docs/api-reference/messages/object
#' @export
#'
#' @import httr2
#' @examples
#' See platform.openai.com/docs/api-reference/messages

message_list <- function(thread_id, api_key){
  httr2::request(paste0("https://api.openai.com/v1/threads/", thread_id, "/messages")) |>
    httr2::req_auth_bearer_token(token=api_key) |>
    httr2::req_headers("Content-Type"="application/json", "OpenAI-Beta"="assistants=v2") |>
    httr2::req_perform() |>
    httr2::resp_body_json()
}
