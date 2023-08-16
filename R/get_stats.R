

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
  temp <- analytics_request(metrics = paste0("views,averageViewDuration,estimatedMinutesWatched,shares,likes,",
                                             "dislikes,comments,subscribersGained,subscribersLost,averageViewPercentage"),
                            filters = paste0("video==", videoId), ...)
  return(temp)
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
  temp <- analytics_request(metrics = paste0("views,averageViewDuration,estimatedMinutesWatched"),
                            filters = paste0("playlist==", playlistId, ";isCurated==1"), ...)
  return(temp)
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
  temp <- analytics_request(metrics = paste0("views,averageViewDuration,estimatedMinutesWatched,shares,likes,",
                                             "dislikes,comments,subscribersGained,subscribersLost"),
                            sort="-views", ...)
  return(temp)
}