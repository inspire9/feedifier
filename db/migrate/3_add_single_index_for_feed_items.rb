class AddSingleIndexForFeedItems < ActiveRecord::Migration
  def change
    add_index :feedifier_feed_items, [:feedifier_feed_id, :happened_at],
      order: {happened_at: :desc}
  end
end
