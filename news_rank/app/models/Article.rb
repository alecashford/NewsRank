class Article < ActiveRecord::Base
  belongs_to :feed
  validates :canonical_url, uniqueness: true

REDDIT_WEIGHT = 0.4
FB_LIKE_WEIGHT = 0.1
FB_SHARE_WEIGHT = 0.2
TWITTER_WEIGHT = 0.3

  def calculate_rank
    reddit_score = normalize_reddit_score
    twitter_score = normalize_twitter_count
    fb_share_score = normalize_fb_share_count
    fb_like_score = normalize_fb_like_count
    # fb_comment_score = normalize_fb_comment_count
    final_score = REDDIT_WEIGHT*reddit_score+FB_SHARE_WEIGHT*fb_share_score+FB_LIKE_WEIGHT*fb_like_score+TWITTER_WEIGHT*twitter_score
    self.calculated_rank = final_score
  end

  # private

  def normalize_reddit_score
    raw_score = self.reddit_score
    p_val = 2.5722299483384*10**-6 #4.57409E-06
    r_val = 21.0227404222522
    percentile(p_val, r_val, raw_score)
  end

  # def normalize_reddit_comments
  #   raw_score = self.reddit_comment_count
  #   p_val = 4.57409*10**-6 #4.57409E-06
  #   r_val = 1
  #   percentile(p_val, r_val, raw_score)
  # end

  def normalize_twitter_count
    raw_score = self.twitter_count
    p_val = 4.57409*10**-6 #4.57409E-06
    r_val = 21.0232094852343
    percentile(p_val, r_val, raw_score)
  end

  def normalize_fb_share_count
    raw_score = self.fb_share_count
    p_val = 1.82200271500748*10**-6 #4.57409E-06
    r_val = 22.0222204349218
    percentile(p_val, r_val, raw_score)
  end

  def normalize_fb_like_count
    raw_score = self.fb_like_count
    p_val = 6.3528910358755*10**-7
    r_val = 24.0204797504855
    percentile(p_val, r_val, raw_score)
  end

  # def normalize_fb_comment_count
  #   p_val = 4.57409*10**-6 #4.57409E-06
  #   r_val = 1
  #   percentile(p_val, r_val, raw_score)
  # end

  def percentile(p_val, r_val, raw_val)
    base = Math::E # for natural log
    Math.log(raw_val/p_val, base)/r_val
  end

  def time_decay_factor
    time_published = Time.at(self.published).to_datetime
    now = DateTime.now
    hours_since = (now - time_published)*24*60
    decay = 1/(hours_since+2)
  end

end


# reddit_score
# log(score) + time/45000

# HN Time decay
# points / (t + 2)^1.5
