

#' Video Time Period Views
#' 
#' @description
#' Returns video views by day or month.
#' 
#' @param videoId Required. String. Id of YouTube video.
#' @param period Required. Time period to breakdown data by. Supported values are 
#' \code{day} and \code{month}
#' @param endDate Required. String. Data returned up until the last day specified, 
#' so for monthly period the end date must end with a day of `01`
#' @param ... Addt. arguments passed to \code{analytics_request}
#'
#' @return data.frame
#' @export
#'
#' @examples
#' \dontrun{
#' video_time_period(videoId = "dQw4w9WgXcQ", period = "month")
#' } 

video_time_period <- function(videoId = NULL, period = "day", 
                              endDate = as.character(format(Sys.Date(), "%Y-%m-01")), ...) {
  
  time_period_check(period)
  
  results <- data.frame()
  pb <- prog_bar(length(videoId))
  for(i in 1:length(videoId)) {
    pb$tick()
    temp <- analytics_request(dimensions = period, endDate = endDate,
                              filters = paste0("video==", videoId[i]), 
                              sort = period, ...)
    
    results <- dplyr::bind_rows(results, error_checking(temp, videoId[i], "video"))
  }
  
  return(results)
}



#' Channel Time Period Views
#' 
#' @description
#' Returns channel views by day or month.
#'
#' @param period Required. Time period to breakdown data by. Supported values are 
#' \code{day} and \code{month}
#' @param endDate Required. String. Data returned up until the last day specified, 
#' so for monthly period the end date must end with a day of `01`
#' @param ... Addt. arguments passed to \code{analytics_request}
#'
#' @return data.frame
#' @export
#'
#' @examples
#' \dontrun{
#' channel_time_period()
#' }

channel_time_period <- function(period = "day", 
                                endDate = as.character(format(Sys.Date(), "%Y-%m-01")), ...) {
  
  time_period_check(period)
  temp <- analytics_request(dimensions = period, endDate = endDate,
                            sort = period, ...)
  return(temp)
}
