

#' Video Traffic Details Data
#' 
#' @description
#' Returns traffic details by views. Check out 
#' \url{https://developers.google.com/youtube/analytics/dimensions#Traffic_Source_Dimensions}
#' for more information.
#' 
#' @param videoId Required. String. Id of YouTube video.
#' @param trafficType Required. String. Type of traffic source. 
#' @param ... Addt. arguments passed to \code{analytics_request}
#'
#' @return data.frame
#' @export
#'
#' @examples
#' \dontrun{
#' video_traffic_sources(videoId = "dQw4w9WgXcQ")
#' } 

video_traffic_details <- function(videoId = NULL, trafficType = "EXT_URL",...) {
  temp <- analytics_request(dimensions = "insightTrafficSourceDetail",
                            metrics = "views,estimatedMinutesWatched",
                            filters = paste0("video==", videoId, 
                                             ";insightTrafficSourceType==", trafficType), ...)
  return(temp)
}


#' Playlist Traffic Sources Data
#' 
#' @description
#' Returns top traffic sources by views.  Check out 
#' \url{https://developers.google.com/youtube/analytics/dimensions#Traffic_Source_Dimensions}
#' for more information.
#'
#' @param playlistId Required. String. Id of YouTube playlist.
#' @param trafficType Required. String. Type of traffic source. 
#' @param ... Addt. arguments passed to \code{analytics_request}
#'
#' @return data.frame
#' @export
#'
#' @examples
#' \dontrun{
#' playlist_traffic_sources(playlistId = "PL2MI040U_GXq1L5JUxNOulWCyXn-7QyZK")
#' } 

playlist_traffic_details <- function(playlistId = NULL, trafficType = "EXT_URL", ...) {
  temp <- analytics_request(dimensions = "insightTrafficSourceDetail",
                            metrics = "views,estimatedMinutesWatched",
                            filters = paste0("playlist==", playlistId, 
                                             ";insightTrafficSourceType==", trafficType), ...)
  return(temp)
}


#' Channel Traffic Sources Data
#' 
#' @description
#' Returns top traffic sources by views.  Check out 
#' \url{https://developers.google.com/youtube/analytics/dimensions#Traffic_Source_Dimensions}
#' for more information.
#'
#' @param trafficType Required. String. Type of traffic source. 
#' @param ... Addt. arguments passed to \code{analytics_request}
#'
#' @return data.frame
#' @export
#'
#' @examples
#' \dontrun{
#' channel_traffic_sources()
#' }

channel_traffic_details <- function(trafficType = "EXT_URL", ...) {
  temp <- analytics_request(dimensions = "insightTrafficSourceDetail", 
                            metrics = "views,estimatedMinutesWatched",
                            filters = paste0("insightTrafficSourceType==", trafficType), ...)
  return(temp)
}
