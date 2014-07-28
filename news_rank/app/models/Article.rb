class Article < ActiveRecord::Base
  belongs_to :feed
  validates :canonical_url, uniqueness: true

  def calculated_rank

  end

  # private

  def normalize_reddit_score
    raw_score = self.reddit_score
    p_val = 1
    r_val = 1
    exponentiate(p_val, r_val, raw_score)
  end

  def normalize_reddit_comments
    raw_score = self.reddit_comment_count
    p_val = 1
    r_val = 1
    exponentiate(p_val, r_val, raw_score)
  end

  def normalize_twitter_count
    raw_score = self.twitter_count
    p_val = 1
    r_val = 1
    exponentiate(p_val, r_val, raw_score)
  end

  def normalize_fb_share_count
    p_val = 1
    r_val = 1
    exponentiate(p_val, r_val, raw_score)
  end

  def normalize_fb_like_count
    p_val = 1
    r_val = 1
    exponentiate(p_val, r_val, raw_score)
  end

  def normalize_fb_comment_count
    p_val = 1
    r_val = 1
    exponentiate(p_val, r_val, raw_score)
  end

  def exponentiate(p_val, r_val, raw_val)
    p_val*Math.exp(r_val*raw_score)
  end

  def time_decay_factor
    time_published = Time.at(self.published).to_datetime
    now = DateTime.now
    hours_since = (now - time_published)*24*60
    decay = 1/(hours_since+2)
  end

2338887377/5400000000

 # t.integer  "fb_share_count"
 #    t.integer  "fb_like_count"
 #    t.integer  "fb_comment_count"
 #    t.integer  "twitter_count"
 #    t.integer  "reddit_score"
 #    t.integer  "reddit_comment_count"
end


# reddit_score
# log(score) + time/45000

# HN Time decay
# points / (t + 2)^1.5
