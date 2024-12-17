SELECT collection,
       sum(posts) AS posts,
       uniqMerge(users) AS users
FROM bluesky.top_post_types
GROUP BY collection
ORDER BY posts DESC;