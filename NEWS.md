

# YTAnalytics 0.0.5 2023-08-28
* Fixed issues where some functions were passing multiple `metric` parameters to `analytics_request`, which threw and error in `get_stats` functions and `traffic` functions
* Fixed issue with `channel_videos` where incorrect `uploads` playlistId was passed.
* Fixed issue with `metadata` functions where it attempted to filter to columns that didn't exist.
* Fixed issue with `youtube_oauth` where creating a token from scratch threw errors.


# YTAnalytics 0.0.4
* Initial release of YTAnalytics
