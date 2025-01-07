SELECT
    countIf(bluesky_ts > (now() - ((24 * 60) * 60))) AS last24Hours,
    countIf((bluesky_ts <= (now() - ((24 * 60) * 60))) AND (bluesky_ts > (now() - ((48 * 60) * 60)))) AS previous24Hours,
    (last24Hours - previous24Hours)/previous24Hours AS percentChange
FROM bluesky.bluesky