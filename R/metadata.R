

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
  pb <- prog_bar(length(videoId))
  for(i in 1:length(videoId)) {
    pb$tick()
    temp <- as.data.frame(data_video_request(part = "snippet", id = videoId[i], ...))
    if(!is.null(temp)) {
      temp2 <- temp$items.snippet
      metadata <- dplyr::bind_rows(metadata, error_checking(temp2, videoId[i], "video"))
    }
  }
  return(metadata)
}



#' Playlist Metadata
#'
#' @param playlistId Required. String. Id of YouTube Video.
#' @param ... Addt. arguments passed to \code{data_video_request}
#'
#' @return data.frame
#' @export
#'
#' @examples
#' \dontrun{
#' playlist_metadata(playlistId = "dQw4w9WgXcQ")
#' }

playlist_metadata <- function(playlistId = NULL, ...) {
  
  metadata <- data.frame()
  pb <- prog_bar(length(playlistId))
  for(i in 1:length(playlistId)) {
    pb$tick()
    temp <- as.data.frame(data_playlist_request(part = "snippet", id = playlistId[i], ...))
    if(!is.null(temp)) {
      temp2 <- temp$items.snippet
      metadata <- dplyr::bind_rows(metadata, error_checking(temp2, playlistId[i], "playlist"))
    }
  }
  return(metadata)
}
