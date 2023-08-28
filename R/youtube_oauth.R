#' YouTube API OAuth
#'
#' This creates or grabs a token to authorize API requests
#'
#' @param clientId Required. Client Id obtained from console.cloud.google.com.
#' @param clientSecret Required. Client Secret obtained from console.cloud.google.com
#' @param tokenFile The name of the token httr-oauth file to read the token from. If the file does not exist then one will be created with the provided name.
#' @param useOOB If \code{TRUE}, use oob method to copy/paste token into R.
#' @param setEnvVar If \code{TRUE}, create an environment variable called "YouTube_Token" to store token.
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

youtube_oauth <- function(clientId = NULL, clientSecret = NULL, tokenFile = ".httr-oauth",
                          useOOB = FALSE, setEnvVar = FALSE) {
  
  YouTubeToken <- NULL
  
  # Attempt to Read in File
  if (!is.null(tokenFile) & file.exists(tokenFile)) {
    YouTubeToken <- tryCatch(
      suppressWarnings(readRDS(tokenFile))[[1]],
      error = function(e) {
        warning(sprintf("Unable to read token from: %s", tokenFile))
        NULL
      },
      finally = {
        message(sprintf("%s successfully read", tokenFile))
      }
    )
  } else if (!file.exists(tokenFile) | (file.exists(tokenFile) & is.null(YouTubeToken))) {
    if (is.null(clientId) | is.null(clientSecret)) {
      stop("Missing App Credentials")
    } else {
      YouTubeToken <- httr::oauth2.0_token(httr::oauth_endpoints("google"),
                                           httr::oauth_app("google", clientId, clientSecret),
                                           scope = c("https://www.googleapis.com/auth/youtube.readonly",
                                                     "https://www.googleapis.com/auth/yt-analytics.readonly",
                                                     "https://www.googleapis.com/auth/youtubepartner"),
                                           cache = tokenFile,
                                           use_oob = useOOB)
    }
  }
  
  if(setEnvVar) {
    tokenOption <- list(YouTubeToken)
    names(tokenOption) <- "YouTube_Token"
    options(tokenOption)
  }
  
  return(YouTubeToken)
}