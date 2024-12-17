SELECT
    handle,
    sum(likes) AS totalLikes
FROM bluesky.likes_per_post AS lpp
INNER JOIN bluesky.cid_to_text AS ctt ON ctt.cid = lpp.cid
INNER JOIN bluesky.did_to_handle_and_displayname AS dthad ON dthad.did = ctt.did
GROUP BY ALL
ORDER BY totalLikes DESC
LIMIT 100;