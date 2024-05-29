#' Create run
#'
#' @param thread_id thread ID
#' @param asst_id assistant id
#' @param token token
#'
#' @return A run
#' @export
#'
#' @examples See chatgpt

run_create <- function(thread_id, asst_id, token) {
  httr2::request(paste0("https://api.openai.com/v1/threads/", thread_id, "/runs")) |>
    httr2::req_auth_bearer_token(token=token) |>
    httr2::req_headers("Content-Type"="application/json", "OpenAI-Beta"="assistants=v2") |>
    httr2::req_body_json(data=list(assistant_id=asst_id)) |>
    httr2::req_perform() |>
    httr2::resp_body_json()
}
