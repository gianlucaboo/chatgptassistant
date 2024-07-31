#' List Runs
#'
#' @param thread_id The Thread ID
#' @param api_key The OpenAI Api key
#'
#'
#' @return A list of Run objects. See https://platform.openai.com/docs/api-reference/runs/object
#' @export
#'
#' @import httr2
#' @examples See platform.openai.com/docs/api-reference/runs/listRuns

run_list <- function(thread_id, api_key) {
  httr2::request(paste0("https://api.openai.com/v1/threads/", thread_id, "/runs")) |>
    httr2::req_auth_bearer_token(token=api_key) |>
    httr2::req_headers("Content-Type"="application/json", "OpenAI-Beta"="assistants=v2") |>
    httr2::req_perform() |>
    httr2::resp_body_json()
}
