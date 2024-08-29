
#' Analytics Request Function - YouTube Analytics API
#' 
#' @description
#' This is the function to make API calls to the YouTube Analytics API. Most other
#' functions in this package are wrappers for this function with some arguments already populated. 
#' If none of the other prebuilt functions work for your use case, this is the function to turn to.
#'
#' @param dimensions String. See \url{https://developers.google.com/youtube/analytics/dimensions}
#'                   for valid arguments.
#' @param metrics String. See \url{https://developers.google.com/youtube/analytics/metrics}
#'                for valid arguments.
#' @param sort String. Specify by which metric/dimensions to sort output if applicable.
#' @param maxResults Integer. Specify the number of results to return. Maximum is 200.
#' @param filters String. Specify dimension to filter on if applicable. Ex: video==dQw4w9WgXcQ
#' @param startDate Required. String specifying start date.
#' @param endDate Required. String specifying end date.
#' @param ids Required. Specify the channel. By default the function will specify \code{"channel==MINE"}
#' @param currency String. Specify currency if applicable
#' @param startIndex Integer. Specify index of first entity to retrieve, if applicable.
#' @param includeHistoricalChannelData String. Indicates whether the API response should include 
#'                                     channels' watch time and view data from the time period prior
#'                                     to when the channels were linked to the content owner. Only
#'                                     applies to content owner reports. Either 'true' or 'false'.
#' @param token Required.
#'
#' @return data.frame
#' @export
#'
#' @examples
#' \dontrun{
#' analytics_request(startDate = "2018-05-01", 
#'                   endDate = "2017-01-01", 
#'                   metrics = "views,comments,likes,dislikes,estimatedMinutesWatched")
#' }

analytics_request <- function(dimensions = NULL, 
                              metrics = "views,estimatedMinutesWatched", 
                              sort = NULL,
                              maxResults = 10, 
                              filters = NULL, 
                              startDate = "2000-01-01",
                              endDate = as.character(Sys.Date()), 
                              ids = "channel==MINE",
                              currency = NULL,
                              startIndex = NULL, 
                              includeHistoricalChannelData = NULL,
                              token = getOption("YouTube_Token")) {
  

  
  baseUrl <- "https://youtubeanalytics.googleapis.com/v2/reports?"
  params <- as.list(environment())
  
  params[["startDate"]] <- as.character(params[["startDate"]])
  params[["endDate"]] <- as.character(params[["endDate"]])
  
  if(is.null(params[["sort"]])) {
    params[["sort"]] <- paste0("-",sub("\\,.*","", metrics))
  }
  
  paramsList <- Filter(Negate(is.null), params[params != "token"])
  
  queryUrl <- paste0(baseUrl, paste0("&", names(paramsList), "=", unlist(paramsList), collapse = ""))
  
  temp <- youtube_GET(queryUrl, request = "analytics", token = token)
  return(temp)
}



#' Channel Data Requests - YouTube Data API
#' 
#' @description 
#' This is a function to make API calls to the YouTube Data API for channel specific data. 
#' While it can be called directly, it is primarily intended to help get lists of videos within
#' a channel. For more in-depth use of the Data API, please refer to \code{tuber}. For
#' more details on the following arguments, please refer to 
#' \url{https://developers.google.com/youtube/v3/docs/channels/list}
#'
#' @param part Required. String. 
#' @param categoryId String.
#' @param forUsername String. 
#' @param hl String. 
#' @param id String. 
#' @param managedByMe String.
#' @param maxResults Integer.
#' @param mine String.
#' @param onBehalfOfContentOwner String.
#' @param pageToken String.
#' @param token Required.
#'
#' @return data.frame
#' @export
#'
#' @examples
#' \dontrun{
#' data_channel_request(part = "contentDetails",
#'                      mine = "true")
#' }

data_channel_request <- function(part = NULL, categoryId = NULL, forUsername = NULL, hl = NULL,
                                 id = NULL, managedByMe = NULL, maxResults = 5, mine = NULL,
                                 onBehalfOfContentOwner = NULL, pageToken = NULL,
                                 token = getOption("YouTube_Token")) {
  
  baseUrl <- paste0("https://www.googleapis.com/youtube/v3/channels?part=", part)
  params <- as.list(environment())
  paramsList <- Filter(Negate(is.null), params[params != "token"])
  queryUrl <- paste0(baseUrl, paste0("&", names(paramsList), "=", unlist(paramsList), collapse = ""))
  
  temp <- youtube_GET(queryUrl, request = "data", token = token)
  return(temp)
}



#' Playlist Data Requests - YouTube Data API
#' 
#' @description
#' This is a function to make API calls to the YouTube Data API for playlist specific data.
#' While it can be called directly, it is primarily intended to help get lists of videos within
#' a playlist. For more in-depth use of the Data API, please refer to \code{tuber}. For
#' more details on the following arguments, please refer to
#' \url{https://developers.google.com/youtube/v3/docs/playlists/list}
#'
#' @param part Required. String.
#' @param channelId String.
#' @param hl String.
#' @param id String.
#' @param maxResults Integer. 
#' @param mine String
#' @param onBehalfOfContentOwner String.
#' @param onBehalfOfContentOwnerChannel String.
#' @param pageToken String.
#' @param token Required.
#'
#' @return data.frame
#' @export
#'
#' @examples
#' \dontrun{
#' data_playlist_request(part = "contentDetails",
#'                       id = "PLA2387dsgkhfs9832hjkhuihsASDF",
#'                       mine = "true")
#' }

data_playlist_request <- function(part = NULL, channelId = NULL, hl = NULL, id = NULL,
                                  maxResults = 5, mine = NULL, onBehalfOfContentOwner = NULL,
                                  onBehalfOfContentOwnerChannel = NULL, pageToken = NULL,
                                  token = getOption("YouTube_Token")) {
  
  baseUrl <- paste0("https://www.googleapis.com/youtube/v3/playlists?part=", part)
  params <- as.list(environment())
  paramsList <- Filter(Negate(is.null), params[params != "token"])
  queryUrl <- paste0(baseUrl, paste0("&", names(paramsList), "=", unlist(paramsList), collapse = ""))
  
  temp <- youtube_GET(queryUrl, request = "data", token = token)
  if(maxResults > 50) {
    
    df <- data.frame()
    df <- dplyr::bind_rows(df, temp$items)
    pageToken <- temp$nextPageToken
    
    while(!is.null(pageToken)) {
      
      loopUrl <- paste0(queryUrl, "&pageToken=",pageToken)
      temp <- youtube_GET(loopUrl, request = "data", token = token)
      df <- dplyr::bind_rows(df, temp$items)
      pageToken <- temp$nextPageToken
      
    }
    return(df)
  }
  return(temp)
}



#' Playlist Item Data Requests - YouTube Data API
#' 
#' @description
#' This is a function to make API calls to the YouTube Data API for playlist item data.
#' While it can be called directly, it is primarily intended to help get lists of videos within
#' a playlist. For more in-depth use of the Data API, please refer to \code{tuber}. For
#' more details on the following arguments, please refer to
#' \url{https://developers.google.com/youtube/v3/docs/playlistItems/list}
#'
#' @param part Required. String.
#' @param id String.
#' @param maxResults Integer. 
#' @param onBehalfOfContentOwner String. 
#' @param pageToken String.
#' @param playlistId String.
#' @param videoId String.
#' @param token Required.
#'
#' @return data.frame
#' @export
#'
#' @examples
#' \dontrun{
#' data_playlistItem_request(part = "contentDetails",
#'                           id = "PLA2387dsgkhfs9832hjkhuihsASDF",
#'                           mine = "true")
#' }

data_playlistItem_request <- function(part = NULL, id = NULL, maxResults = 5,
                                      onBehalfOfContentOwner = NULL, pageToken = NULL,
                                      playlistId = NULL, videoId = NULL,
                                      token = getOption("YouTube_Token")) {
  
  baseUrl <- paste0("https://www.googleapis.com/youtube/v3/playlistItems?part=", part)
  params <- as.list(environment())
  paramsList <- Filter(Negate(is.null), params[params != "token"])
  queryUrl <- paste0(baseUrl, paste0("&", names(paramsList), "=", unlist(paramsList), collapse = ""))
  
  temp <- youtube_GET(queryUrl, request = "data", token = token)
  
  if(maxResults > 50) {
    
    df <- data.frame()
    df <- dplyr::bind_rows(df, temp$items$contentDetails)
    pageToken <- temp$nextPageToken
    
    while(!is.null(pageToken)) {
      
      loopUrl <- paste0(queryUrl, "&pageToken=",pageToken)
      temp <- youtube_GET(loopUrl, request = "data", token = token)
      df <- dplyr::bind_rows(df, temp$items$contentDetails)
      pageToken <- temp$nextPageToken
    }
    return(df)
  }
  return(temp)
}



#' Video Data Requests - YouTube Data API
#' 
#' @description
#' This is a function to make API calls to the YouTube Data API for video data.
#' While it can be called directly, it is primarily inteded to help get metadata about videos
#' such as title or description. For more in-depth use of the Data API, please refer to
#' \code{tuber}. For more details on the following arguments, please refer to
#' \url{https://developers.google.com/youtube/v3/docs/videos/list}
#'
#' @param part Required. String
#' @param chart String.
#' @param hl String.
#' @param id String.
#' @param locale String.
#' @param maxHeight Integer.
#' @param maxResults Integer.
#' @param maxWidth Integer.
#' @param myRating String.
#' @param onBehalfOfContentOwner String. 
#' @param pageToken String.
#' @param regionCode String.
#' @param videoCategoryId String.
#' @param token Required.
#'
#' @return data.frame()
#' @export
#'
#' @examples
#' \dontrun{
#' data_video_request(part = "contentDetails",
#'                           id = "dQw4w9WgXcQ")
#' }

data_video_request <- function(part = NULL, chart = NULL, hl = NULL, id = NULL, locale = NULL,
                               maxHeight = NULL, maxResults = NULL, maxWidth = NULL,
                               myRating = NULL, onBehalfOfContentOwner = NULL, pageToken = NULL,
                               regionCode = NULL, videoCategoryId = NULL,
                               token = getOption("YouTube_Token")) {
  
  baseUrl <- paste0("https://www.googleapis.com/youtube/v3/videos?part=", part)
  params <- as.list(environment())
  paramsList <- Filter(Negate(is.null), params[params != "token"])
  queryUrl <- paste0(baseUrl, paste0("&", names(paramsList), "=", unlist(paramsList), collapse = ""))
  
  temp <- youtube_GET(queryUrl, request = "data", token = token)
  
  return(temp)
}


# helpers ---------------------------------------------------------------------



youtube_GET <- function(url = NULL, request = NULL, token){
  
  if(is.null(url) | is.null(request)) stop("url and request required.")
  
  r <- httr::GET(url, token)
  temp <- jsonlite::fromJSON(httr::content(r, as = "text"))
  
  if(httr::status_code(r) != 200) stop(temp$error$errors)
  
  if (request == "analytics") {
    
    if (length(temp$rows)) {
      
      df <- as.data.frame(temp$rows)
      colnames(df) <- temp$columnHeaders$name
      
      dataTypes <- temp$columnHeaders$dataType
      
      for(i in 1:nrow(temp$columnHeaders)) {
        if(dataTypes[i] %in% c("INTEGER", "DOUBLE", "FLOAT")) {
          df[,i] <- as.numeric(df[,i])
        }
      }
      return(df)
      
    }
    
  } else if (request == "data") {
    
    if (length(temp$items)) return(temp)
  }
}


time_period_check <- function(period) {
  if(!(period %in% c("day", "month"))) stop("Period must be either 'day' or 'month'")
}


error_checking <- function(ytResults, id, contentType) {
  
  if(!is.null(ytResults)) {
    if(nrow(ytResults) > 0) {
      if(contentType == "video"){
        ytResults$videoId <- id
      } else if(contentType == "playlist") {
        ytResults$playlistId <- id
      }
    } else {
      warning(sprintf("No results returned for %s", id))
      ytResults <- data.frame()
    }
  } else {
    warning(sprintf("No results returned for %s", id))
    ytResults <- data.frame()
  }
  return(ytResults)
}


prog_bar <- function(iter) {
  progress::progress_bar$new(
    format = "[:bar] :percent [Elapsed time: :elapsedfull || ETA: :eta]",
    total = iter,
    complete = "=",
    incomplete = "-",
    current = ">",
    clear = FALSE
  )
}

