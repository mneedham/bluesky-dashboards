---
title: BlueSky Dashboard
---

Bluesky is a decentralized social media platform initiated by Twitter co-founder Jack Dorsey. It operates on a protocol called the Authenticated Transfer Protocol (ATP), aiming to give users more control over their data and online identity while promoting interoperability between different social networks.

## Total messages

How many messages have been generated so far?

```sql total_messages
SELECT *
FROM ClickHouse.total_messages
```

<BigValue 
  data={total_messages} 
  value=messages
  fmt=num0m
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
    series=event
>

</BarChart>


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



## Most liked posts

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

