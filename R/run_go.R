#' Execture run
#'
#' @param thread_id Thread id
#' @param run_id Run id
#' @param token Token
#'
#' @return A run
#' @export
#'
#' @examples See chatgpt

run_go <- function(thread_id, run_id, token) {
  httr2::request(paste0("https://api.openai.com/v1/threads/", thread_id, "/runs/", run_id,"/messages")) |>
    httr2::req_auth_bearer_token(token=token) |>
    httr2::req_headers("Content-Type"="application/json", "OpenAI-Beta"="assistants=v2") |>
    httr2::req_perform() |>
    httr2::resp_body_json()
}
