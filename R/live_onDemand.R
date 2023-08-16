

#' Video Live & OnDemand Data
#' 
#' @description
#' Return video data split by live & on demand.
#'
#' @param videoId Required.String. Id of YouTube video.
#' @param ... Addt. arguments passed to \code{analytics_request}
#'
#' @return data.frame
#' @export
#'
#' @examples
#' \dontrun{
#' video_live_onDemand(videoId = "dQw4w9WgXcQ")
#' }

video_live_onDemand <- function(videoId = NULL, ...) {
  temp <- analytics_request(dimensions = "liveOrOnDemand",
                            metrics = "views,estimatedMinutesWatched,averageViewDuration",
                            filters = paste0("video==", videoId), ...)
  return(temp)
}


#' Playlist Live & OnDemand Data
#' 
#' @description
#' Return playlist data split by live & on demand.
#'
#' @param playlistId Required. String. Id of YouTube playlist.
#' @param ... Addt. arguments passed to \code{analytics_request}
#'
#' @return data.frame
#' @export
#'
#' @examples
#' \dontrun{
#' playlist_live_onDemand(playlistId = "PL2MI040U_GXq1L5JUxNOulWCyXn-7QyZK")
#' }

playlist_live_onDemand <- function(playlistId = NULL, ...) {
  temp <- analytics_request(dimensions = "liveOrOnDemand",
                            metrics = "views,estimatedMinutesWatched,averageViewDuration",
                            filters = paste0("playlist==", playlistId, ";isCurated==1"), ...)
  return(temp)
}


#' Channel Live & OnDemand Data
#' 
#' @description
#' Return channel data split by live & on demand.
#'
#' @param ... Addt. arguments passed to \code{analytics_request}
#'
#' @return data.frame()
#' @export
#'
#' @examples
#' \dontrun{
#' channel_live_onDemand()
#' }

channel_live_onDemand <- function(...) {
  temp <- analytics_request(dimensions = "liveOrOnDemand",
                            metrics = "views,estimatedMinutesWatched,averageViewDuration", ...)
  return(temp)
}