#' List assistants
#'
#' @param token A ChatGPT token
#'
#' @return A list with all the available ChatGPT assistants
#' @export
#'
#' @examples See ChatGPT

assistant_list <- function(token) {
  httr2::request("https://api.openai.com/v1/assistants?order=desc&limit=20") |>
    httr2::req_auth_bearer_token(token = token) |>
    httr2::req_headers("Content-Type" = "application/json", "OpenAI-Beta"="assistants=v2") |>
    httr2::req_perform() |>
    httr2::resp_body_json() |>
    _[["data"]]
}

