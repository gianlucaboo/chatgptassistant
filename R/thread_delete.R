#' Delete a thread
#'
#' @param thread_id The thread ID
#' @param token The token
#'
#' @return Pink
#' @export
#'
#' @examples See ChatGPT

thread_delete <- function(thread_id, token){
  httr2::request(paste0("https://api.openai.com/v1/threads/", thread_id)) |>
    httr2::req_auth_bearer_token(token=token) |>
    httr2::req_headers("Content-Type"="application/json", "OpenAI-Beta"="assistants=v2") |>
    httr2::req_method("DELETE") |>
    httr2::req_perform() |>
    httr2::resp_body_json()
}
