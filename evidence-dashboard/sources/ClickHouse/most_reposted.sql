SELECT
    handle,
    sum(reposts) AS totalReposts
FROM bluesky.reposts_per_user AS lpu
INNER JOIN bluesky.handle_per_user AS hpu ON hpu.did = lpu.did
GROUP BY ALL
ORDER BY totalReposts DESC
LIMIT 100