

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
  
  results <- data.frame()
  pb <- prog_bar(length(videoId))
  for(i in 1:length(videoId)) {
    pb$tick()
    temp <- analytics_request(dimensions = "insightTrafficSourceType",
                              filters = paste0("video==", videoId[i]), ...)
    
    results <- dplyr::bind_rows(results, error_checking(temp, videoId[i], "video"))
  }

  return(results)
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
  
  results <- data.frame()
  pb <- prog_bar(length(playlistId))
  for(i in 1:length(playlistId)) {
    pb$tick()
    temp <- analytics_request(dimensions = "insightTrafficSourceType",
                              filters = paste0("playlist==", playlistId[i], ";isCurated==1"),
                              ...)
    
    results <- dplyr::bind_rows(results, error_checking(temp, playlistId[i], "playlist"))
  }

  return(results)
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
  temp <- analytics_request(dimensions = "insightTrafficSourceType", ...)
  return(temp)
}
