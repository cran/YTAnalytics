

#' Video Device Data
#' 
#' @description
#' Returns top devices by views 
#' 
#' @param videoId Required. String. Id of YouTube video.
#' @param ... Addt. arguments passed to \code{analytics_request}
#'
#' @return data.frame
#' @export
#'
#' @examples
#' \dontrun{
#' video_devices(videoId = "dQw4w9WgXcQ")
#' } 

video_devices <- function(videoId = NULL, ...) {
  temp <- analytics_request(dimensions = "deviceType",
                            metrics = "views,estimatedMinutesWatched",
                            filters = paste0("video==", videoId), ...)
  return(temp)
}


#' Playlist Device Data
#' 
#' @description
#' Returns top devices by views
#'
#' @param playlistId Required. String. Id of YouTube playlist.
#' @param ... Addt. arguments passed to \code{analytics_request}
#'
#' @return data.frame
#' @export
#'
#' @examples
#' \dontrun{
#' playlist_devices(playlistId = "PL2MI040U_GXq1L5JUxNOulWCyXn-7QyZK")
#' } 

playlist_devices <- function(playlistId = NULL, ...) {
  temp <- analytics_request(dimensions = "deviceType",
                            metrics = "views,estimatedMinutesWatched",
                            filters = paste0("playlist==", playlistId), ...)
  return(temp)
}


#' Channel Device Data
#' 
#' @description
#' Returns top devices by views
#'
#' @param ... Addt. arguments passed to \code{analytics_request}
#'
#' @return data.frame
#' @export
#'
#' @examples
#' \dontrun{
#' channel_devices()
#' }

channel_devices <- function(...) {
  temp <- analytics_request(dimensions = "deviceType",
                            metrics = "views,estimatedMinutesWatched", ...)
  return(temp)
}
