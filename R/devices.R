

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
  
  results <- data.frame()
  for(i in 1:length(videoId)) {
    temp <- analytics_request(dimensions = "deviceType",
                              filters = paste0("video==", videoId[i]), ...)
    
    results <- dplyr::bind_rows(results, error_checking(temp, videoId[i], "video"))
  }
  
  return(results)
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
  
  results <- data.frame()
  for(i in 1:length(playlistId)) {
    temp <- analytics_request(dimensions = "deviceType",
                              filters = paste0("playlist==", playlistId[i], ";isCurated==1"), ...)
    
    results <- dplyr::bind_rows(results, error_checking(temp, playlistId[i], "playlist"))
  }
  
  return(results)
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
  temp <- analytics_request(dimensions = "deviceType", ...)
  return(temp)
}
