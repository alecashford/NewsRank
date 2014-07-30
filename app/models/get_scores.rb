# module GetScores
#   class FacebookFetcher
# <<<<<<< HEAD
#     def initialize(url)
#       @url = url
#     end

#     def scores
#       {
#         likes:    fetch[0]["like_count"],
#         comments: fetch[0]["comment_count"],
#         shares:   fetch[0]["share_count"]
#       }
#     end

#     def fetch
#       HTTParty.get("http://api.facebook.com/restserver.php?method=links.getStats&format=json&urls=#{@url}")
# =======
#     attr_reader :shares, :likes, :comments, :total, :urls, :scores
#     def initialize(*urls)
#       @urls = urls.join(",")
#       begin
#         @fb_response = HTTParty.get("http://api.facebook.com/restserver.php?method=links.getStats&format=json&urls=#{@urls}")
#       rescue
#         return
#       end
#       @scores = {}
#       loop_through_scores
#     end

#     def total
#       @likes + @comments + @shares
#     end

#     def loop_through_scores
#       @fb_response.each do |article|
#         url = article["url"]
#         likes = article["like_count"]
#         comments = article["comment_count"]
#         shares = article["share_count"]
#         @scores.merge!(url => {:likes => likes, :comments => comments, :shares => shares})
#       end
# >>>>>>> master
#     end
#   end

#   class TwitterFetcher
#     def initialize(url)
# <<<<<<< HEAD
#       @url = url
#     end

#     def count
#       fetch["count"]
#     end

#     def fetch
#       tw_response = HTTParty.get("http://cdn.api.twitter.com/1/urls/count.json?url=#{@url}")
# =======
#       begin
#         tw_response = HTTParty.get("http://cdn.api.twitter.com/1/urls/count.json?url=#{url}")
#       rescue
#         return
#       end
#       @count = tw_response["count"]
# >>>>>>> master
#     end
#   end

#   class RedditFetcher
#     attr_reader
#     def initialize(url)
# <<<<<<< HEAD
#       @url = url
#     end

#     def fetch
#       begin
#       response = HTTParty.get("http://www.reddit.com/api/info.json?url=#{@url}")
#       rescue
#         nil
#       end
#     end

#     def scores
#       if fetch
#         score = 0
#         num_comments = 0
#         fetch["data"]["children"].each do |article|
#           score += article["data"]["score"]
#           num_comments += article["data"]["num_comments"]
#         end
# =======
#       begin
#         @rd_response = HTTParty.get("http://www.reddit.com/api/info.json?url=#{url}")
#       rescue
#         return
#       end
#       @score = 0
#       @num_comments = 0
#       scrape_scores
#     end
#     def scrape_scores
#       @rd_response["data"]["children"].each do |article|
#         @score += article["data"]["score"]
#         @num_comments += article["data"]["num_comments"]
# >>>>>>> master
#       end
#       {
#         score: score,
#         num_comments: num_comments
#       }
#     end
#   end
# end
