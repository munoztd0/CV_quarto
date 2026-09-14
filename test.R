# dummy_logs.R
logs <- list(
  list(id = "ID: 101", value = 15.5),
  list(id = "ID: 102", value = 22.1),
  list(id = "ID: 103", value = 8.9),
  list(id = "ID: 104", value = 30.2)
)


process_api_logs <- function(logs){
  logs |>
  purrr::map(\(x) {
              tibble::tibble(
                id = as.integer(stringr::str_remove(x$id, "ID: ")), 
                value = vctrs::vec_cast(x$value, to = double() )
            )
            }) |>
            purrr::list_rbind()
}

process_api_logs(logs)


# Dummy input for your testing
raw_logs <- list(
  list(request_id = "REQ-001", payload_size = 1024.5, status_code = 200L),
  list(request_id = "REQ-002", payload_size = 512.0,  status_code = 201L),
  list(request_id = "REQ-003", payload_size = 2048.2, status_code = 404L)
)

process_log_batch <- function(request_id, payload_size, status_code){
    checkmate::assert_string(request_id)
    checkmate::assert_double(payload_size)
    checkmate::assert_integer(request_id)

}