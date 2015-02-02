class Feedifier::Feed < ActiveRecord::Base
  self.table_name = 'feedifier_feeds'

  belongs_to :feedable, polymorphic: true
  has_many :feed_items, class_name: 'Feedifier::FeedItem',
    foreign_key: :feedifier_feed_id, dependent: :destroy

  validates :name, presence:   true,
                   uniqueness: {scope: [:feedable_type, :feedable_id]}

  scope :for_names, lambda { |names| where name: names }
end
