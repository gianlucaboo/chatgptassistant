#' List Assistants
#'
#' @param api_key The OpenAI Api key
#'
#' @return A list of Assistants objects. See https://platform.openai.com/docs/api-reference/assistants/object
#' @export
#'
#' @import httr2
#' @examples See platform.openai.com/docs/api-reference/assistants/listAssistants

assistant_list <- function(api_key) {
  httr2::request("https://api.openai.com/v1/assistants?order=desc&limit=20") |>
    httr2::req_auth_bearer_token(token=api_key) |>
    httr2::req_headers("Content-Type"="application/json", "OpenAI-Beta"="assistants=v2") |>
    httr2::req_perform() |>
    httr2::resp_body_json() |>
    _[["data"]]
}

