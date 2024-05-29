#' Create a new thread
#'
#' @param token A token
#'
#' @return A new thread object
#' @export
#'
#' @examples See ChatGPT

thread_create <- function(token) {
  httr2::request("https://api.openai.com/v1/threads") |>
    httr2::req_auth_bearer_token(token=token) |>
    httr2::req_headers("Content-Type"="application/json", "OpenAI-Beta"="assistants=v2") |>
    httr2::req_body_json(data=list()) |>
    httr2::req_perform() |>
    httr2::resp_body_json()
}
