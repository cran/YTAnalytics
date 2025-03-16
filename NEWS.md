# YTAnalytics 0.2.1 2025-03-15
* Fixed bug in `analytics_request` where function attempts to remove token by element rather than element name.

# YTAnalytics 0.2.0 2024-08-29
* Added error checking functionality when reading in a token file. Previously a token file would be read in and print a message saying that the token was successfully read, but if the token was expired the user wouldn't know until making a request.
* Added a progress bar to help track progress when passing vectors of video/playlist ids
* Added the `playlist_metadata` function.
* Fixed misc bugs like incorrect parameters being passed to functions or passing parameters that didn't exist
* Added github pages website (davisj95.github.io/YTAnalytics)
* Removed documentation for internal functions that aren't meant to be called directly


# YTAnalytics 0.1.0 2023-09-13
* Allows a vector of video ids or playlist ids to  be passed to `video` and `playlist functions`.
* Fixed an issue with dates where dates not passed as characters threw errors. Date objects and strings are both acceptable now.
* Fixed issues with most `playlist` functions that had `;isCurated==1` missing from its filters.
* Removed `playlist_cities` as playlist city information is not made available through the API.
* Fixed typo with `playback_location` file name
* Changed `error_checking` message to warning


# YTAnalytics 0.0.5 2023-08-28
* Fixed issues where some functions were passing multiple `metric` parameters to `analytics_request`, which threw an error in `get_stats` functions and `traffic` functions.
* Fixed issue with `channel_videos` where incorrect `uploads` playlistId was passed.
* Fixed issue with `metadata` functions where it attempted to filter to columns that didn't exist.
* Fixed issue with `youtube_oauth` where creating a token from scratch threw errors.


# YTAnalytics 0.0.4
* Initial release of YTAnalytics.
