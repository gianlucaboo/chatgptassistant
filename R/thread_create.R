#' Create a Thread
#'
#' @param api_key The OpenAI Api key
#'
#' @return A Thread object. See https://platform.openai.com/docs/api-reference/threads/object
#' @export
#'
#' @import httr2
#' @examples
#' thread_create()

thread_create <- function(api_key) {
  httr2::request("https://api.openai.com/v1/threads") |>
    httr2::req_auth_bearer_token(token=api_key) |>
    httr2::req_headers("Content-Type"="application/json", "OpenAI-Beta"="assistants=v2") |>
    httr2::req_body_json(data=list()) |>
    httr2::req_perform() |>
    httr2::resp_body_json()
}
