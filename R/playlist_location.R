

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
  temp <- analytics_request(dimensions = "insightPlaybackLocationType",
                            metrics = "views,estimatedMinutesWatched",
                            filters = paste0("video==", videoId), ...)
  return(temp)
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
  temp <- analytics_request(dimensions = "insightPlaybackLocationType",
                            metrics = "views,estimatedMinutesWatched",
                            filters = paste0("playlist==", playlistId, ";isCurated==1"), ...)
  return(temp)
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
  temp <- analytics_request(dimensions = "insightPlaybackLocationType",
                            metrics = "views,estimatedMinutesWatched", ...)
  return(temp)
}