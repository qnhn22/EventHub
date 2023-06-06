class Event < ApplicationRecord
    belongs_to :creater, foreign_key: "user_id", class_name: "User"
    has_many :user_attendances
    has_many :attendees, through: :user_attendances, source: :attendee
end
