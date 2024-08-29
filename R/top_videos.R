

#' Playlist Top Videos
#' 
#' @description
#' Returns top videos by views.
#'
#' @param playlistId Required. String. Id of YouTube playlist.
#' @param ... Addt. arguments passed to \code{analytics_request}
#'
#' @return data.frame
#' @export
#'
#' @examples
#' \dontrun{
#' playlist_top_videos(playlistId = "PL2MI040U_GXq1L5JUxNOulWCyXn-7QyZK")
#' } 

playlist_top_videos <- function(playlistId = NULL, ...) {
  
  results <- data.frame()
  pb <- prog_bar(length(playlistId))
  for(i in 1:length(playlistId)) {
    pb$tick()
    temp <- analytics_request(dimensions = "video",
                              filters = paste0("playlist==", playlistId[i]), ...)
    
    results <- dplyr::bind_rows(results, error_checking(temp, playlistId[i], "playlist"))
  }
  
  return(results)
}


#' Channel Top Videos
#' 
#' @description
#' Returns top videos by views
#'
#' @param ... Addt. arguments passed to \code{analytics_request}
#'
#' @return data.frame
#' @export
#'
#' @examples
#' \dontrun{
#' channel_top_videos()
#' }

channel_top_videos <- function(...) {
  temp <- analytics_request(dimensions = "video", ...)
  return(temp)
}
