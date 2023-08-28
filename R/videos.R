

#' Playlist Videos List
#' 
#' @description
#' Returns all videos in playlist
#'
#' @param playlistId Required. String. Id of YouTube playlist.
#' @param ... Addt. arguments passed to \code{analytics_request}
#'
#' @return data.frame
#' @export
#'
#' @examples
#' \dontrun{
#' playlist_videos(playlistId = "PL2MI040U_GXq1L5JUxNOulWCyXn-7QyZK")
#' } 

playlist_videos <- function(playlistId = NULL, ...) {
  temp <- data_playlistItem_request(part = "contentDetails", 
                                    playlistId = playlistId, 
                                    maxResults = 51, ...)
  return(temp)
}




#' Channel Playlist List
#'
#' @param ... Addt. arguments passed to \code{data_playlist_request}
#'
#' @return data.frame
#' @export
#'
#' @examples
#' \dontrun{
#' playlist_videos(playlistId = "PL2MI040U_GXq1L5JUxNOulWCyXn-7QyZK")
#' } 

channel_playlists <- function(...) {
  temp <- data_playlist_request(part = "contentDetails", mine = "true", maxResults = 51, ...)
  result <- temp
  return(result)
}





#' Channel Videos List
#' 
#' @description
#' Returns all videos in channel. Note: As of July 2023, the YouTube Data API 
#' fails to return ALL videos on a channel by getting all videos from the "uploads" playlist
#' for large YouTube channels. As a result this function's work-around is to pull
#' all additional playlists from the channel, pull all video lists from all playlists,
#' and append the result to the uploads return.
#'
#' @param token YouTube token
#'
#' @return data.frame
#' @export
#'
#' @examples
#' \dontrun{
#' channel_videos()
#' }

channel_videos <- function(token = getOption("YouTube_Token")) {
  
  channelData <- data_channel_request(part = "contentDetails", mine="true", token = token)
  uploads <- channelData$items$contentDetails$relatedPlaylists$uploads
  
  channelPlaylists <- channel_playlists(token = token)
  
  allPlaylists <- unique(c(uploads, channelPlaylists$id))
  allVideos <- data.frame()
  
  for(i in allPlaylists) {
    temp <- data_playlistItem_request(part = "contentDetails",
                                      playlistId = i, maxResults = 51, token = token)
    allVideos <- dplyr::bind_rows(allVideos, temp)
    
  }
  
  return(dplyr::distinct(allVideos))
}
