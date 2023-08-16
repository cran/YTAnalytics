

#' Video Traffic Sources Data
#' 
#' @description
#' Returns top traffic sources by views 
#' 
#' @param videoId Required. String. Id of YouTube video.
#' @param ... Addt. arguments passed to \code{analytics_request}
#'
#' @return data.frame
#' @export
#'
#' @examples
#' \dontrun{
#' video_traffic_sources(videoId = "dQw4w9WgXcQ")
#' } 

video_traffic_sources <- function(videoId = NULL, ...) {
  temp <- analytics_request(dimensions = "insightTrafficSourceType",
                            metrics = "views,estimatedMinutesWatched",
                            filters = paste0("video==", videoId), ...)
  return(temp)
}


#' Playlist Traffic Sources Data
#' 
#' @description
#' Returns top traffic sources by views
#'
#' @param playlistId Required. String. Id of YouTube playlist.
#' @param ... Addt. arguments passed to \code{analytics_request}
#'
#' @return data.frame
#' @export
#'
#' @examples
#' \dontrun{
#' playlist_traffic_sources(playlistId = "PL2MI040U_GXq1L5JUxNOulWCyXn-7QyZK")
#' } 

playlist_traffic_sources <- function(playlistId = NULL, ...) {
  temp <- analytics_request(dimensions = "insightTrafficSourceType",
                            metrics = "views,estimatedMinutesWatched",
                            filters = paste0("playlist==", playlistId),
                            ...)
  return(temp)
}


#' Channel Traffic Sources Data
#' 
#' @description
#' Returns top traffic sources by views
#'
#' @param ... Addt. arguments passed to \code{analytics_request}
#'
#' @return data.frame
#' @export
#'
#' @examples
#' \dontrun{
#' channel_traffic_sources()
#' }

channel_traffic_sources <- function(...) {
  temp <- analytics_request(dimensions = "insightTrafficSourceType", 
                            metrics = "views,estimatedMinutesWatched", ...)
  return(temp)
}
