% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/devices.R
\name{playlist_devices}
\alias{playlist_devices}
\title{Playlist Device Data}
\usage{
playlist_devices(playlistId = NULL, ...)
}
\arguments{
\item{playlistId}{Required. String. Id of YouTube playlist.}

\item{...}{Addt. arguments passed to \code{analytics_request}}
}
\value{
data.frame
}
\description{
Returns top devices by views
}
\examples{
\dontrun{
playlist_devices(playlistId = "PL2MI040U_GXq1L5JUxNOulWCyXn-7QyZK")
} 
}
