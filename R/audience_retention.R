

#' Video Audience Retention
#' 
#' @description
#' Returns audience retention percentages for a video. By default this function will 
#' return audience retention rates for organic views.
#' 
#' @param videoId Required. String. Id of YouTube video.
#' @param audienceType Required. String. Supported values are \code{ORGANIC},
#' \code{AD_INSTREAM}, and \code{AD_INDISPLAY}
#' @param ... Addt. arguments passed to \code{analytics_request}
#'
#' @return data.frame
#' @export
#'
#' @examples
#' \dontrun{
#' video_audience_retention(videoId = "dQw4w9WgXcQ")
#' } 

video_audience_retention <- function(videoId = NULL, audienceType = "ORGANIC", ...) {
  
  if(!(audienceType %in% c("ORGANIC", "AD_INSTREAM", "AD_INDISPLAY"))) {
    stop("Audience Type must be one of the following: ORGANIC, AD_INSTREAM, AD_INDISPLAY")
  }
  
  temp <- analytics_request(dimensions = "elapsedVideoTimeRatio",
                            metrics = "audienceWatchRatio",
                            maxResults = NULL,
                            sort="elapsedVideoTimeRatio",
                            filters = paste0("video==", videoId,
                                             ";audienceType==", audienceType), ...)
  return(temp)
}