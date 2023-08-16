

#' Channel Playlists
#' 
#' @description
#' Returns all playlists in channel. 
#'
#' @param ... Addt. arguments passed to \code{data_playlist_request}
#'
#' @return data.frame
#' @export
#'
#' @examples
#' \dontrun{
#' channel_playlists()
#' }

channel_playlists <- function(...) {
  temp <- data_playlist_request(part = "contentDetails", 
                                mine = "true", 
                                maxResults = 51, ...)
  return(temp)
}
