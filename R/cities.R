

#' Video City Data
#' 
#' @description
#' Returns top cities by views. Data is only available after January 1, 2022.
#' 
#' @param videoId Required. String. Id of YouTube video.
#' @param ... Addt. arguments passed to \code{analytics_request}
#'
#' @return data.frame
#' @export
#'
#' @examples
#' \dontrun{
#' video_cities(videoId = "dQw4w9WgXcQ")
#' } 

video_cities <- function(videoId = NULL, ...) {
  
  results <- data.frame()
  pb <- prog_bar(length(videoId))
  for(i in 1:length(videoId)) {
    pb$tick()
    temp <- analytics_request(dimensions = "city",
                              filters = paste0("video==", videoId[i]), ...)
    
    results <- dplyr::bind_rows(results, error_checking(temp, videoId[i], "video"))
  }
  
  return(results)
}



#' Channel City Data
#' 
#' @description
#' Returns top cities by views. Data is only available after January 1, 2022.
#'
#' @param ... Addt. arguments passed to \code{analytics_request}
#'
#' @return data.frame
#' @export
#'
#' @examples
#' \dontrun{
#' channel_cities()
#' }

channel_cities <- function(...) {
  temp <- analytics_request(dimensions = "city", ...)
  return(temp)
}
