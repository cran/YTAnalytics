

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
  
  results <- data.frame()
  for(i in 1:length(videoId)) {
    temp <- analytics_request(dimensions = "country",
                              filters = paste0("video==", videoId[i]), ...)
    
    results <- dplyr::bind_rows(results, error_checking(temp, videoId[i], "video"))
  }
  
  return(results)
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
  
  results <- data.frame()
  for(i in 1:length(playlistId)) {
    temp <- analytics_request(dimensions = "country",
                              filters = paste0("playlist==", playlistId[i], ";isCurated==1"),
                              ...)
    
    results <- dplyr::bind_rows(results, error_checking(temp, playlistId[i], "playlist"))
  }
  
  return(results)
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
