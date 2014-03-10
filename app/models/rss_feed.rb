class RssFeed < ActiveRecord::Base
  has_many :rss_feed_entries
  
end
