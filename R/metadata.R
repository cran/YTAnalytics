

#' Video Metadata
#'
#' @param videoId Required. String. Id of YouTube Video.
#' @param ... Addt. arguments passed to \code{data_video_request}
#'
#' @return data.frame
#' @export
#'
#' @examples
#' \dontrun{
#' video_metadata(videoId = "dQw4w9WgXcQ")
#' }

video_metadata <- function(videoId = NULL, ...) {
  
  metadata <- data.frame()
  for(i in 1:length(videoId)) {
    temp <- as.data.frame(data_video_request(part = "snippet", id = videoId[i], ...))
    if(!is.null(temp)) {
      temp2 <- temp$items.snippet
      metadata <- dplyr::bind_rows(metadata, error_checking(temp2, videoId[i], "video"))
    }
  }
  return(metadata)
}