#' Create Run
#'
#' @param thread_id The Thread ID
#' @param assistant_id The Assistant ID
#' @param api_key The OpenAI Api key
#'
#' @return A Run object. See https://platform.openai.com/docs/api-reference/runs/object
#' @export
#'
#' @examples See https://platform.openai.com/docs/api-reference/runs/createRun

run_create <- function(thread_id, assistant_id, api_key) {
  httr2::request(paste0("https://api.openai.com/v1/threads/", thread_id, "/runs")) |>
    httr2::req_auth_bearer_token(token=api_key) |>
    httr2::req_headers("Content-Type"="application/json", "OpenAI-Beta"="assistants=v2") |>
    httr2::req_body_json(data=list(assistant_id=asst_id)) |>
    httr2::req_perform() |>
    httr2::resp_body_json()
}
