class Feedifier::FeedItem < ActiveRecord::Base
  self.table_name = 'feedifier_feed_items'

  belongs_to :feed, class_name: 'Feedifier::Feed',
    foreign_key: :feedifier_feed_id
  belongs_to :event, class_name: 'Eventifier::Event',
    foreign_key: :eventifier_event_id

  validates :feed,                presence: true
  validates :event,               presence: true
  validates :happened_at,         presence: true
  validates :eventifier_event_id, uniqueness: {scope: :feedifier_feed_id}

  scope :for_user, lambda { |user|
    where user_type: user.class.name, user_id: user.id
  }
end
