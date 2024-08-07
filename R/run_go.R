#' Execture a Run
#'
#' @param thread_id The Thread ID
#' @param run_id The Run ID
#' @param api_key The OpenAI Api key
#'
#' @return A Run object. See https://platform.openai.com/docs/api-reference/runs/object
#' @export
#'
#' @import httr2
#' @examples
#' run_go()

run_go <- function(thread_id, run_id, api_key) {
  httr2::request(paste0("https://api.openai.com/v1/threads/", thread_id, "/runs/", run_id,"/messages")) |>
    httr2::req_auth_bearer_token(token=api_key) |>
    httr2::req_headers("Content-Type"="application/json", "OpenAI-Beta"="assistants=v2") |>
    httr2::req_perform() |>
    httr2::resp_body_json()
}
