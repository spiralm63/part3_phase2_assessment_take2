class Event < ActiveRecord::Base
  has_many :event_attendances
  has_many :atttendees, through: :event_attendances, source: :user
  belongs_to :creator, class_name: "User", foreign_key: :user_id

end
