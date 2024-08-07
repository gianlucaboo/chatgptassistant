#' Create and store a new therad
#'
#' @param thread_path The path to the thread object
#' @param api_key The OpenAI Api key
#'
#' @return An Thread object. See https://platform.openai.com/docs/api-reference/assistants/thread
#' @export
#'
#' @import httr2
#' @importFrom utils menu
#' @importFrom chatgptassistant thread_delete
#' @importFrom chatgptassistant thread_create
#' @importFrom chatgptassistant thread_get
#'
#' @examples
#' thread_manage()

thread_manage <- function(thread_path, api_key) {

  thread_delete <-
    utils::menu(c("Yes", "No"), title = "Do you want to create a new thread?")

  if (thread_delete == 1) {
    thread <-
      thread_delete(thread_id = readRDS(thread_path)$id,
                    api_key = api_key)
    thread <-
      thread_create(api_key)

    saveRDS(thread, paste0(thread_path))
  } else{
    thread <-
      thread_get(thread_id = readRDS(thread_path)$id,
                 api_key = api_key)
  }
return(thread)
}
