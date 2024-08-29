

#' Video Demographic Data
#' 
#' @description
#' Returns age and gender demographics
#' 
#' @param videoId Required. String. Id of YouTube video.
#' @param ... Addt. arguments passed to \code{analytics_request}
#'
#' @return data.frame
#' @export
#'
#' @examples
#' \dontrun{
#' video_demographics(videoId = "dQw4w9WgXcQ")
#' } 

video_demographics <- function(videoId = NULL, ...) {
  
  results <- data.frame()
  pb <- prog_bar(length(videoId))
  for(i in 1:length(videoId)) {
    pb$tick()
    temp <- analytics_request(dimensions = "ageGroup,gender",
                              metrics = "viewerPercentage",
                              sort = "gender,ageGroup",
                              maxResults = 25,
                              filters = paste0("video==", videoId[i]), ...)
    
    results <- dplyr::bind_rows(results, error_checking(temp, videoId[i], "video"))
  }
  
  return(results)
}


#' Playlist Demographic Data
#' 
#' @description
#' Returns age and gender demographics
#'
#' @param playlistId Required. String. Id of YouTube playlist.
#' @param ... Addt. arguments passed to \code{analytics_request}
#'
#' @return data.frame
#' @export
#'
#' @examples
#' \dontrun{
#' playlist_demographics(playlistId = "PL2MI040U_GXq1L5JUxNOulWCyXn-7QyZK")
#' } 

playlist_demographics <- function(playlistId = NULL, ...) {
  
  results <- data.frame()
  pb <- prog_bar(length(playlistId))
  for(i in 1:length(playlistId)) {
    pb$tick()
    temp <- analytics_request(dimensions = "ageGroup,gender",
                              metrics = "viewerPercentage",
                              sort = "gender,ageGroup",
                              maxResults = 25,
                              filters = paste0("playlist==", playlistId[i], ";isCurated==1"), ...)
   
    results <- dplyr::bind_rows(results, error_checking(temp, playlistId[i], "playlist"))
  }

  return(results)
}


#' Channel Demographic Data
#' 
#' @description
#' Returns age and gender demographics
#'
#' @param ... Addt. arguments passed to \code{analytics_request}
#'
#' @return data.frame
#' @export
#'
#' @examples
#' \dontrun{
#' channel_demographics()
#' }

channel_demographics <- function(...) {
  temp <- analytics_request(dimensions = "ageGroup,gender",
                            metrics = "viewerPercentage",
                            sort = "gender,ageGroup",
                            maxResults = 25, ...)
  return(temp)
}
