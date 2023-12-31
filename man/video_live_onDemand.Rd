% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/live_onDemand.R
\name{video_live_onDemand}
\alias{video_live_onDemand}
\title{Video Live & OnDemand Data}
\usage{
video_live_onDemand(videoId = NULL, ...)
}
\arguments{
\item{videoId}{Required.String. Id of YouTube video.}

\item{...}{Addt. arguments passed to \code{analytics_request}}
}
\value{
data.frame
}
\description{
Return video data split by live & on demand.
}
\examples{
\dontrun{
video_live_onDemand(videoId = "dQw4w9WgXcQ")
}
}
