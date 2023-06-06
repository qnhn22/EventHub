class UserAttendance < ApplicationRecord
    enum status: { invited: 0, accepted: 1 }
    belongs_to :attendee, foreign_key: "user_id", class_name: "User"
    belongs_to :attended_event, foreign_key: "event_id", class_name: "Event"
end
