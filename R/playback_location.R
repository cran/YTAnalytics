

#' Video Playback Location
#' 
#' @description
#' Returns the type of page or application where video playbacks occurred.
#' 
#' @details For more information, refer to 
#' \url{https://developers.google.com/youtube/analytics/dimensions#Playback_Location_Dimensions}
#'
#' @param videoId Required. String. Id of YouTube video.
#' @param ... Addt. arguments passed to \code{analytics_request}
#'
#' @return data.frame
#' @export
#'
#' @examples
#' \dontrun{
#' video_playback_location(videoId = "dQw4w9WgXcQ")
#' }

video_playback_location <- function(videoId = NULL, ...) {
  
  results <- data.frame()
  pb <- prog_bar(length(videoId))
  for(i in 1:length(videoId)) {
    pb$tick()
    temp <- analytics_request(dimensions = "insightPlaybackLocationType",
                              filters = paste0("video==", videoId[i]), ...)
    
    results <- dplyr::bind_rows(results, error_checking(temp, videoId[i], "video"))
  }

  return(results)
}


#' Playlist Playback Location
#' 
#' @description
#' Returns the type of page or application where video playbacks occurred.
#' 
#' @details For more information, refer to 
#' \url{https://developers.google.com/youtube/analytics/dimensions#Playback_Location_Dimensions}
#'
#' @param playlistId Required. String. Id of YouTube playlist.
#' @param ... Addt. arguments passed to \code{analytics_request}
#'
#' @return data.frame
#' @export
#'
#' @examples
#' \dontrun{
#' playlist_playback_location(playlistId = "PL2MI040U_GXq1L5JUxNOulWCyXn-7QyZK")
#' }

playlist_playback_location <- function(playlistId = NULL, ...) {
  
  results <- data.frame()
  pb <- prog_bar(length(playlistId))
  for(i in 1:length(playlistId)) {
    pb$tick()
    temp <- analytics_request(dimensions = "insightPlaybackLocationType",
                              filters = paste0("playlist==", playlistId[i], ";isCurated==1"), ...)
    
    results <- dplyr::bind_rows(results, error_checking(temp, playlistId[i], "playlist"))
  }
  
  return(results)
}


#' Channel Playback Location
#' 
#' @description
#' Returns the type of page or application where video playbacks occurred.
#' 
#' @details For more information, refer to 
#' \url{https://developers.google.com/youtube/analytics/dimensions#Playback_Location_Dimensions}
#'
#' @param ... Addt. arguments passed to \code{analytics_request}
#'
#' @return data.frame
#' @export
#'
#' @examples
#' \dontrun{
#' channel_playlist_location()
#' }

channel_playback_location <- function(...) {
  temp <- analytics_request(dimensions = "insightPlaybackLocationType", ...)
  return(temp)
}