

#' Video Sharing Services Data
#' 
#' @description
#' Returns top sharing services by views 
#' 
#' @param videoId Required. String. Id of YouTube video.
#' @param ... Addt. arguments passed to \code{analytics_request}
#'
#' @return data.frame
#' @export
#'
#' @examples
#' \dontrun{
#' video_sharing_services(videoId = "dQw4w9WgXcQ")
#' } 

video_sharing_services <- function(videoId = NULL, ...) {
  temp <- analytics_request(dimensions = "sharingService",
                            metrics = "shares",
                            filters = paste0("video==", videoId), ...)
  return(temp)
}



#' Channel Sharing Services Data
#' 
#' @description
#' Returns top sharing services by views
#'
#' @param ... Addt. arguments passed to \code{analytics_request}
#'
#' @return data.frame
#' @export
#'
#' @examples
#' \dontrun{
#' channel_sharing_services()
#' }

channel_sharing_services <- function(...) {
  temp <- analytics_request(dimensions = "sharingService",
                            metrics = "shares", ...)
  return(temp)
}
