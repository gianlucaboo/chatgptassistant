#' Retrieve an assistant
#'
#' @param assistant_id The ChatGPT assistant ID
#' @param token A ChatGPT token
#'
#' @return A list containing the assistants parameters
#' @export
#'
#' @examples See ChatGPT

assistant_get <- function(assistant_id, token){
  httr2::request(paste0("https://api.openai.com/v1/assistants/", assistant_id)) |>
    httr2::req_auth_bearer_token(token = token) |>
    httr2::req_headers("Content-Type" = "application/json", "OpenAI-Beta"="assistants=v2") |>
    httr2::req_perform() |>
    httr2::resp_body_json()
}
