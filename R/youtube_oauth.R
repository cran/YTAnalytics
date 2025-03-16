
#' YouTube API OAuth
#'
#' This creates or grabs a token to authorize API requests
#'
#' @param clientId Required. Client Id obtained from console.cloud.google.com.
#' @param clientSecret Required. Client Secret obtained from console.cloud.google.com
#' @param tokenFile The name of the token httr-oauth file to read the token from. If the file does not exist then one will be created with the provided name.
#' @param useOOB If \code{TRUE}, use oob method to copy/paste token into R.
#' @param setEnvVar If \code{TRUE}, create an environment variable called "YouTube_Token" to store token.
#' @param scopes Scopes that must be passed when authenticating. 
#'               See \url{https://developers.google.com/youtube/analytics/reference} for more information.
#' @param reAuthOnFail If \code{TRUE}, will automatically begin authentication process 
#'                     if provided token is expired.
#'
#' @return token environment
#' @export
#'
#' @examples
#' \dontrun{
#' youtube_oauth("123456789asdalksdjfhaslkdjfb.apps.googleusercontent.com",
#'               "MasdfH5320208ladshf790",
#'               token = ".httr-oauth-myToken")
#' }

youtube_oauth <- function(clientId = NULL, 
                           clientSecret = NULL, 
                           tokenFile = ".httr-oauth",
                           useOOB = FALSE, 
                           setEnvVar = FALSE, 
                           scopes = c("https://www.googleapis.com/auth/youtube.readonly",
                                      "https://www.googleapis.com/auth/yt-analytics.readonly"),
                           reAuthOnFail = FALSE) {
  
  
  if (file.exists(tokenFile)) {
    
    tryCatch( {
      tempToken <- suppressWarnings(readRDS(tokenFile))[[1]]
      suppressWarnings(suppressMessages(channel_stats(token = tempToken)))
      message("Token successfully authenticated")
      
    } , error = function(e) {
      
      if (reAuthOnFail == TRUE) {
        
        tryCatch( {
          tempToken <- get_token(clientId, clientSecret, tokenFile, useOOB, scopes)
          suppressWarnings(suppressMessages(channel_stats(token = tempToken)))
          message("Token successfully authenticated")
        }, error = function(f) {
          token_error_handling(f$message, reAuthOnFail, tokenFile)
        })
      } else {
        token_error_handling(e$message, reAuthOnFail, tokenFile)
      }
      
    }
    )
  } else {
    tryCatch( {
      tempToken <- get_token(clientId, clientSecret, tokenFile, useOOB, scopes)
      suppressWarnings(suppressMessages(channel_stats(token = tempToken)))
      message("Token successfully authenticated")
    }, error = function(e) {
      token_error_handling(e$message, reAuthOnFail, tokenFile)
    })
  }
  
  YouTubeToken <- tempToken
  
  if (setEnvVar == TRUE) options(YouTube_Token = YouTubeToken)
  
  return(YouTubeToken)
}


# helpers ---------------------------------------------------------------------

get_token <- function(clientId, clientSecret, tokenFile, useOOB, scopes) {
  
  if (is.null(clientId) | is.null(clientSecret)) {
    stop("Missing App Credentials")
  }
  
  httr::oauth2.0_token(httr::oauth_endpoints("google"),
                       httr::oauth_app("google", clientId, clientSecret),
                       scope = scopes,
                       cache = tokenFile,
                       use_oob = useOOB)
}


token_error_handling <- function(error, reAuthOnFail, tokenFile) {
  if (error == "Invalid CredentialsglobalauthErrorAuthorizationheader") {
    message("Your token has expired or been revoked.")
    unlink(tokenFile)
  } else if(error == "Missing App Credentials") {
    message("Missing App Credentials")
  } else {
    message("Something went wrong. Please try authenticating again.")
  }
  if (reAuthOnFail == FALSE) message("Set `reAuthOnFail` to TRUE to reauthenticate.")
}


