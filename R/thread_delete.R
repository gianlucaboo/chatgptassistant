#' Delete a Thread
#'
#' @param thread_id The Thread ID
#' @param api_key The OpenAI Api key
#'
#' @return Information on the deleted Thread object. See https://platform.openai.com/docs/api-reference/threads/object
#' @export
#'
#' @import httr2
#' @examples
#' thread_delete()

thread_delete <- function(thread_id, api_key){
  httr2::request(paste0("https://api.openai.com/v1/threads/", thread_id)) |>
    httr2::req_auth_bearer_token(token=api_key) |>
    httr2::req_headers("Content-Type"="application/json", "OpenAI-Beta"="assistants=v2") |>
    httr2::req_method("DELETE") |>
    httr2::req_perform() |>
    httr2::resp_body_json()
}
