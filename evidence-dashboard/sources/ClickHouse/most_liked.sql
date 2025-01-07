SELECT
    handle,
    sum(likes) AS totalLikes
FROM bluesky.likes_per_user AS lpu
INNER JOIN bluesky.handle_per_user AS hpu ON hpu.did = lpu.did
GROUP BY ALL
ORDER BY totalLikes DESC
LIMIT 100;