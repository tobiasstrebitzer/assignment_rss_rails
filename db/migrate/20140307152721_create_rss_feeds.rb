class CreateRssFeeds < ActiveRecord::Migration
  def change
    create_table :rss_feeds do |t|
      t.string :feed_id
      t.string :url
      t.string :title
      t.string :link
      t.datetime :rss_updated
      t.text :cache

      t.timestamps
    end
  end
end
