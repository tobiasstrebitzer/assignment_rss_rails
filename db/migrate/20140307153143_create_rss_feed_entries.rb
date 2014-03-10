class CreateRssFeedEntries < ActiveRecord::Migration
  def change
    create_table :rss_feed_entries do |t|
      t.string :entry_id
      t.string :title
      t.string :author
      t.string :link
      t.datetime :rss_updated
      t.text :content
      t.references :rss_feed, index: true

      t.timestamps
    end
  end
end
