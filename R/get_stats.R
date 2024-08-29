

#' Video Statistics
#'
#' @description
#' Returns high level video stats.
#'
#' @param videoId Required. String. Id of YouTube video.
#' @param ... Addt. arguments passed to \code{analytics_request}
#'
#' @return data.frame
#' @export
#'
#' @examples
#' \dontrun{
#' video_stats(videoId = "dQw4w9WgXcQ")
#' } 

video_stats <- function(videoId = NULL, ...) {
  
  results <- data.frame()
  pb <- prog_bar(length(videoId))
  for(i in 1:length(videoId)) {
    pb$tick()
    temp <- analytics_request(filters = paste0("video==", videoId[i]), ...)
    
    results <- dplyr::bind_rows(results, error_checking(temp, videoId[i], "video"))
  }
  
  return(results)
}


#' Playlist Statistics
#' 
#' #' @description
#' Returns high level video stats.
#'
#' @param playlistId Required. Strings. Id of YouTube Playlist
#' @param ... Addt. arguments passed to \code{analytics_request}
#'
#' @return data.frame
#' @export
#'
#' @examples
#' \dontrun{
#' playlist_stats(playlistId = "PL2MI040U_GXq1L5JUxNOulWCyXn-7QyZK")
#' }


playlist_stats <- function(playlistId = NULL, ...) {
  
  results <- data.frame()
  pb <- prog_bar(length(playlistId))
  for(i in 1:length(playlistId)) {
    pb$tick()
    temp <- analytics_request(filters = paste0("playlist==", playlistId[i], ";isCurated==1"),
                              ...)
    
    results <- dplyr::bind_rows(results, error_checking(temp, playlistId[i], "playlist"))
  }
  return(results)
}


#' Channel Statistics
#'
#'#' @description
#' Returns high level video stats.
#'
#' @param ... Addt. arguments passed to \code{analytics_request}
#'
#' @return data.frame
#' @export
#'
#' @examples
#' \dontrun{
#' channel_stats()
#' }

channel_stats <- function(...) {
  temp <- analytics_request(...)
  return(temp)
}
