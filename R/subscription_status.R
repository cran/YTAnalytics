

#' Video Subscription Status
#' 
#' @description
#' Returns the subscription status of video views.
#'
#' @param videoId Required. String. Id of YouTube video.
#' @param ... Addt. arguments passed to \code{analytics_request}
#'
#' @return data.frame
#' @export
#'
#' @examples
#' \dontrun{
#' video_subscription_status(videoId = "dQw4w9WgXcQ")
#' } 

video_subscription_status <- function(videoId = NULL, ...) {
  temp <- analytics_request(dimensions = "subscribedStatus",
                            metrics = "views,estimatedMinutesWatched",
                            filters = paste0("video==", videoId), ...)
  return(temp)
}


#' Title
#' 
#' #' @description
#' Returns the subscription status of playlist views.
#'
#' @param playlistId Required. String. Id of YouTube Playlist
#' @param ... Addt. arguments passed to \code{analytics_request}
#'
#' @return data.frame
#' @export
#'
#' @examples
#' \dontrun{
#' playlist_subscription_status(playlistId = "PL2MI040U_GXq1L5JUxNOulWCyXn-7QyZK")
#' } 

playlist_subscription_status <- function(playlistId = NULL, ...) {
  temp <- analytics_request(dimensions = "subscribedStatus",
                            metrics = "views,estimatedMinutesWatched",
                            filters = paste0("playlist==", playlistId, ";isCurated==1"), ...)
  return(temp)
}


#' Title
#' 
#' #' @description
#' Returns the subscription status of channel views.
#'
#' @param ... Addt. arguments passed to \code{analytics_request}
#'
#' @return data.frame
#' @export
#'
#' @examples
#' \dontrun{
#' channel_subscription_status()
#' }

channel_subscription_status <- function(...) {
  temp <- analytics_request(dimensions = "subscribedStatus",
                            metrics = "views,estimatedMinutesWatched", ...)
  return(temp)
}