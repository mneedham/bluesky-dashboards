SELECT event, hour_of_day, sum(count) as count
FROM bluesky.events_per_hour_of_day
WHERE event in ['post', 'repost', 'like']
GROUP BY event, hour_of_day
ORDER BY hour_of_day;