% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/demographics.R
\name{video_demographics}
\alias{video_demographics}
\title{Video Demographic Data}
\usage{
video_demographics(videoId = NULL, ...)
}
\arguments{
\item{videoId}{Required. String. Id of YouTube video.}

\item{...}{Addt. arguments passed to \code{analytics_request}}
}
\value{
data.frame
}
\description{
Returns age and gender demographics
}
\examples{
\dontrun{
video_demographics(videoId = "dQw4w9WgXcQ")
} 
}
