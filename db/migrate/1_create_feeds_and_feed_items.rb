class CreateFeedsAndFeedItems < ActiveRecord::Migration
  def change
    create_table :feedifier_feeds do |t|
      t.string  :name,            null: false
      t.string  :feedable_type
      t.integer :feedable_id
      t.timestamps null: false
    end

    add_index :feedifier_feeds, [:name, :feedable_type, :feedable_id],
      unique: true

    create_table :feedifier_feed_items do |t|
      t.integer  :feedifier_feed_id,   null: false
      t.integer  :eventifier_event_id, null: false
      t.string   :user_type
      t.integer  :user_id
      t.datetime :happened_at,         null: false
      t.timestamps null: false
    end

    add_index :feedifier_feed_items, :feedifier_feed_id
    add_index :feedifier_feed_items,
      [:feedifier_feed_id, :eventifier_event_id], unique: true,
      name: :unique_feed_items
    add_index :feedifier_feed_items, [:user_type, :user_id]
    add_index :feedifier_feed_items, :happened_at, order: {happened_at: :desc}
  end
end
