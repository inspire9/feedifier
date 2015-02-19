class AddDetailToFeedItems < ActiveRecord::Migration
  def change
    add_column :feedifier_feed_items, :detail, :json, default: {}
  end
end
