FactoryGirl.define do
  factory :user do
    email {Faker::Internet.email}
    password {Faker::Internet.password(8)}

    factory :user_with_feeds do
      after(:create) do |user|
        create_list(:feeds, 15, user: user)
      end
    end
  end

  factory :feed do
    name {"Engadget"}
    url {"http://www.engadget.com"}
    feedly_feed_id {"feed/http://feeds.engadget.com/weblogsinc/engadget"}
    num_subscribers {427}

    # factory :feed_with_users do
    #   after(:create) do |feed|
    #     create_list(:user, 5, feeds: feed)
    #   end
    # end

    # factory :feed_with_articles do
    #   after(:create) do |feed|
    #     create_list(:article, 20, feeds: feed)
    #   end
    # end
  end

  factory :subscription do
    user
    feed
  end

  factory :article do
    canonical_url { "http://google.com/thisarticle"}
    site_url { "http://google.com"}
    visual_url { "http://www.mostbeautifulthings.net/wp-content/uploads/2014/04/sweet-cats-15.jpg"}
    visual_height { 1366}
    visual_width { 750}
    author { "Lady Gaga"}
    title { "Lady goes GaGa"}
    keywords { "cats, gaga, xxx"}
    summary { "<p>lore ummmmm ipsummmmmmmmmmmm</p>"}
    feedly_id { "feedlyid"}
    published { 22222222222222}
    fb_share_count { 27}
    fb_like_count { 911}
    fb_comment_count { 666}
    twitter_count { 45}
    reddit_score { 23}
    reddit_comment_count { 34}
    calculated_rank {2}

    factory :article_with_feed do
      feed
    end

  end

end #last
