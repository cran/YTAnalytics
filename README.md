# YTAnalytics: R Wrapper for YouTube Analytics API

<!-- badges: start -->

[![CRANstatus](https://www.r-pkg.org/badges/version/YTAnalytics)](https://CRAN.R-project.org/package=YTAnalytics) [![All-TimeDownloads](https://cranlogs.r-pkg.org/badges/grand-total/YTAnalytics)](https://cran.r-project.org/package=YTAnalytics) [![Lifecycle:stable](https://img.shields.io/badge/lifecycle-stable-brightgreen.svg)](https://lifecycle.r-lib.org/articles/stages.html#stable)

<!-- badges: end -->

## Overview

YTAnalytics is an R package designed to simplify data collection using the YouTube Analytics API. You can use this to get channel, playlist, and video data for your YouTube channel - just like what is found in YouTube Studio. Helpful data includes:

-   Video/Playlist/Channel Statistics
-   Daily/Monthly Views
-   Location Data (Country/City)
-   Demographics (Age/Gender)
-   Devices
-   Traffic Sources
-   Sharing Services

## Details

`YTAnalytics` is built around one main function - `analytics_request()` which acts as the wrapper for the YouTube Analytics API. `youtube_GET` simplifies making `GET` requests using `httr::GET` and structuring the returned data in a data.frame.

`data_channel_request()`, `data_playlist_request()`, `data_playlistItem_request()`, and `data_video_request()` are wrappers for the YouTube Data API, meant only to help in getting some high level data or returning lists of videos in a channel or playlist. For this purpose, added functionality is not present. For more YouTube Data API functionality, refer [here](https://github.com/gojiplus/tuber) for the `tuber` package. To learn more about the YouTube Analytics API or to experiment with their built-in app, [check them out here](https://developers.google.com/youtube/analytics/data_model).

## Installation

The most up-do-date version can be found on Github:

``` r
# install.packages("devtools")
devtools::install_github("davisj95/YTAnalytics")
```

## Authentication

In order to use the YouTube APIs, you need do the following:

1.  Create a Project in your [Google Developers Console](https://console.cloud.google.com/welcome).
2.  Enable the YouTube Data and YouTube Analytics APIs in the developer library.
3.  Create an OAuth consent screen.
4.  Create OAuth authorization credentials.

Once you have your client Id and Secret, use them in `youtube_oauth()` like the following:

``` r
youtube_oauth(clientId = YOURAPPID, clientSecret = YOURAPPSECRET)
```

An authentication token is created (by default stored in a file called `.httr-oauth`) and saved in your working directory.

## How To Use

Once authenticated, there are many functions to choose from. Functions mostly fall into three categories: `channel`, `playlist`, and `video` data. Each function leads with the category name followed by the particular function. For example:

### Channel

``` r
# To get views, averageViewDuration, estimatedMinutesWatched, shares, likes, 
# dislikes, comments, subscribersGained & subscribersLost
# From Jan 1, 2000 - Today
channel_stats()

# For Jan 1, 2020 - Jan 1, 2021
channel_stats(startDate = "2020-01-01", endDate = "2021-01-01")

# To get only views, averageViewDuration and estimatedMinutesWatched for all time
channel_stats(metrics = "views,averageViewDuration,estimatedMinutesWatched").  #Note that there are no spaces between metrics
```

### Playlist

``` r
myPlaylist <- YOURPLAYLISTID

playlist_daily_views(playlistId = myPlaylist)

playlist_live_onDemand(playlistId = myPlaylist)
```

### Video

``` r
myVideo <- YOURVIDEOID

video_audience_retention(videoId = myVideo)

video_top_countries(videoId = myVideo)
```

If none of these pre-built functions do quite what you need, you can always refer back to the `analytics_request()` function for more custom requests.

``` r
analytics_request(dimensions = "country",
                  metrics = "views",
                  filter = "video==YOURVIDEO",
                  sort = "-views",
                  maxResults = 50)
```

## All Functions Currently Available

-   Authentication
    -   `youtube_oauth()`
-   Get Daily/Monthly Views
    -   `channel_time_period()`
    -   `playlist_time_period()`
    -   `video_time_period()`
-   Get Live vs. On Demand Views
    -   `channel_live_onDemand()`
    -   `playlist_live_onDemand()`
    -   `video_live_onDemand()`
-   Get Playback Location
    -   `channel_playback_location()`
    -   `playlist_playback_location()`
    -   `video_playback_location()`
-   Get Overall Stats
    -   `channel_stats()`
    -   `playlist_stats()`
    -   `video_stats()`
-   Get Countries
    -   `channel_countries()`
    -   `playlist_countries()`
    -   `video_countries()`
-   Get Cities
    -   `channel_cities()`
    -   `playlist_cities()`
    -   `video_cities()`
-   Get Demographics (Age & Gender)
    -   `channel_demographics()`
    -   `playlist_demographics()`
    -   `video_demographics()`
-   Get Devices
    -   `channel_devices()`
    -   `playlist_devices()`
    -   `video_devices()`
-   Get Traffic Sources
    -   `channel_traffic_sources()`
    -   `playlist_traffic_sources()`
    -   `video_traffic_sources()`
-   Get Traffic Details
    -   `channel_traffic_details()`
    -   `playlist_traffic_details()`
    -   `video_traffic_details()`
-   Get Top Sharing Services
    -   `channel_top_sharing_services()`
    -   `playlist_top_sharing_services()`
    -   `video_top_sharing_services()`
-   Get Subscription Status
    -   `channel_subscription_status()`
    -   `playlist_subscription_status()`
    -   `video_subscription_status()`
-   Get Top Videos
    -   `channel_top_videos()`
    -   `playlist_top_videos()`
-   Get List of Videos
    -   `channel_videos()`
    -   `playlist_videos()`
-   Get Audience Retention Ratios
    -   `video_audience_retention()`
-   Get Metadata (Title, Description, etc)
    -   `playlist_metadata()`
    -   `video_metadata()`
-   Wrapper for Analytics/Data APIS
    -   `analytics_request()`
    -   `data_channel_request()`
    -   `data_playlist_request()`
    -   `data_playlistItem_request()`
    -   `data_video_request()`
