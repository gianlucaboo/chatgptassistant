#' Retrieve an Assistant
#'
#' @param assistant_id The Assistant ID
#' @param api_key The OpenAI Api key
#'
#' @return An Assistant object. See https://platform.openai.com/docs/api-reference/assistants/object
#' @export
#'
#' @import httr2
#' @examples See platform.openai.com/docs/api-reference/assistants/getAssistant

assistant_get <- function(assistant_id, api_key){
  httr2::request(paste0("https://api.openai.com/v1/assistants/", assistant_id)) |>
    httr2::req_auth_bearer_token(token = api_key) |>
    httr2::req_headers("Content-Type" = "application/json", "OpenAI-Beta"="assistants=v2") |>
    httr2::req_perform() |>
    httr2::resp_body_json()
}
