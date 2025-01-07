SELECT
    toStartOfDay(bluesky_ts)::Date AS day, 
    count() AS count
FROM bluesky.bluesky
GROUP BY ALL
ORDER BY day ASC