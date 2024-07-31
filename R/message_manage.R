#' Manage Messages
#'
#' @param thread_id The Thread ID
#' @param api_key The OpenAI Api key
#'
#' @return Print the status
#' @export
#'
#' @import httr2
#' @importFrom utils menu
#' @importFrom chatgptassistant message_list
#' @importFrom chatgptassistant message_delete
#' @examples
#' See platform.openai.com/docs/api-reference/messages

message_manage <- function(thread_id, api_key){
  message_delete <- utils::menu(c("Yes", "No"), title = "Do you want to delete all the messages?")
  if (message_delete == 1) {
    message_n <- message_list(thread_id=thread_id,
                              api_key=api_key)[["data"]] |> length()

    while(length(message_n)>0) {
      delete_message <-  message_list(thread_id=thread_id,
                                      api_key=api_key)[["data"]] |>
        rbindlist() |>
        pull(id) |>
        walk(function(message_id) {
          message_delete(thread_id=thread$id, message_id=message_id, api_key=api_key)
        })
      message_n <-
        message_list(thread_id=thread_id,
                     api_key=api_key)[["data"]] |> length()
    }
    print("All messages in the thread have been deleted")
  } else {
    message_n <- message_list(thread_id=thread_id,
                              api_key=api_key)[["data"]] |> length()
    print(paste0("The thread contains",  message_n, " message(s)"))
  }
}