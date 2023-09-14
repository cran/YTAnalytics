

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
  
  results <- data.frame()
  for(i in 1:length(videoId)) {
    temp <- analytics_request(dimensions = "subscribedStatus",
                              filters = paste0("video==", videoId[i]), ...)
    
    results <- dplyr::bind_rows(results, error_checking(temp, videoId[i], "video"))
  }
  
  return(results)
}


#' Playlist Subscription Status
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
  
  results <- data.frame()
  for(i in 1:length(playlistId)) {
    temp <- analytics_request(dimensions = "subscribedStatus",
                              filters = paste0("playlist==", playlistId[i], ";isCurated==1"), ...)
    
    results <- dplyr::bind_rows(results, error_checking(temp, playlistId[i], "playlist"))
  }
  
  return(results)
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
  temp <- analytics_request(dimensions = "subscribedStatus", ...)
  return(temp)
}