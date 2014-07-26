require 'nokogiri'
require 'open-uri'
require 'csv'

module SubredditParser
  @@rows = []
  @@titles = []
  LAST_PAGE = 5

  def self.save_list(filename)
    self.parse_all_urls
    self.write_to_csv(filename)
  end

  def self.parse_all_urls
    urls = self.get_subreddit_urls
    urls.each do |url|
      page = Nokogiri::HTML(open(url))
      self.add_rows(page)
    end
    self.add_titles
  end

  def self.write_to_csv(filename)
    CSV.open(filename, "wb") do |csv|
      @@titles.each do |title|
        csv << [title]
      end
    end
  end

  def self.get_subreddit_urls
    urls = []
    pages = (1..LAST_PAGE).to_a

    pages.each do |page_num|
      urls << "http://redditlist.com/page-#{page_num}"
    end
    urls
  end

  def self.parse_file(webpage)
    self.get_rows(webpage)
    self.get_titles
    @@titles
  end

  def self.add_rows(webpage)
    webpage.css('div#yw1 table td').each do |td|
      @@rows << td.content
    end
  end

  def self.add_titles
    (1..@@rows.length).step(3) do |i|
      @@titles <<  @@rows[i]
    end
    @@titles
  end

end


SubredditParser.save_list('lib/tasks/subreddits.csv')
# p SubredditParser.parse_all_urls
