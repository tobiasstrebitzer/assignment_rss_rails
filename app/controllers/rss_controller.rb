require 'uri'
require 'assignment_rss'

class RssController < ActionController::Base
  layout "application"
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  def index
    # Nothing to do here
  end
  
  def fetch
    
    # Prepare parameters
    rss_url = params[:rss_url].blank? ? "http://weblog.rubyonrails.org/feed/atom.xml" : params[:rss_url]
    
    # begin
      # Validate rss_url for being a valid HTTP URL
      if URI.parse(rss_url).kind_of?(URI::HTTP)
        # Fetch RSS- Feed data source (rss_url, cache-duration, feed-model, feed-entry-model)
        source = AssignmentRss::Source.new(rss_url, 10.minutes, RssFeed, RssFeedEntry)
        # Fetch feed from data source
        @feed = source.get_feed
        # Render view
        return render 'fetch'
      end
    # rescue Exception => e
      # In case any errors occur, we assume that it's due to an invalid http url OR not a valid RSS data source
    # end
    
    # Render index view with error notification
    @error = "This is not a valid RSS Feed"
    render 'index'
    
  end
  
end
