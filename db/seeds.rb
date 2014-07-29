feed = Feed.create(
  name: "Engadget",
  url: "http://www.engadget.com",
  feedly_feed_id: "feed/http://feeds.engadget.com/weblogsinc/engadget",
  num_subscribers: 427,
  description: "lorum impsum",
  topics: "sex, drugs, rocknroll"
)

feed2 = Feed.create(
name: "VisualNews",
  url: "http://www.visualnews.com/",
  feedly_feed_id: "feed/http://feeds.feedburner.com/thevisualnews",
  num_subscribers: 427,
  description: "lorum impsum",
  topics: "art, design, people"
  )

user = User.create(
  email: "ruhroh@gmail.com",
  password: "12345678")

user.feeds << feed
user.feeds << feed2

50.times do
  Article.create(
  canonical_url: Faker::Internet.url,
  site_url: "http://google.com",
  visual_url: "http://www.mostbeautifulthings.net/wp-content/uploads/2014/04/sweet-cats-15.jpg",
  visual_height: 1366,
  visual_width: 750,
  author: Faker::Name.name,
  title: Faker::Lorem.sentence,
  keywords: "cats, gaga, xxx",
  summary: Faker::Lorem.sentence,
  feed_id: feed.id,
  feedly_id: "feedlyid",
  published: 1406548800,
  fb_share_count: rand(2000),
  fb_like_count: rand(2000),
  fb_comment_count: rand(1000),
  twitter_count: rand(2000),
  reddit_score: rand(3000),
  reddit_comment_count: rand(50)
  )
end

50.times do
Article.create(
  canonical_url: Faker::Internet.url,
  site_url: "http://google.com",
  visual_url: "https://blog.compete.com/wp-content/uploads/2013/04/cats-1.jpg",
  visual_height: 1366,
  visual_width: 750,
  author: Faker::Name.name,
  title: Faker::Lorem.sentence,
  keywords: "cats, gaga, xxx",
  summary: Faker::Lorem.sentence,
  feed_id: feed2.id,
  feedly_id: "feedlyid",
  published: 1406534400,
  fb_share_count: rand(2000),
  fb_like_count: rand(2000),
  fb_comment_count: rand(1000),
  twitter_count: rand(2000),
  reddit_score: rand(3000),
  reddit_comment_count: rand(100)
  )
end