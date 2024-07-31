#' Create an Assistant
#'
#' @param instructions The instructions for the assistant
#' @param name The name of the assistant
#' @param model The model version (e.g., "gpt-4o")
#' @param api_key The OpenAI Api key
#'
#' @return An Assistant object. See https://platform.openai.com/docs/api-reference/assistants/object
#' @export
#'
#' @import httr2
#' @examples See https://platform.openai.com/docs/api-reference/assistants/createAssistant

assistant_create <- function(instructions, name, model, api_key){
  httr2::request(paste0("https://api.openai.com/v1/assistants/")) |>
    httr2::req_auth_bearer_token(token = api_key) |>
    httr2::req_headers("Content-Type" = "application/json", "OpenAI-Beta"="assistants=v2") |>
    httr2::req_body_json(data=list(instructions=instructions, name=name, model=model))|>
    httr2::req_perform() |>
    httr2::resp_body_json()
}
