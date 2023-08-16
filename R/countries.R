

#' Video Country Data
#' 
#' @description
#' Returns top countries by views 
#' 
#' @param videoId Required. String. Id of YouTube video.
#' @param ... Addt. arguments passed to \code{analytics_request}
#'
#' @return data.frame
#' @export
#'
#' @examples
#' \dontrun{
#' video_countries(videoId = "dQw4w9WgXcQ")
#' } 

video_countries <- function(videoId = NULL, ...) {
  temp <- analytics_request(dimensions = "country",
                            filters = paste0("video==", videoId), ...)
  return(temp)
}


#' Playlist Country Data
#' 
#' @description
#' Returns top countries by views
#'
#' @param playlistId Required. String. Id of YouTube playlist.
#' @param ... Addt. arguments passed to \code{analytics_request}
#'
#' @return data.frame
#' @export
#'
#' @examples
#' \dontrun{
#' playlist_countries(playlistId = "PL2MI040U_GXq1L5JUxNOulWCyXn-7QyZK")
#' } 

playlist_countries <- function(playlistId = NULL, ...) {
  temp <- analytics_request(dimensions = "country",
                            metrics = "views,estimatedMinutesWatched",
                            filters = paste0("playlist==", playlistId),
                            ...)
  return(temp)
}


#' Channel Country Data
#' 
#' @description
#' Returns top countries by views
#'
#' @param ... Addt. arguments passed to \code{analytics_request}
#'
#' @return data.frame
#' @export
#'
#' @examples
#' \dontrun{
#' channel_countries()
#' }

channel_countries <- function(...) {
  temp <- analytics_request(dimensions = "country", ...)
  return(temp)
}
