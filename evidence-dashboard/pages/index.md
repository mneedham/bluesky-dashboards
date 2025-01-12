---
title: BlueSky Dashboard
---

<LastRefreshed prefix="Data last updated"/>

## What is BlueSky?

Bluesky is a decentralized social media platform initiated by Twitter co-founder Jack Dorsey. 
It operates on a protocol called the Authenticated Transfer Protocol (ATP), aiming to give users more control over their data and online identity while promoting interoperability between different social networks.

We've loaded the data from [jetstream](https://github.com/bluesky-social/jetstream) into ClickHouse and then queried it to create this dashboard.

## How much are people using it?

How many messages have been generated so far?

```sql total_messages
SELECT *
FROM ClickHouse.total_messages
```

```sql messages_last_day
SELECT *
FROM ClickHouse.messages_last_day
```

<BigValue 
  title="Total events"
  data={total_messages} 
  value=messages
  fmt=num0m
/>

<BigValue 
  title="Events in the last 24 hours"
  data={messages_last_day} 
  value=last24Hours
  fmt=num0m
  comparison=percentChange
  comparisonFmt=pct1
  comparisonTitle="24 hour change"
/>


## When do people use BlueSky?

What's the most popular time for people to like, post, and re-post?

```sql time_of_day
SELECT *
FROM ClickHouse.time_of_day
```

<BarChart 
    data={time_of_day}
    x=hour_of_day
    y=count
    yFmt=num0m
    series=event
/>

```sql events_by_day
SELECT day, count
FROM ClickHouse.events_by_day
```

<BarChart 
    data={events_by_day}
    x=day
    yFmt=num0m
    y=count
    sort=false
/>



## Post types

BlueSky has lots of different post types. These are the most popular ones:

```sql post_types
SELECT *
FROM ClickHouse.top_post_types
LIMIT 10
```

<DataTable 
  data={post_types} 
  fmt=num0m  
>
  <Column id=collection/>
  <Column id=posts fmt=num0/>
  <Column id=users fmt=num0/>
</DataTable>

### By count

<BarChart 
    data={post_types}
    x=collection
    y=posts 
    swapXY=true
    yFmt=num0    
    sort=false
    fillColor=blue
/>

### By user count

<BarChart 
    data={post_types}
    x=collection
    y=users
    swapXY=true
    yFmt=num0    
    sort=false
    fillColor=red
/>

## Most liked

Who has the most liked posts?

```sql most_liked_posts
SELECT *
FROM ClickHouse.most_liked;
```

<DataTable 
  data={most_liked_posts} 
  fmt=num0m  
>
  <Column id=handle/>
  <Column id=totalLikes fmt=num0 />
</DataTable>

## Most reposted

Who has the most re-posts?

```sql most_reposted
SELECT *
FROM ClickHouse.most_reposted;
```

<DataTable 
  data={most_reposted} 
  fmt=num0m  
>
  <Column id=handle/>
  <Column id=totalReposts fmt=num0 />
</DataTable>


## Posts per language

What language do people use?

```sql posts_per_language
SELECT *
FROM ClickHouse.posts_per_language
LIMIT 20
```


<ECharts config={
    {
        tooltip: {
            formatter: '{b}: {c} ({d}%)'
        },
        series: [
        {
          type: 'pie',
          data: [...posts_per_language],
        }
      ]
      }
    }
/>