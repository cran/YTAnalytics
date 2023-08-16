

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
  temp <- as.data.frame(data_video_request(part = "snippet", id = videoId, ...))
  temp2 <- temp$items.snippet[, c("publishedAt", "title", "description", "channelId",
                                  "channelTitle", "tags")]
  return(temp2)
}